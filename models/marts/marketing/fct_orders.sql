select o.customer_id, p.orderid, sum(p.amount) as amount
from {{ ref("stg__jaffle_shop__orders") }} o
left join {{ ref("stg__stripe__payments") }} p on p.orderid = o.order_id
group by o.customer_id, p.orderid