# External Import
from django.urls import path

# Internal Import
from . import views

app_name = 'myadmin'

urlpatterns = [
    path('', views.dashboard, name='admin-dashboard'),
    path('users/', views.UserListView.as_view(), name='admin-users'),
    path('delete-user/<str:username>', views.delete_user, name='delete-user'),
    path('make-staff/<str:username>', views.make_staff, name="make-staff"),
    path('make-normal-user/<str:username>',
         views.make_normal_user, name="make-normal-user"),

]
