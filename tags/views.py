# External Import
from django.shortcuts import render, get_object_or_404
from django.views.generic import ListView

# Internal Import
from .models import Tag
from posts.models import Post


class PostTagListView(ListView):
    template_name = "tags/tag-list-view.html"

    def get_queryset(self):
        tag = get_object_or_404(Tag, slug=self.kwargs['slug'])
        return Post.objects.all().filter(tag=tag)
