SELECT 
    order_id,
    customer_id,
    order_status,
    DATE(order_date) as order_date,
    DATE(required_date) as order_required_date,
    CASE WHEN shipped_date IS NULL OR shipped_date = 'NULL' THEN null ELSE DATE(shipped_date) END as order_shipped_date,
    CASE WHEN shipped_date IS NULL OR order_date IS NULL OR shipped_date = 'NULL' THEN NULL ELSE
    DATE_DIFF(DATE(shipped_date), DATE(order_date), DAY) END AS nb_day_between_order_ship,
    store_id as order_store_id,
    staff_id as order_staff_id
FROM {{ source('local_bike', 'orders') }}
