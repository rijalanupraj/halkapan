# External Import
from django.shortcuts import render
from django.views.generic import ListView

# Internal Import
from posts.models import Post


class SearchPostListView(ListView):
    template_name = "search/search-view.html"
    paginate_by = 1

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
            return Post.objects.search(query)
        return Post.objects.none()
