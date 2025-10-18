SELECT 
    CONCAT(COALESCE(orders.order_id,0), '_', staff.staff_name) as unique_staff,
    orders.order_id,
    staff.staff_name,
    staff.staff_active,
    staff.manager_name,
    staff.store_name,
    staff.store_city,
    order_date,
    COALESCE(nb_day_between_order_ship,0) as nb_day_between_order_ship, 
    COALESCE(total_gross_order_amount,0) as total_gross_order_amount,
    COALESCE(total_products,0) as total_products,
    COALESCE(total_distinct_product,0) as total_distinct_product,
    COUNT(DISTINCT order_id) OVER (PARTITION BY staff_name) AS total_order
FROM {{ ref('int_local_bike__staff') }} staff
LEFT JOIN {{ ref('int_local_bike__order') }} orders ON staff.staff_id = orders.order_staff_id
