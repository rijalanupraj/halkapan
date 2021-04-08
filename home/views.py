# External Import
from django.shortcuts import render
from django.conf import settings

# Internal Import
from posts.models import Post


User = settings.AUTH_USER_MODEL


def home(request):
    post_count = Post.objects.all().count()
    top_post = Post.objects.all().order_by("likes")[:6]
    likes_count = 0
    for post in Post.objects.all():
        likes_count += post.likes.all().count()
    context = {
        'post_count': post_count,
        'likes_count': likes_count,
        'top_post': top_post,
    }
    return render(request, "home/home.html", context)
