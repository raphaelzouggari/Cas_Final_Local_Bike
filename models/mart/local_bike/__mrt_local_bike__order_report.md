{% docs mrt_local_bike__order_report %}

This table contains order information from the local bike shop.

The granularity of this table is on the product. 1 line = 1 order with data enriched by int models. 
Several calculated columns are described as :
 - **total_product_quantity** : nb of product in the order
 - **total_gross_amount_order** : total amount of the order


    CONCAT(order_id, '_', customer_id, '_', product_name, '_', category_name) as unique_order,
    order_id, customer_id,
    order_date,
    order_store_id,
    product_name,
    category_name,
    brand_name,
    SUM(product_quantity) AS total_product_quantity,
    SUM(total_gross_amount_order) AS total_gross_amount_order

We retrieve also several information about the product (category, brand)

{% enddocs %}
