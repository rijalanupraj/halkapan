# External Import
from django.db.models.signals import post_save, pre_save
from django.conf import settings
from django.dispatch import receiver
import os

# Internal Import
from .models import Profile

User = settings.AUTH_USER_MODEL


@receiver(post_save, sender=User)
def create_profile(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user=instance)


@receiver(post_save, sender=User)
def save_profile(sender, instance, **kwargs):
    instance.profile.save()


@receiver(pre_save, sender=Profile)
def delete_old_file(sender, instance, **kwargs):
    if instance._state.adding and not instance.pk:
        return False

    try:
        old_image = sender.objects.get(pk=instance.pk).image
    except sender.DoesNotExist:
        return False

    if os.path.isfile(old_image.path):
        if not "default-profile-picture.jpg" in old_image.path:
            os.remove(old_image.path)
            print("removed")
