# External Import
from django.shortcuts import render
from django.views.generic import ListView, DetailView

# Internal Import
from . import models


class AllUserProfileListView(ListView):
    """List View Of All the Users"""
    model = models.Profile
    template_name = 'userprofile/all_user_profile.html'

    def get_queryset(self):
        if self.request.user.is_authenticated:
            return models.Profile.objects.all().exclude(user=self.request.user)
        else:
            return models.Profile.objects.all()
