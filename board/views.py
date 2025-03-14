from django.shortcuts import render
from django.template import loader
from django.http import HttpResponse
from .models import Product

# Create your views here.
def index(request):
    product_list = Product.objects.order_by("name")
    template = loader.get_template("board/index.html")
    context = {
        "product_list": product_list,
    }
    return HttpResponse(template.render(context, request))

def detail(request, product_id):
    return HttpResponse(f"You're looking at product {product_id}.")