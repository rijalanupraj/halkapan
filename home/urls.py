# External Import
from django.urls import path
from django.shortcuts import render
app_name = 'home'


def index(request):
    return render(request, "home/home.html")


urlpatterns = [
    path('', index)
]
