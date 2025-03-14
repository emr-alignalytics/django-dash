

SELECT
    id as order_id
    , store_id as location_id
    , customer as customer_id

    , subtotal
    , tax_paid
    , order_total
    , ordered_at as ordered_at
FROM {{ref('raw_orders')}}