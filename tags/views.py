# External Import
from django.shortcuts import render, get_object_or_404, redirect
from django.views.generic import ListView
from django.contrib.auth.mixins import (
    LoginRequiredMixin,
    UserPassesTestMixin
)
# In
# Internal Import
from .models import Tag
from posts.models import Post


class PostTagListView(UserPassesTestMixin, ListView):
    template_name = "tags/tag-list-view.html"

    def get_queryset(self):
        tag = get_object_or_404(Tag, slug=self.kwargs['slug'])
        return Post.objects.all().filter(tags=tag)

    def test_func(self):
        return not self.request.user.is_staff

    def handle_no_permission(self):
        return redirect('myadmin:admin-dashboard')
