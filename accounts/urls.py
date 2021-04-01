# External Import
from django.urls import path
from django.contrib.auth import views as auth_views

# Internal Import
from . import views
app_name = 'accounts'

urlpatterns = [
    path('login/', views.LoginView.as_view(redirect_authenticated_user=True), name='login'),
    path('logout/', auth_views.LogoutView.as_view(), name='logout'),
    path('register/', views.register, name='register')
]
