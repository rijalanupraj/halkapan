# External Import
from comments.models import Comment
from django.shortcuts import render, redirect
from django.urls import reverse
from django.views.generic import (
    ListView,
    DetailView,
    CreateView,
    UpdateView,
    DeleteView
)
from django.contrib.auth.mixins import (
    LoginRequiredMixin,
    UserPassesTestMixin,
)
from django.contrib.auth.mixins import PermissionRequiredMixin

from django.contrib.auth import get_user_model
from .forms import *
from tags.models import Tag
# Internal Import
from .decorators import *
from posts.models import Post
UserModel = get_user_model()


@admin_only
def dashboard(request):
    post_count = Post.objects.all().count()
    likes_count = 0
    for post in Post.objects.all():
        likes_count += post.likes.all().count()
    user_count = Profile.objects.all().count()
    featured_post = Post.objects.featured()[:6]
    user = set()
    for post in Post.objects.all().order_by("likes"):
        user.add(post.author)
    author = set()
    for post in Post.objects.all():
        author.add(post.author)
    author_count = len(author)
    comment_count = Comment.objects.all().count()

    context = {
        'post_count': post_count,
        'likes_count': likes_count,
        'user_count': user_count,
        'author_count': author_count,
        'comment_count': comment_count,
    }
    return render(request, 'myadmin/dashboard.html', context)


@admin_only
def create_user(request):
    u_form = UserUpdateForm(request.POST or None)
    if request.method == 'POST':
        if u_form.is_valid():
            password = u_form.cleaned_data['password']
            user = u_form.save(commit=False)
            user.set_password(password)
            user.save()
            return redirect('myadmin:users-list')
    context = {
        'u_form': u_form,
    }
    return render(request, 'myadmin/create-user-form.html', context)


class UserListView(UserPassesTestMixin, LoginRequiredMixin, ListView):
    template_name = "myadmin/admin-users-view.html"

    def test_func(self):
        return self.request.user.is_staff or self.request.user.is_superuser

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        query = self.request.GET.get('q')
        if query is not None:
            context["query"] = query
        return context

    def get_queryset(self):
        request = self.request
        method_dict = request.GET
        query = method_dict.get('q', None)
        userQuerySet = UserModel.objects.all()
        if query and query != '':
            userQuerySet = userQuerySet.filter(
                username__icontains=query)
        return userQuerySet


@admin_only
def update_user(request, username):
    user = User.objects.get(username=username)
    if request.method == 'POST':
        p_form = ProfileUpdateForm(
            request.POST, request.FILES, instance=user.profile)
        u_form = UserUpdateForm(request.POST, instance=user)
        if p_form.is_valid() and u_form.is_valid():
            password = u_form.cleaned_data['password']
            user = u_form.save(commit=False)
            user.set_password(password)
            p_form.save()
            user.save()
            return redirect('myadmin:users-list')
    else:
        p_form = ProfileUpdateForm(instance=user.profile)
        u_form = UserUpdateForm(instance=user)

    context = {'p_form': p_form, 'u_form': u_form}
    return render(request, 'myadmin/profile-update.html', context)


@admin_only
def delete_user(request, username):
    user = UserModel.objects.get(username=username)
    user.delete()
    return redirect('myadmin:users-list')


@admin_only
def make_staff(request, username):
    user = UserModel.objects.get(username=username)
    user.is_staff = True
    user.save()
    return redirect('myadmin:users-list')


@admin_only
def make_normal_user(request, username):
    user = UserModel.objects.get(username=username)
    user.is_staff = False
    user.is_admin = False
    user.is_superuser = False
    user.save()
    return redirect('myadmin:users-list')


class AdminPostListView(UserPassesTestMixin, ListView):
    model = Post
    template_name = "myadmin/admin-post-view.html"

    def test_func(self):
        return self.request.user.is_staff or self.request.user.is_superuser

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        query = self.request.GET.get('q')
        if query is not None:
            context["query"] = query
        return context

    def get_queryset(self):
        request = self.request
        method_dict = request.GET
        query = method_dict.get('q', None)
        postQuerySet = Post.objects.foradmin()
        if query and query != '':
            return Post.objects.search(query)
        return postQuerySet


