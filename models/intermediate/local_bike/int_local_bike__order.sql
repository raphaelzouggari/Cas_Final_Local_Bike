with tmp_for_each_order_item as (
    select 
        order_id,
        customer_id,
        order_status,
        order_date,
        order_shipped_date,
        order_store_id,
        order_staff_id,
        AVG(nb_day_between_order_ship) as nb_day_between_order_ship,
        SUM(total_gross_amount_order) AS total_gross_order_amount,
        SUM(total_amount_order) AS total_order_amount,
        SUM(product_quantity) as total_products,
        count(distinct product_id) as total_distinct_product
    from {{ref("int_local_bike__order_item_link")}}
    group by order_id, customer_id, order_status, order_date, order_shipped_date, order_store_id, order_staff_id
)
select 
    order_item_link.order_id,
    order_item_link.customer_id,
    order_item_link.order_status,
    order_item_link.order_date,
    order_item_link.order_shipped_date,
    customer.customer_name,
    customer.customer_street,
    customer.customer_city,
    customer.customer_state,
    customer.customer_zip_code,
    order_item_link.order_store_id,
    order_item_link.order_staff_id,
    COALESCE(nb_day_between_order_ship,0) as nb_day_between_order_ship, 
    COALESCE(order_item_link.total_gross_order_amount,0) as total_gross_order_amount,
    COALESCE(order_item_link.total_order_amount,0) as total_order_amount,
    COALESCE(order_item_link.total_products,0) as total_products,
    COALESCE(order_item_link.total_distinct_product,0) as total_distinct_product
from tmp_for_each_order_item as order_item_link 
left join {{ref("stg_local_bike__customers")}} as customer on customer.customer_id = order_item_link.customer_id
