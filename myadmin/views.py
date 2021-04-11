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
from .decorators import *

UserModel = get_user_model()


def dashboard(request):
    return render(request, 'myadmin/dashboard.html')


class UserListView(ListView, PermissionRequiredMixin):
    permission_required = 'is_staff'
    template_name = "myadmin/admin-users-view.html"

    def get_queryset(self):
        return UserModel.objects.all()


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
