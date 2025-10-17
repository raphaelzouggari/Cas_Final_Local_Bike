SELECT 
    staff.staff_id,
    staff.staff_name as staff_name,
    staff.staff_active as staff_active,
    manager.staff_name as manager_name,
    store.store_name,
    store.store_city
FROM {{ ref('stg_local_bike__staffs') }} staff 
LEFT JOIN {{ ref('stg_local_bike__staffs') }} manager ON staff.staff_manager_id = manager.staff_id
JOIN {{ ref('int_local_bike__store') }} store ON staff.staff_store_id = store.store_id