@admin_only
def delete_post(request, id):
    post = Post.objects.get(id=id)
    post.delete()
    return redirect('myadmin:posts-list')


@admin_only
def update_post(request, id):
    product = Post.objects.get(id=id)
    if request.method == 'POST':
        form = PostForm(request.POST, request.FILES, instance=product)
        if form.is_valid():
            form.save()

            return redirect('myadmin:posts-list')
    context = {
        'form': PostForm(instance=product)
    }
    return render(request, 'myadmin/post-update-form.html', context)


@admin_only
def approve_post(self, id):
    post = Post.objects.get(id=id)
    post.active = True
    post.save()
    return redirect('myadmin:posts-list')


@admin_only
def disapprove_post(self, id):
    post = Post.objects.get(id=id)
    post.active = False
    post.save()
    return redirect('myadmin:posts-list')


class AdminCommentListView(UserPassesTestMixin, ListView):
    model = Comment
    template_name = "myadmin/admin-comment-view.html"

    def test_func(self):
        return self.request.user.is_staff or self.request.user.is_superuser

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        query = self.request.GET.get('q')
        if query is not None:
            context["query"] = query
        return context

    def get_queryset(self):
        request = self.request
        method_dict = request.GET
        query = method_dict.get('q', None)
        QuerySet = Comment.objects.all()
        if query and query != '':
            QuerySet = QuerySet.filter(
                content__icontains=query)
        return QuerySet


@admin_only
def update_comment(request, id):
    comment = Comment.objects.get(id=id)
    if request.method == 'POST':
        form = CommentAdminForm(request.POST, request.FILES, instance=comment)
        if form.is_valid():
            form.save()

            return redirect('myadmin:comments-list')
    context = {
        'form': CommentAdminForm(instance=comment)
    }
    return render(request, 'myadmin/comment-update-form.html', context)


@admin_only
def delete_comment(request, id):
    comment = Comment.objects.get(id=id)
    comment.delete()
    return redirect('mydamin:comments-list')


@admin_only
def create_tag(request):
    form = TagAdminForm(request.POST or None)
    if request.method == 'POST':
        if form.is_valid():
            form.save()
            return redirect('myadmin:tags-list')
    context = {
        'form': form
    }
    return render(request, 'myadmin/tag-create-form.html', context)


class AdminTagListView(UserPassesTestMixin, ListView):
    model = Tag
    template_name = "myadmin/admin-tag-view.html"

    def test_func(self):
        return self.request.user.is_staff or self.request.user.is_superuser

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        query = self.request.GET.get('q')
        if query is not None:
            context["query"] = query
        return context

    def get_queryset(self):
        request = self.request
        method_dict = request.GET
        query = method_dict.get('q', None)
        QuerySet = Tag.objects.all()
        if query and query != '':
            QuerySet = QuerySet.filter(
                title__icontains=query)
        return QuerySet


def admin_tag_list(request):
    tag = Tag.objects.all()
    template_name = "myadmin/admin-tag-view.html"
    context = {
        'object_list': tag,
    }
    return render(request, template_name, context)


@admin_only
def update_tag(request, id):
    tag = Tag.objects.get(id=id)
    if request.method == 'POST':
        form = TagAdminForm(request.POST, request.FILES, instance=tag)
        if form.is_valid():
            form.save()

            return redirect('myadmin:tags-list')
    context = {
        'form': TagAdminForm(instance=tag)
    }
    return render(request, 'myadmin/tag-update-form.html', context)


@admin_only
def delete_tag(request, id):
    tag = Tag.objects.get(id=id)
    tag.delete()
    return redirect('myadmin:tags-list')


@admin_only
def author_list_page(request):
    user = set()
    for post in Post.objects.all():
        user.add(post.author)

    user = list(user)
    context = {
        'object_list': user,
    }
    return render(request, 'myadmin/admin-authors-view.html', context)
