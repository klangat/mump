from decimal import Decimal
from django.shortcuts import render, get_object_or_404, reverse
from django.conf import settings
from django.views.decorators.csrf import csrf_exempt

from paypal.standard.forms import PayPalPaymentsForm

from orders.models import Order
from carts.models import Cart

def payment_process(request):
	cart_obj, cart_created = Cart.objects.new_or_get(request)
	order_obj = None
	if cart_created or cart_obj.products.count() == 0:
		return redirect("cart:home")
	order_id = request.session.get('cart_id')
	host    = request.get_host()

	paypal_dict ={
	       'business':settings.PAYPAL_RECEIVER_EMAIL,
	       'amount'  : '%.2f'% cart_obj.total.quantize(Decimal('.01')),
	       'item_name': 'Order {}'.format(cart_obj.id),
	       'invoice' : str(cart_obj.id),
	       'currency_code':'Ksh',
	       'notify_url': 'http://{}{}'.format(host, reverse('paypal-ipn')),
	       'cancel_return':'http://{}{}'.format(host,'payment:cancel'),
	       	}
	form = PayPalPaymentsForm(initial=paypal_dict)
	return render(request,'payment/process.html',{'order':cart_obj,'form':form})

@csrf_exempt
def payment_done(request):
	return render(request,'payment/done.html')


@csrf_exempt
def payment_canceled(request):
	return render(request,'payment/canceled.html')