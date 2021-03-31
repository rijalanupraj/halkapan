# External Import
from django.shortcuts import render
from django.views.generic import ListView, DetailView
from django.conf import settings

# Internal Import
from . import models
from posts.models import Post

User = settings.AUTH_USER_MODEL


class AllUserProfileListView(ListView):
    """List View Of All the Users"""
    model = models.Profile
    template_name = 'userprofile/all_user_profile.html'

    def get_queryset(self):
        if self.request.user.is_authenticated:
            return models.Profile.objects.all().exclude(user=self.request.user)
        else:
            return models.Profile.objects.all()


class AuthorDetailView(DetailView):

    model = models.Profile
    slug_field = "user__username"
    slug_url_kwarg = "username"
    template_name = "userprofile/author-page.html"

    def get_queryset(self):
        return models.Profile.objects.all().filter(user__is_staff=False)

    def get_context_data(self, *args, **kwargs):
        context = super(AuthorDetailView, self).get_context_data(
            *args, **kwargs)
        print(context)
        request = self.request
        username = self.kwargs['username']
        user_posts = Post.objects.all().filter(
            author__user__username=username).filter(anonymous=False).distinct()
        context['user_posts'] = user_posts
        return context
