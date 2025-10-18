SELECT 
    orders.order_id,
    orders.order_date,
    orders.customer_id,
    cust.customer_city,
    cust.customer_state,
    cust.total_amount_spent,
    cust.total_products,
    cust.total_distinct_product,
    cust.total_orders
FROM {{ ref('int_local_bike__order') }} orders
JOIN {{ ref('int_local_bike__customer') }} cust ON orders.customer_id = cust.customer_id
