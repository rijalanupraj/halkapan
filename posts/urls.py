# External Import
from django.urls import path

# Internal Import
from . import views

# App Name
app_name = 'posts'

urlpatterns = [
    path('explore/', views.ExplorePostListView.as_view(), name='explore'),
    path('<str:slug>/', views.PostDetailView.as_view(), name='post-detail')
]
