# External Import
from django.urls import path

# Internal Import
from . import views

app_name = 'search'

urlpatterns = [
    path('', views.SearchPostListView.as_view(), name='query')
]

