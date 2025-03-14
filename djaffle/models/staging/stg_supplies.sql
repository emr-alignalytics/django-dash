

SELECT
    id as supply_id
    , sku as product_id

    , name as supply_name
    , cost as supply_cost

    , perishable as is_perishable_supply
FROM {{ref('raw_supplies')}}