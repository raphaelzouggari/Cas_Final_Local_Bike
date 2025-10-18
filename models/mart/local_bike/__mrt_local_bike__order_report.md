{% docs mrt_local_bike__order_report %}

This table contains order information from the local bike shop.

The granularity of this table is on the product. 1 line = 1 order with data enriched by int models. 
Several calculated columns are described as :
 - **total_product_quantity** : nb of product in the order
 - **total_gross_amount_order** : total amount of the order


We retrieve also several information about the product (category, brand)

{% enddocs %}
