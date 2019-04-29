from django.contrib.auth import authenticate, login, get_user_model
from django.http import HttpResponse, JsonResponse, HttpResponseRedirect
from django.shortcuts import render,redirect, get_object_or_404
from django.core.paginator import Paginator,EmptyPage, PageNotAnInteger
from django.core.mail import send_mail ,BadHeaderError
from django.conf import settings


from .forms import ContactForm
from products.models import Product,Category

def home_page(request):
    print(request)
    product_list = Product.objects.filter(featured=True)

    paginator  = Paginator(product_list,4)
    page       =  request.GET.get('page')
    products   = paginator.get_page(page)
    context = {
        "title":"Welcome To Moi Market Place!",
        "products":products,}

    return render(request, "home_page.html", context)
# def home_page(request):
#     context = Category.objects.all()
#     return render(request, "home_page.html", {'context':context})



def category_page(request, category_slug=None):
    category = get_object_or_404(Category,slug=category_slug)
    product_list = category.product_set.all()

    paginator  = Paginator(product_list,4)
    page       =  request.GET.get('page')
    products   = paginator.get_page(page)


    return render(request,
                  'category.html',
                  {'category': category,
                  'products': products})


def about_page(request):
    context = {
        "title":"About moi market place",
        "content":" To be added later."
    }
    return render(request, "home_page.html", context)

def contact_page(request):
    if request.method =='POST':
        form = ContactForm(request.POST)
        if form.is_valid():
            subject = form.cleaned_data['subject']
            message = form.cleaned_data['message']
            from_email = form.cleaned_data['email']
            try:
                send_mail(subject,message, from_email,[settings.ADMINS])
            except BadHeaderError:
                return HttpResponse('Invalid header field')
            return render(request,'contact/thankyou.html')
    else:
        form = ContactForm()
    return render(request,'contact/view.html' ,{'form':form})