# External Import
from django import forms

# Internal Import
from posts.models import Post
from userprofile.models import Profile
from accounts.models import User
from comments.models import Comment
from tags.models import Tag


class PostForm(forms.ModelForm):
    class Meta:
        model = Post
        fields = '__all__'


class ProfileUpdateForm(forms.ModelForm):
    class Meta:
        model = Profile
        fields = '__all__'


class UserUpdateForm(forms.ModelForm):
    class Meta:
        model = User
        exclude = ('last_login', 'groups', 'user_permissions', 'password')

class UserCreateForm(forms.ModelForm):
    class Meta:
        model = User
        exclude = ('last_login', 'groups', 'user_permissions')


class CommentAdminForm(forms.ModelForm):
    class Meta:
        model = Comment
        fields = '__all__'


class TagAdminForm(forms.ModelForm):
    class Meta:
        model = Tag
        fields = '__all__'
