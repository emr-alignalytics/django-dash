

SELECT
    id as order_item_id
    , order_id 
    , sku as product_id
FROM {{ref('raw_items')}}