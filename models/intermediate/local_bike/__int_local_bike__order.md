{% docs int_local_bike__order %}

This table contains order information from the local bike shop.

The granularity of this table is on the order. 1 line = 1 order. 
Several calculated columns are described as :
 - **nb_day_between_order_ship** : nb of days between the order and the shipping of the order
 - **total_order_amount** : total amount of the order (unit price * quantity - discount applied)
 - **total_products** : numbers of products of the order
 - **total_distinct_product** : numbers of dinstinct product of the order

We retrieve also several information about the order (status, date) and the customer (id, city, state)

{% enddocs %}
