SELECT 
    prod.product_id, 
    prod.product_name,
    brand.brand_name,
    category.category_name, 
    prod.product_price, 
    prod.product_model_year, 
    count(*) OVER (PARTITION BY category_name) as nb_per_category,
    count(*) OVER (PARTITION BY brand.brand_name) as nb_per_brand
FROM {{ ref('stg_local_bike__products') }} prod
JOIN {{ ref('stg_local_bike__brands') }} brand ON prod.product_brand_id = brand.brand_id
JOIN {{ ref('stg_local_bike__categories') }} category ON prod.product_category_id = category.category_id
