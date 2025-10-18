WITH ventes AS (
    SELECT
        orderitem.order_id,
        orderitem.order_date,
        orderitem.product_id,
        orderitem.customer_id,
        product.product_name,
        product.category_name,
        product.brand_name,
        orderitem.order_store_id,
        orderitem.order_staff_id,
        orderitem.product_quantity,
        product.product_price,
        orderitem.total_gross_amount_order
    FROM  {{ ref('int_local_bike__order_item_link') }} orderitem
    JOIN {{ ref('int_local_bike__product') }} product ON orderitem.product_id = product.product_id
)
SELECT
    order_id, customer_id,
    order_date,
    order_store_id,
    product_name,
    category_name,
    brand_name,
    SUM(product_quantity) AS total_product_quantity,
    SUM(total_gross_amount_order) AS total_gross_amount_order
FROM ventes
GROUP BY order_id, customer_id, order_date, order_store_id, product_name, category_name, brand_name
