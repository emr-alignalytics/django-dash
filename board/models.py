from django.db import models
import datetime

# Create your models here.

class Product(models.Model):
    product_id = models.CharField("Product SKU", max_length=7)
    product_name = models.CharField("Product Name", max_length=200)
    product_price = models.IntegerField("Product Price", default=100)
    product_description = models.CharField("Product Description", max_length=1000)

    count_orders = models.IntegerField("Number of Orders", default=1)
    count_customers = models.IntegerField("Number of Customers", default=1)
    
    first_ordered_at = models.DateTimeField("First Ordered Date", default=datetime.now())
    last_ordered_at = models.DateTimeField("Last Ordered Date", default=datetime.now())
    total_sales_pretax = models.IntegerField("Total Sales (Pretax)", default = 0)
    total_sales = models.IntegerField("Total Sales", default = 0)

    supply_cost = models.IntegerField("Cost of Supplies", default=0)
    count_supplies = models.IntegerField("Number of Supplies", default=0)
