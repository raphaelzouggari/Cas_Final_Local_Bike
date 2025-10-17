{% docs int_local_bike__customer %}

This table contains customer's order from the local bike shop.

The granularity of this table is on the customer. 1 line = 1 customer. 
Several calculated columns are described as :
 - **total_amount_spent** : total amount spent by a customer (over all orders)
 - **total_orders** : total number of order by the customer
 - **total_items** : numbers of items ordered
 - **total_distinct_items** : numbers of dinstinct items ordered

We retrieve also several information about the customer (id, city, state, street, zip code)

{% enddocs %}
