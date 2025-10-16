select
    order_id,
    sum(total_amount_order) as total_amount
from {{ ref('stg_local_bike__order_items') }}
group by 1
having total_amount < 0
