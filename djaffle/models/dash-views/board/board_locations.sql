

select 
    locations.location_id
    , any_value(locations.location_name) as location_name
    , any_value(locations.tax_rate) as tax_rate
    , any_value(locations.opened_date) as opened_date

    , count(distinct orders.order_id) as count_orders
    , sum(orders.subtotal) as total_sales_pretax
    , sum(orders.total) as total_sales



from {{ ref('stg_locations') }} locations

left join {{ref('stg_orders')}} orders
    on locations.location_id = orders.location_id

group by locations.location_id
