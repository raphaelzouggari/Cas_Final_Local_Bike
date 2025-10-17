SELECT 
    staff_id,
    first_name as staff_first_name,
    last_name as staff_last_name,
    CONCAT(first_name, ' ', last_name) as staff_name,
    email as staff_email,
    phone as staff_phone,
    active as staff_active,
    store_id as staff_store_id,
    CASE WHEN manager_id = 'NULL' THEN null ELSE CAST(manager_id as INTEGER) END as staff_manager_id
FROM {{ source('local_bike', 'staffs') }}
