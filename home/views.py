# External Import
from django.shortcuts import render
from django.conf import settings

# Internal Import
from posts.models import Post
from userprofile.models import Profile

User = settings.AUTH_USER_MODEL


def home(request):
    post_count = Post.objects.all().count()
    top_post = Post.objects.all().order_by("likes")[:3]
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
    user = list(user)
    user = user[:4]
    top_post = set(top_post)
    top_post = list(top_post)

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
