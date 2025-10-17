
SELECT 
  orderitem.order_item_id,
  orderitem.order_id,
  orderitem.item_id,
  orders.customer_id,
  orderitem.total_amount_order,
  orderitem.item_quantity,
  orders.order_status,
  orders.order_date,
  orders.order_shipped_date,
  orders.nb_day_between_order_ship,
  order_store_id,
  order_staff_id
FROM {{ ref('stg_local_bike__order_items') }} orderitem
LEFT JOIN {{ ref('stg_local_bike__orders') }} orders ON orderitem.order_id = orders.order_id
