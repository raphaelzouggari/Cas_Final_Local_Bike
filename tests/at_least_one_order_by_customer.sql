{{ config(error_if = '>10', warn_if = '>5') }}

select distinct customer_id
from {{ ref('int_local_bike__customer') }}
where total_orders = 0
