# External Import
from django.urls import path, re_path
from django.contrib.auth import views as auth_views

# Internal Import
from . import views
urlpatterns = [
    path('login/', views.LoginView.as_view(redirect_authenticated_user=True), name='login'),
    path('logout/', auth_views.LogoutView.as_view(), name='logout'),
    path('register/', views.register, name='register'),
    path('activate/<uidb64>/<token>/',
         views.activate_account, name='activate'),
    path('accounts/password-reset/',
         auth_views.PasswordResetView.as_view(
              template_name='accounts/password_reset.html'
         ),
         name='password_reset'),
    path('accounts/password-reset/done/',
         auth_views.PasswordResetDoneView.as_view(
              template_name='accounts/password_reset_done.html'
         ),
         name='password_reset_done'),
    path('password-reset-confirm/<uidb64>/<token>/',
         auth_views.PasswordResetConfirmView.as_view(
             #  template_name='accounts/password_reset_confirm.html'
         ),
         name='password_reset_confirm'),
    path('password-reset-complete/',
         auth_views.PasswordResetCompleteView.as_view(
              template_name='accounts/password_reset_complete.html'
         ),
         name='password_reset_complete'),
]
