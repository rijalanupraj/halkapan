# External Import
from django.shortcuts import render
from django.views.generic import (
    ListView,
    DetailView
)

# Internal Import
from .models import Post


class ExplorePostListView(ListView):
    template_name = "posts/explore.html"
    paginate_by = 2

    def get_queryset(self):
        request = self.request
        return Post.objects.all()

    def get_context_data(self, *args, **kwargs):
        context = super(ExplorePostListView, self).get_context_data(*args, **kwargs)
        request = self.request
        featured_post = Post.objects.featured()
        context['featured_post'] = featured_post
        return context


class PostDetailView(DetailView):
    queryset = Post.objects.all()
    template_name = "posts/post-detail.html"
    slug_url_kwarg = 'slug'
