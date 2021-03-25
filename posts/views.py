# External Import
from django.shortcuts import render
from django.views.generic import (
    ListView,
    DetailView,
    CreateView,
    UpdateView,
    DeleteView
)
from django.contrib.auth.mixins import (
    LoginRequiredMixin,
    UserPassesTestMixin
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
        context = super(ExplorePostListView,
                        self).get_context_data(*args, **kwargs)
        request = self.request
        featured_post = Post.objects.featured()
        context['featured_post'] = featured_post
        return context


class PostDetailView(DetailView):
    queryset = Post.objects.all()
    template_name = "posts/post-detail.html"
    slug_url_kwarg = 'slug'


class PostCreateView(LoginRequiredMixin, CreateView):
    model = Post
    fields = ['title', 'content', 'draft', 'anonymous', 'image']
    template_name = "posts/post-create-form.html"

    def form_valid(self, form):
        form.instance.author = self.request.user.profile
        return super().form_valid(form)


class PostUpdateView(LoginRequiredMixin, UserPassesTestMixin, UpdateView):
    model = Post
    fields = ['title', 'content', 'draft', 'anonymous', 'image']
    template_name = "posts/post-update-form.html"

    def form_valid(self, form):
        form.instance.author = self.request.user.profile
        return super().form_valid(form)

    def test_func(self):
        post = self.get_object()
        if self.request.user == post.author.user or self.request.user.is_staff:
            return True
        return False


class PostDeleteView(LoginRequiredMixin, UserPassesTestMixin, DeleteView):
    model = Post
    success_url = '/'

    def test_func(self):
        post = self.get_object()
        if self.request.user == post.author.user or self.request.user.is_staff:
            return True
        return False
