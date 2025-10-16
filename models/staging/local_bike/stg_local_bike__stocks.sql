SELECT 
    CONCAT(store_id,'-',product_id) as stock_id,
    store_id as stock_store_id,
    product_id as stock_product_id,
    quantity as stock_quantity
FROM {{ source('local_bike', 'stocks') }}
