# External Import
from django.urls import path

# Internal Import
from . import views

# App Name
app_name = 'posts'

urlpatterns = [
    path('explore/', views.ExplorePostListView.as_view(), name='explore'),
    path('feed/', views.UserFollowingFeedListView.as_view(), name='feed'),
    path('post/new/', views.PostCreateView.as_view(), name='post-create'),
    path('post/<str:slug>/', views.PostDetailView.as_view(), name='post-detail'),
    path('post/<str:slug>/update/',
         views.PostUpdateView.as_view(), name='post-update'),
    path('post/<str:slug>/delete/',
         views.PostDeleteView.as_view(), name='post-delete'),
    path('post/<str:slug>/like/',
         views.post_like_toggle, name='post-like-toggle'),


]
