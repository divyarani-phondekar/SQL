select * from orders;

select * from order_items oi;

select o.*, oi.order_item_product_id , oi.order_item_subtotal 
from orders o join order_items oi  
on o.order_id  = oi.order_item_order_id 


create or replace view order_detail_view
as
select o.*, oi.order_item_product_id , oi.order_item_subtotal ,oi.order_item_order_id
from orders o join order_items oi  
on o.order_id  = oi.order_item_order_id 


select * from order_detail_view
where order_id = 2;

-- Add new column in the view at the end of select statement columns list
-- Don't have physical data as table