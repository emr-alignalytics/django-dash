

SELECT
    id as order_item_id
    , orderId as order_id 
    , productSku as product_id
FROM {{ref('raw_items')}}