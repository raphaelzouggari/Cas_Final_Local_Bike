WITH tmp_orders AS (
    SELECT
        customer_id,
        customer_name,
        customer_street,
        customer_city,
        customer_state,
        customer_zip_code,
        SUM(total_order_amount) AS total_amount_spent,
        SUM(total_products) as total_products,
        COUNT(distinct total_distinct_product) as total_distinct_product,
        COUNT(DISTINCT order_id) AS total_orders
    FROM {{ ref('int_local_bike__order') }} 
    GROUP BY customer_id, customer_name, customer_street, customer_city, customer_state, customer_zip_code
)
SELECT
    tmp_orders.customer_id,
    tmp_orders.customer_name,
    tmp_orders.customer_street,
    tmp_orders.customer_city,
    tmp_orders.customer_state,
    tmp_orders.customer_zip_code,
    tmp_orders.total_amount_spent,
    tmp_orders.total_products,
    tmp_orders.total_distinct_product,
    tmp_orders.total_orders
FROM tmp_orders 

