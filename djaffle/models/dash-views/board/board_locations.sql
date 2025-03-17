{{
    config(
        unique_key = 'location_id'
    )
}}

select 
    locations.location_id
    , max(locations.location_name) as location_name
    , max(locations.tax_rate) as tax_rate
    , max(locations.opened_date) as opened_date

    , count(distinct orders.order_id) as count_orders
    , sum(orders.subtotal) as total_sales_pretax
    , sum(orders.total) as total_sales



from {{ ref('stg_locations') }} locations

left join {{ref('stg_orders')}} orders
    on locations.location_id = orders.location_id

group by locations.location_id
