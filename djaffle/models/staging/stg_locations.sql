

SELECT 
    id as location_id
    , name as location_name
    , tax_rate
    , opened_at as opened_date
FROM {{ref('raw_stores')}}
