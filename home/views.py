# External Import
from django.shortcuts import render
from django.conf import settings
from django.contrib import messages
from django.shortcuts import redirect
# Internal Import
from posts.models import Post
from userprofile.models import Profile
from django.db.models import Count
User = settings.AUTH_USER_MODEL


def home(request):
    if request.user.is_staff:
        return redirect("myadmin:admin-dashboard")
    post_count = Post.objects.all().count()
    top_post = Post.objects.all().annotate(l_count=Count('likes')).order_by('-l_count')[:3]
    likes_count = 0
    for post in Post.objects.all():
        likes_count += post.likes.all().count()
    user_count = Profile.objects.all().filter(user__is_staff=0).count()
    featured_post = Post.objects.featured()[:6]
    user = set()
    for post in Post.objects.all().annotate(l_count=Count('likes')).order_by('-l_count'):
        user.add(post.author)
    author = set()
    for post in Post.objects.all():
        author.add(post.author)
    author_count = len(author)
    user = list(user)
    user = user[:4]
    top_post = set(top_post)
    top_post = list(top_post)
    top_post = top_post[:3]
    context = {
        'post_count': post_count,
        'likes_count': likes_count,
        'top_post': top_post,
        'user_count': user_count,
        'featured_post': featured_post,
        'user_profiles': user,
        'author_count': author_count,
    }
    return render(request, "home/home.html", context)
