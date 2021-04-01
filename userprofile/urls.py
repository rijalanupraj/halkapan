# External Import
from django.urls import path

# Internal Import
from . import views

app_name = 'userprofile'

urlpatterns = [
    path('users/', views.AllUserProfileListView.as_view(), name='list-all-user'),
    path('users/<str:username>/',
         views.AuthorDetailView.as_view(), name='author-profile-page'),
    path('users/<str:username>/follow',
         views.follow_toggle, name='follow-toggle'),
    path('profile/update', views.update_profile, name='user-profile-update')

]
