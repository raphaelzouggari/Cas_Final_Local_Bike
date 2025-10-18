SELECT 
    CONCAT(order_id, '_', item_id) AS order_item_id,
    order_id,
    item_id,
    product_id,
    quantity as product_quantity,
    list_price as unit_price,
    discount,
    (quantity*list_price) as total_gross_amount_order,
    (quantity*list_price)*(1-discount) as total_amount_order
FROM {{ source('local_bike', 'order_items') }}
