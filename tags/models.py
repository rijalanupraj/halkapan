# External Import
from django.db import models
from django.db.models.signals import pre_save
from django.urls import reverse

# Internal Import
from posts.utils import unique_slug_generator
from posts.models import Post


class Tag(models.Model):
    title = models.CharField(max_length=150)
    slug = models.SlugField(blank=True)
    timestamp = models.DateTimeField(auto_now_add=True)
    active = models.BooleanField(default=True)
    posts = models.ManyToManyField(Post, blank=True)

    def __str__(self):
        return f"{self.title}"


def tag_pre_save_receiver(sender, instance, *args, **kwargs):
    if not instance.slug:
        instance.slug = unique_slug_generator(instance)


# Connecting pre_save_receiver function and sender Post
pre_save.connect(tag_pre_save_receiver, sender=Tag)
