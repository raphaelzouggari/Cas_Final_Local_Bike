with tmp_for_each_order_item as (
  select 
    order_id,
    customer_id,
    order_status,
    order_date,
    order_shipped_date,
    AVG(nb_day_between_order_ship) as nb_day_between_order_ship,
    SUM(total_amount_order) AS total_order_amount,
    SUM(item_quantity) as total_items,
    count(distinct item_id) as total_distinct_items
  from {{ref("int_local_bike__order_item_link")}}
  group by order_id, customer_id, order_status, order_date, order_shipped_date
)
select 
  order_item_link.order_id,
  order_item_link.customer_id,
  order_item_link.order_status,
  order_item_link.order_date,
  order_item_link.order_shipped_date,
  customer.customer_street,
  customer.customer_city,
  customer.customer_state,
  customer.customer_zip_code,
  COALESCE(nb_day_between_order_ship,0) as nb_day_between_order_ship,
  COALESCE(order_item_link.total_order_amount,0) as total_order_amount,
  COALESCE(order_item_link.total_items,0) as total_items,
  COALESCE(order_item_link.total_distinct_items,0) as total_distinct_items
from tmp_for_each_order_item as order_item_link 
left join {{ref("stg_local_bike__customers")}} as customer on customer.customer_id = order_item_link.customer_id
