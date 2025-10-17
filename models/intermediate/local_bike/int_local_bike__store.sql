WITH tmp_stock_store AS (
    SELECT 
        stock_store_id, 
        sum(stock_quantity) as qty_by_store
    FROM {{ ref('stg_local_bike__stocks') }} stock
    GROUP BY stock_store_id
)
SELECT 
    store_id,
    store_name,
    store_street,
    store_city,
    store_state,
    store_zip_code,
    qty_by_store,
FROM {{ ref('stg_local_bike__stores') }} store
JOIN tmp_stock_store stock ON store.store_id = stock.stock_store_id
