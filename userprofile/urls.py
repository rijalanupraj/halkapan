# External Import
from django.urls import path

# Internal Import
from . import views

app_name = 'userprofile'

urlpatterns = [
    path('users/', views.AllUserProfileListView.as_view(), name='list-all-user'),
]