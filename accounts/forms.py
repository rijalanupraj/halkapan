# External Import
from django.contrib.auth import get_user_model
from django import forms
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from django.core.exceptions import ValidationError
from django.contrib import messages
from django.urls import reverse
from django.contrib.sites.shortcuts import get_current_site
from django.template.loader import render_to_string

User = get_user_model()


class UserRegistrationForm(UserCreationForm):
    email = forms.EmailField(max_length=250, widget=forms.EmailInput(
        attrs={'placeholder': 'Email',
               'class': 'myInput'}
    ))
    username = forms.CharField(label='Username', widget=forms.TextInput(
        attrs={'placeholder': 'Username', 'class': 'myInput'}))

    password1 = forms.CharField(label='Password', widget=forms.PasswordInput(
        attrs={'placeholder': 'Password', 'class': 'myInput'}))

    password2 = forms.CharField(label='Confirmation Password', widget=forms.PasswordInput(
        attrs={'placeholder': 'Confirm Password', 'class': 'myInput'}))

    class Meta:
        model = User
        fields = ['username', 'email', 'password1', 'password2']

    def clean(self):
        email = self.cleaned_data.get('email').lower()
        username = self.cleaned_data.get('username').lower()
        if User.objects.filter(email=email).exists():
            raise forms.ValidationError(" Email exists")
        elif User.objects.filter(username=username).exists():
            raise forms.ValidationError(f"{username} Username Already Taken")
        return self.cleaned_data


class LoginForm(AuthenticationForm):
    username = forms.CharField(label='Username', widget=forms.TextInput(
        attrs={'placeholder': 'Username or Email', 'class': 'myInput', 'id': 'username'}))
    password = forms.CharField(label="Password", widget=forms.PasswordInput(
        attrs={'placeholder': 'Password', 'class': 'myInput', 'id': 'password'})
    )

    def confirm_login_allowed(self, user):
        if not user.is_active:
            url = reverse("resend_verification")
            URL = f"<a href='{url}'>Resend Verification URL</a>"
            messages.error(
                self.request, f'{URL}')
            raise ValidationError(
                ("This account is inactive. Check your email"),
                code='inactive',
            )


class SendEmailVerificationForm(forms.Form):
    email = forms.EmailField(required=True)
