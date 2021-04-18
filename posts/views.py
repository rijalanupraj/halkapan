# External Import
from django.shortcuts import render, HttpResponse, get_object_or_404
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
from django.http import HttpResponseRedirect
from django.contrib.contenttypes.models import ContentType
from django.contrib.auth.decorators import login_required
import json

# Internal Import
from .models import Post
from userprofile.models import Profile
from comments.forms import CommentForm
from comments.models import Comment


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

    def post(self, *args, **kwargs):
        comment_form = CommentForm(self.request.POST)
        if comment_form.is_valid():
            c_type = comment_form.cleaned_data.get("content_type")
            content_type = ContentType.objects.get_for_model(Post)
            obj_id = comment_form.cleaned_data.get("object_id")
            content_data = comment_form.cleaned_data.get("content")
            parent_obj = None
            try:
                parent_id = int(self.request.POST.get("parent_id"))
            except:
                parent_id = None

            if parent_id:
                parent_qs = Comment.objects.filter(id=parent_id)
                if parent_qs.exists() and parent_qs.count() == 1:
                    parent_obj = parent_qs.first()

            new_comment, created = Comment.objects.get_or_create(
                user=self.request.user,
                content_type=content_type,
                object_id=obj_id,
                content=content_data,
                parent=parent_obj,
            )
            return HttpResponseRedirect(new_comment.content_object.get_absolute_url())

        else:
            self.object = self.get_object()
            context = super().get_context_data(**kwargs)
            context['comment_form'] = comment_form

            return self.render_to_response(context=context)

    def get_context_data(self, *args, **kwargs):
        context = super(PostDetailView, self).get_context_data(
            *args, **kwargs)
        request = self.request
        slug = self.kwargs['slug']
        instance = get_object_or_404(Post, slug=slug)
        initial_data = {
            "content_type": instance.get_content_type, "object_id": instance.id}
        comment_form = CommentForm(request.POST or None, initial=initial_data)
        comments = instance.comments
        users_other_posts = Post.objects.all().order_by('?')[:3]
        context['comments'] = comments
        context['comment_form'] = comment_form
        # context['users_other_posts'] = users_other_posts
        return context


class PostCreateView(LoginRequiredMixin, CreateView):
    model = Post
    fields = ['title', 'content', 'draft', 'anonymous', 'image', 'tags']
    template_name = "posts/post-create-form.html"

    def form_valid(self, form):
        form.instance.author = self.request.user.profile
        return super().form_valid(form)


class PostUpdateView(LoginRequiredMixin, UserPassesTestMixin, UpdateView):
    model = Post
    fields = ['title', 'content', 'draft', 'anonymous', 'image', 'tags']
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
