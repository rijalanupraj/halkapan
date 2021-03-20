# External Import
from django.urls import path

# Internal Import
from . import views

# App Name
app_name = 'posts'

urlpatterns = [
    path('feed/', views.PostListView.as_view(), name='feed'),
    path('<str:slug>/', views.PostDetailView.as_view(), name='post-detail')
]
