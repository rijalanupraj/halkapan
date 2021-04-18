# External Import
from django.shortcuts import render, HttpResponse, redirect
from django.views.generic import ListView, DetailView
from django.contrib.auth import get_user_model
import json
from django.contrib.auth.decorators import login_required

# Internal Import
from . import models
from posts.models import Post
from .forms import UserUpdateForm, ProfileUpdateForm

User = get_user_model()


class AllUserProfileListView(ListView):
    """List View Of All the Users"""
    model = models.Profile
    template_name = 'userprofile/all_user_profile.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        query = self.request.GET.get('username')
        if query is not None:
            context["query"] = query
        return context

    def get_queryset(self):
        request = self.request
        method_dict = request.GET
        query = method_dict.get('username', None)
        profilesQuerySet = models.Profile.objects.all().exclude(user__is_staff=True)
        if request.user.is_authenticated:
            profilesQuerySet = profilesQuerySet.exclude(user=request.user)
        if query and query != '':
            profilesQuerySet = profilesQuerySet.filter(
                user__username__icontains=query)
        return profilesQuerySet


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
        request = self.request
        username = self.kwargs['username']
        author = User.objects.get(username=username)
        user_posts = Post.objects.all().filter(
            author__user__username=username).filter(anonymous=False).distinct()
        user_follows = False
        if self.request.user.is_authenticated:
            user_follows = author.followers.all().filter(
                user=self.request.user).exists()
        context['user_follows'] = user_follows
        context['user_posts'] = user_posts
        return context


@login_required
def follow_toggle(request, username):
    current_user = request.user
    user_to_follow = User.objects.get(username=username)

    is_following = False
    if user_to_follow in current_user.profile.following.all():
        current_user.profile.following.remove(user_to_follow)
    else:
        current_user.profile.following.add(user_to_follow)
        is_following = True

    resp = {
        "following": is_following,
    }

    response = json.dumps(resp)
    return HttpResponse(response, content_type="application/json")


@login_required
def update_profile(request):
    if request.method == 'POST':
        u_form = UserUpdateForm(request.POST, instance=request.user)
        p_form = ProfileUpdateForm(
            request.POST, request.FILES, instance=request.user.profile)

        if u_form.is_valid() and p_form.is_valid():
            u_form.save()
            p_form.save()
            return redirect('login')

    else:
        u_form = UserUpdateForm(instance=request.user)
        p_form = ProfileUpdateForm(instance=request.user.profile)

    context = {
        'u_form': u_form,
        'p_form': p_form,
    }
    return render(request, 'userprofile/update-profile.html', context)
