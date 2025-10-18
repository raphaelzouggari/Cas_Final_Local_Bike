{% docs mrt_local_bike__customer_report %}

This table contains customers information from the local bike shop.

The granularity of this table is on the customer. 1 line = 1 customer with his order with data enriched by int models. 
Several calculated columns are described as :
 - **nb_day_between_order_ship** : nb of days between the order and the shipping of the order
 - **total_order_amount** : total amount of the order (unit price * quantity - discount applied)
 - **total_products** : numbers of products of the order
 - **total_distinct_product** : numbers of dinstinct product of the order

We retrieve also several information about the customer (city, state)

{% enddocs %}
