

select supplies.supply_id
    , avg(supplies.supply_cost) as supply_cost
    , max(supplies.supply_cost) = min(supplies.supply_cost) as supply_cost_consistency_check
    , any_value(supplies.is_perishable_supply)

    , count(distinct products) as count_products
    , count(distinct order_id) as count_orders

from {{ ref('stg_supplies') }} supplies

left join {{ref('stg_order_items')}} order_items
    on supplies.product_id = order_items.product_id

group by supplies.supply_id