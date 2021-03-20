from django.db import models
from django.conf import settings
from django.urls import reverse
from django.utils import timezone
from django.db.models.signals import pre_save
import os
import random

# Create your models here.
from .utils import unique_slug_generator


def get_filename_ext(filepath):
    base_name = os.path.basename(filepath)
    name, ext = os.path.splitext(base_name)
    return name, ext


def upload_image_path(instance, filename):
    new_filename = random.randint(1, 3910209312)
    name, ext = get_filename_ext(filename)
    final_filename = f'{new_filename}{ext}'
    return f"posts/{new_filename}/{final_filename}"


class PostQuerySet(models.query.QuerySet):
    def featured(self):
        return self.filter(featured=True, active=True, draft=False).distinct()

    def active(self):
        return self.filter(active=True, draft=False).distinct()

    def draft(self):
        return self.filter(draft=True)


class PostManager(models.Manager):

    def get_queryset(self):
        return PostQuerySet(self.model, using=self._db)

    def all(self):
        return self.get_queryset().active()

    def featured(self):
        return self.get_queryset().featured()

    def drafted(self):
        return self.get_queryset().draft()


class Post(models.Model):
    author = models.ForeignKey(settings.AUTH_USER_MODEL,
                               on_delete=models.CASCADE)
    title = models.CharField(max_length=120)
    slug = models.SlugField(unique=True, blank=True, null=True)
    content = models.TextField()
    updated = models.DateTimeField(auto_now=True, auto_now_add=False)
    timestamp = models.DateTimeField(auto_now=False, auto_now_add=True)
    active = models.BooleanField(default=False)
    draft = models.BooleanField(default=False)
    featured = models.BooleanField(default=False)
    image = models.ImageField(upload_to=upload_image_path,
                              null=True, blank=True)

    objects = PostManager()

    def get_absolute_url(self):
        return reverse("posts:post-detail", kwargs={"slug": self.slug})

    def __str__(self):
        return self.title


def post_pre_save_receiver(sender, instance, *args, **kwargs):
    if not instance.slug:
        instance.slug = unique_slug_generator(instance)


# Connecting pre_save_receiver function and sender Post
pre_save.connect(post_pre_save_receiver, sender=Post)
