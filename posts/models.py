from django.db import models
from django.urls import reverse
from django.utils import timezone
from django.db.models.signals import pre_save
import os
import random
from django.db.models import Q
from ckeditor.fields import RichTextField

# Create your models here.
from .utils import unique_slug_generator
from userprofile.models import Profile


def get_filename_ext(filepath):
    base_name = os.path.basename(filepath)
    name, ext = os.path.splitext(base_name)
    return name, ext


def upload_image_path(instance, filename):
    foldername = random.randint(1, 3910209312)
    new_filename = random.randint(1, 3910209312)
    name, ext = get_filename_ext(filename)
    final_filename = f'{new_filename}{ext}'
    return f"posts/{foldername}/{final_filename}"


class PostQuerySet(models.query.QuerySet):

    def admin(self):
        return self.all()

    def featured(self):
        return self.filter(featured=True, active=True, draft=False).distinct()

    def active(self):
        return self.filter(active=True, draft=False).distinct()

    def draft(self):
        return self.filter(draft=True)

    def search(self, query):
        lookups = Q(title__icontains=query)
        return self.filter(lookups).distinct()


class PostManager(models.Manager):

    def get_queryset(self):
        return PostQuerySet(self.model, using=self._db)

    def all(self):
        return self.get_queryset().active()

    def featured(self):
        return self.get_queryset().featured()

    def drafted(self):
        return self.get_queryset().draft()

    def search(self, query):
        return self.get_queryset().active().search(query)

    def foradmin(self):
        return self.get_queryset().admin()


class Post(models.Model):
    author = models.ForeignKey(Profile,
                               on_delete=models.CASCADE)
    title = models.CharField(max_length=120)
    slug = models.SlugField(unique=True, blank=True, null=True)
    content = RichTextField()
    updated = models.DateTimeField(auto_now=True, auto_now_add=False)
    timestamp = models.DateTimeField(auto_now=False, auto_now_add=True)
    active = models.BooleanField(default=True)
    draft = models.BooleanField(default=False)
    featured = models.BooleanField(default=False)
    anonymous = models.BooleanField(default=False)
    image = models.ImageField(upload_to=upload_image_path,
                              null=True, blank=True)
    likes = models.ManyToManyField(
        Profile, related_name='likes', null=True, blank=True)

    objects = PostManager()

    class Meta:
        ordering = ['-timestamp']

    def __str__(self):
        return self.title

    def get_absolute_url(self):
        return reverse("posts:post-detail", kwargs={"slug": self.slug})

    def get_number_of_likes(self):
        return self.likes.count()


def post_pre_save_receiver(sender, instance, *args, **kwargs):
    instance.slug = unique_slug_generator(instance)


# Connecting pre_save_receiver function and sender Post
pre_save.connect(post_pre_save_receiver, sender=Post)
