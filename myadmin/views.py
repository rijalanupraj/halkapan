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
    UserPassesTestMixin,
)
from django.contrib.auth.mixins import PermissionRequiredMixin

from django.contrib.auth import get_user_model
from .forms import *

# Internal Import
from .decorators import *
from posts.models import Post
UserModel = get_user_model()


def dashboard(request):
    return render(request, 'myadmin/dashboard.html')


class UserListView(ListView, PermissionRequiredMixin):
    permission_required = 'is_staff'
    template_name = "myadmin/admin-users-view.html"

    def get_queryset(self):
        return UserModel.objects.all()


@admin_only
def update_user(request, username):
    user = User.objects.get(username=username)
    if request.method == 'POST':
        p_form = ProfileUpdateForm(
            request.POST, request.FILES, instance=user.profile)
        u_form = UserUpdateForm(request.POST, instance=user)
        if p_form.is_valid() and u_form.is_valid():
            u_form.save()
            p_form.save()
            return redirect('/myadmin/users')
    else:
        p_form = ProfileUpdateForm(instance=user.profile)
        u_form = UserUpdateForm(instance=user)

    context = {'p_form': p_form, 'u_form': u_form}
    return render(request, 'myadmin/profile-update.html', context)


@admin_only
def delete_user(request, username):
    user = UserModel.objects.get(username=username)
    user.delete()
    return redirect('/myadmin/users')


@admin_only
def make_staff(request, username):
    user = UserModel.objects.get(username=username)
    user.is_staff = True
    user.save()
    return redirect('/myadmin/users')


@admin_only
def make_normal_user(request, username):
    user = UserModel.objects.get(username=username)
    user.is_staff = False
    user.is_admin = False
    user.is_superuser = False
    user.save()
    return redirect('/myadmin/users')


class AdminPostListView(ListView, PermissionRequiredMixin):
    model = Post
    permission_required = 'is_staff'
    template_name = "myadmin/admin-post-view.html"

    def get_queryset(self):
        return Post.objects.foradmin()


@admin_only
def delete_post(request, id):
    post = Post.objects.get(id=id)
    post.delete()
    return redirect('/myadmin/posts')


@admin_only
def update_post(request, id):
    product = Post.objects.get(id=id)
    if request.method == 'POST':
        form = PostForm(request.POST, request.FILES, instance=product)
        if form.is_valid():
            form.save()

            return redirect('/myadmin/posts')
    context = {
        'form': PostForm(instance=product)
    }
    return render(request, 'myadmin/post-update-form.html', context)


# class AdminPostUpdateView(LoginRequiredMixin, UserPassesTestMixin, UpdateView):
#     model = Post
#     fields = ['author', 'title', 'content',
#               'draft', 'anonymous', 'image', 'is_active']
#     template_name = "myadmin/post-update-form.html"

#     def test_func(self):
#         # post = self.get_object()
#         # if self.request.user.is_staff:
#         #     return True
#         return True


@admin_only
def approve_post(self, id):
    post = Post.objects.get(id=id)
    post.is_active = True
    post.save()
    return redirect('/myadmin/posts')


@admin_only
def disapprove_post(self, id):
    post = Post.objects.get(id=id)
    post.is_active = False
    post.save()
    return redirect('/myadmin/posts')
