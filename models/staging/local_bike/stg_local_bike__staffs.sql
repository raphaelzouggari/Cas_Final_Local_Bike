SELECT 
    staff_id,
    first_name as staff_first_name,
    last_name as staff_last_name,
    email as staff_email,
    phone as staff_phone,
    active as staff_active,
    store_id as staff_store_id,
    manager_id as staff_manager_id
FROM {{ source('local_bike', 'staffs') }}
