# External Import
from django.shortcuts import render, HttpResponse
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
from django.contrib.auth.decorators import login_required
import json

# Internal Import
from .models import Post
from userprofile.models import Profile


class ExplorePostListView(ListView):
    template_name = "posts/explore.html"
    paginate_by = 1

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


class UserFollowingFeedListView(ListView):
    template_name = "posts/feed.html"
    paginate_by = 1

    def get_queryset(self):
        request = self.request
        if request.user.is_authenticated:
            current_user_profile = Profile.objects.get(user=request.user)
            users = [user.profile for user in current_user_profile.following.all()]
            users.append(current_user_profile)
            return Post.objects.all().filter(author__in=users).distinct()
        else:
            return Post.objects.all().order_by('?')[:20]

    def get_context_data(self, *args, **kwargs):
        context = super(UserFollowingFeedListView,
                        self).get_context_data(*args, **kwargs)
        request = self.request
        featured_post = Post.objects.featured()
        context['featured_post'] = featured_post
        return context


@login_required
def post_like_toggle(request, slug):
    current_user_profile = request.user.profile
    post = Post.objects.get(slug=slug)

    is_liked = False
    if current_user_profile in post.likes.all():
        post.likes.remove(current_user_profile)
    else:
        post.likes.add(current_user_profile)
        is_liked = True

    resp = {
        "isLiked": is_liked,
    }

    response = json.dumps(resp)
    return HttpResponse(response, content_type="application/json")
