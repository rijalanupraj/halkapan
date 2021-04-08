# External Import
from django.urls import path

# Internal Import
from . import views

app_name = 'home'

urlpatterns = [
    path('', views.home, name='home-page')
]
