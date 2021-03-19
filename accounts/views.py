# External Import
from django.shortcuts import render, redirect
from django.contrib.auth import views as auth_views

# Internal Import
from . import forms


class LoginView(auth_views.LoginView):
    form_class = forms.LoginForm
    template_name = 'accounts/login.html'


def register(request):

    form = forms.UserRegistrationForm(request.POST or None)
    if form.is_valid():
        user = form.save(commit=False)
        user.active = False
        user.save()
        print("hello")
        return redirect("accounts:login")

    return render(request, 'accounts/register.html', {'form': form})
