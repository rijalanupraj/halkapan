# External Import
from django.urls import path

# Internal Import
from . import views

app_name = 'myadmin'

urlpatterns = [
    path('', views.dashboard, name='admin-dashboard'),
    path('users/new',
         views.create_user, name='user-create'),
    path('users/', views.UserListView.as_view(), name='users-list'),
    path('update-user/<str:username>', views.update_user, name='update-user'),
    path('delete-user/<str:username>', views.delete_user, name='delete-user'),
    path('make-staff/<str:username>', views.make_staff, name="make-staff"),
    path('make-normal-user/<str:username>',
         views.make_normal_user, name="make-normal-user"),
    path('posts/', views.AdminPostListView.as_view(), name='posts-list'),
    path('comments/', views.AdminCommentListView.as_view(), name='comments-list'),
    path('tags/', views.admin_tag_list, name='tags-list'),
    path('posts/<int:id>/update',
         views.update_post, name='post-update'),
    path('posts/<int:id>/delete',
         views.delete_post, name='post-delete'),
    path('posts/<int:id>/approve',
         views.approve_post, name="approve-post"),
    path('posts/<int:id>/disapprove',
         views.disapprove_post, name="disapprove-post"),
    path('comments/<int:id>/update',
         views.update_comment, name='comment-update'),
    path('comments/<int:id>/delete',
         views.delete_comment, name='comment-delete'),
    path('tags/new',
         views.create_tag, name='tag-create'),
    path('tags/<int:id>/update',
         views.update_tag, name='tag-update'),
    path('tags/<int:id>/delete',
         views.delete_tag, name='tag-delete'),

]
