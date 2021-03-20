# External Import
from django.contrib import admin

# Internal Import
from .models import Post

admin.site.register(Post)
