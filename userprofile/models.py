# External Import
from django.db import models
from django.contrib.auth import get_user_model
import random
import os
from PIL import Image

# Internal Import
User = get_user_model()


def get_filename_ext(filepath):
    base_name = os.path.basename(filepath)
    name, ext = os.path.splitext(base_name)
    return name, ext


def upload_image_path(instance, filename):
    username = instance.user.username
    name, ext = get_filename_ext(filename)
    final_filename = f'profile-picture{ext}'
    return f"user/profile_pics/{username}/{final_filename}"


class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    image = models.ImageField(
        upload_to=upload_image_path, default="user/profile_pics/default-profile-picture.jpg")
    bio = models.CharField(max_length=250, blank=True, null=True)
    following = models.ManyToManyField(
        User, related_name='followers', blank=True, symmetrical=False)
    created = models.DateTimeField(auto_now_add=True, blank=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.user.username} Profile"

    class Meta:
        ordering = ('-updated',)
