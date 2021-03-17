# External Import
from django.db import models
from django.contrib.auth.models import (
    BaseUserManager,
    AbstractBaseUser,
    PermissionsMixin,
)


class UserManager(BaseUserManager):
    """Manager for User"""

    def get_by_natural_key(self, username):
        """
        This takes username/email case insensitive while performing login operation
        """
        return self.get(**{self.model.USERNAME_FIELD + '__iexact': username})

    def create_user(self, username, email, password=None):
        """
        Creates and saves a User with the given email, username and password.
        """

        if username is None:
            raise ValueError('User must have a username')
        if email is None:
            raise ValueError('User must have a Email')

        email = self.normalize_email(email)

        user = self.model(username=username, email=email)
        user.set_password(password)
        user.save(using=self._db)

        return user

    def create_superuser(self, username, email, password=None):
        """
        Creates and saves a superuser with the given email, username and password.
        """
        if password is None:
            raise ValueError('Password should not be none')

        user = self.create_user(username, email, password)

        user.is_superuser = True
        user.is_admin = True
        user.is_staff = True

        user.save(using=self._db)
        return user


class User(AbstractBaseUser, PermissionsMixin):
    """Database model for users in the system"""

    email = models.EmailField(
        max_length=255,
        unique=True,
    )
    username = models.CharField(max_length=30, unique=True)
    active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)
    is_admin = models.BooleanField(default=False)
    is_superuser = models.BooleanField(default=False)
    date_joined = models.DateTimeField(
        auto_now_add=True, blank=True, null=True)

    objects = UserManager()
    USERNAME_FIELD = 'username'
    REQUIRED_FIELDS = ["email"]

    def __str__(self):
        """Return string representation of the user's username & email"""
        return f'{self.username} | {self.email}'
