select 
    products.product_id
    , any_value(products.product_name) as product_name
    , any_value(products.product_price) as product_price
    , any_value(products.product_description) as product_description

    , count(distinct order_items.order_id) as count_orders
    , count(distinct orders.customer_id) as count_customers

    , min(ordered_at) as first_ordered_at
    , max(ordered_at) as last_ordered_at
    , sum(orders.subtotal) as total_sales_pretax
    , sum(orders.total) as total_sales

    , sum(supplies.supply_cost) as supply_cost
    , count(distinct supplies.supply_uuid) as count_supplies

from {{ ref('stg_products') }} products

left join {{ ref('stg_order_items') }} order_items
    on products.product_id = stg_order_items.product_id

left join {{ref('stg_orders')}} orders 
    on order_items.order_id = orders.order_id
    
left join {{ref('stg_supplies')}} supplies
    on products.product_id = supplies.product_id

group by products.product_id