# External Import
from django.urls import path

# Internal Import
from . import views

app_name = 'myadmin'

urlpatterns = [
    path('', views.dashboard, name='admin-dashboard'),
    path('users/', views.UserListView.as_view(), name='users-list'),
    path('update-user/<str:username>', views.update_user, name='update-user'),
    path('delete-user/<str:username>', views.delete_user, name='delete-user'),
    path('make-staff/<str:username>', views.make_staff, name="make-staff"),
    path('make-normal-user/<str:username>',
         views.make_normal_user, name="make-normal-user"),
    path('posts/', views.AdminPostListView.as_view(), name='posts-list'),
    path('posts/<int:id>/update',
         views.update_post, name='post-update'),
    path('posts/<int:id>/delete',
         views.delete_post, name='post-delete'),
    path('posts/<int:id>/approve',
         views.approve_post, name="approve-post"),
    path('posts/<int:id>/disapprove',
         views.disapprove_post, name="disapprove-post"),

]
