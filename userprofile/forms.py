from django import forms
from django.contrib.auth import get_user_model
from .models import Profile

UserModel = get_user_model()


class UserUpdateForm(forms.ModelForm):
    class Meta:
        model = UserModel
        fields = ['email', 'username']


class ProfileUpdateForm(forms.ModelForm):
    class Meta:
        model = Profile
        fields = ['bio', 'image']
