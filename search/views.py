from django.shortcuts import render
from django.views.generic import ListView
from products.models import Product
from search.models import SearchTerm

STRIP_WORDS = ['a','an','and','by','for','from','in','no','not','of',
                'on','or','that','the','to','with']


class SearchProductView(ListView):
    template_name = "search/view.html"
    paginate_by   =  3

    def get_context_data(self, *args, **kwargs):
        context = super(SearchProductView, self).get_context_data(*args, **kwargs)
        query = self.request.GET.get('q')
        context['query'] = query
        # SearchQuery.objects.create(query=query)
        return context

    def get_queryset(self, *args, **kwargs):
        request = self.request
        method_dict = request.GET
        query = method_dict.get('q', None)
        #print(query)
        if query is not None:
            #self.store(request, query)
            return Product.objects.search(query)
        return Product.objects.featured()
        

    # # store the search text in the database
    # def store(self,request, q):
    #     # if search term is at least three chars long, store in db
    #     if len(q) > 2:
    #         term = SearchTerm()
    #         term.q = q
    #         term.ip_address = request.META.get('REMOTE_ADDR')
    #         term.user = None
    #         if request.user.is_authenticated:
    #             term.user = request.user
    #         term.save()
    # # strip out common words, limit to 5 words
    # def _prepare_words(self , search_text):
    #     words = search_text.all()
    #     for common in STRIP_WORDS:
    #         if common in words:
    #             words.remove(common)
    #         return words
