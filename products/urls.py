from django.conf.urls import url

from .views import (
        ProductListView, 
        ProductDetailSlugView,
        )
from ecommerce.views import category_page

app_name='products'

urlpatterns = [
    url(r'^$', ProductListView.as_view(), name='list'),
    #url(r'^page/(?P<page>\d+)/$', ProductListView.as_view(),name="page"),
    #url(r'^(?P<category_slug>[-\w]+)$', category_page, name='product_list_by_category'),
    url(r'^(?P<slug>[\w-]+)/$', ProductDetailSlugView.as_view(), name='detail'),
]

