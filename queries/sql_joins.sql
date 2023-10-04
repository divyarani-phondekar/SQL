select * from orders limit 10;
select * from order_items limit 10;

-- Inner Join
select o.order_id, oi.order_item_product_id, oi.order_item_subtotal 
from orders as o join order_items as oi
on o.order_id = oi.order_item_order_id; 

----------------------

-- Outer Join
select count(distinct(order_id))
from orders;

select count(distinct(order_item_order_id))
from order_items;

-- Fetch all the order ids along with order ids for which order items not present
select o.order_id, o.order_date, oi.order_item_product_id, oi.order_item_subtotal 
from orders as o left join order_items as oi
on o.order_id = oi.order_item_order_id
order by order_id; 

----------------------

-- Filter and Aggregation on join 
-- Fetch daily product revenue
select o.order_date, oi.order_item_product_id, round(sum(oi.order_item_subtotal):: numeric, 2) as order_revenue
from orders as o join order_items as oi
on o.order_id = oi.order_item_order_id
where o.order_status in ('COMPLETE', 'CLOSED')
group by o.order_date, oi.order_item_product_id 
order by order_revenue desc;

----------------------




