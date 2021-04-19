# External Import
from django.shortcuts import render, redirect
from django.views.generic import ListView
from django.contrib.auth.mixins import (
    LoginRequiredMixin,
    UserPassesTestMixin
)
# Internal Import
from posts.models import Post


class SearchPostListView(UserPassesTestMixin, ListView):
    template_name = "search/search-view.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        query = self.request.GET.get('q')
        if query is not None:
            context["query"] = query
        return context

    def get_queryset(self):
        request = self.request
        query = request.GET.get('q', None)
        if query is not None and query != '':
            return Post.objects.search(query).distinct()
        return Post.objects.none()

    def test_func(self):
        return not self.request.user.is_staff

    def handle_no_permission(self):
        return redirect('myadmin:admin-dashboard')
