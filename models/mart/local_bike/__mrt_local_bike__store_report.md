{% docs mrt_local_bike__store_report %}

This table contains store and staff information from the local bike shop.

The granularity of this table is on the staff. 1 line = 1 staff and order with data enriched by int models. 
Several calculated columns are described as :
 - **nb_day_between_order_ship** : nb of days between the order and the shipping of the order
 - **total_gross_order_amount** : total gross amount of the order (unit price * quantity)
 - **total_products** : numbers of products of the order
 - **total_distinct_product** : numbers of dinstinct product of the order
 - **total_order** : numbers of order

We retrieve also several information about staff and stores (adress, state)

{% enddocs %}
