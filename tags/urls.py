# Extrenal Import
from django.urls import path

# Internal Import
from . import views

app_name = 'tags'

urlpatterns = [
    path('<str:slug>/', views.PostTagListView.as_view(), name='tag-list-view')
]
