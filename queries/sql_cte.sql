-- A common table [deprecated]CTE is a powerful SQL construct that helps simplify queries. 
-- CTEs act as virtual tables (with records and columns) that are created during query execution, 
-- used by the query, and deleted after the query executes.


-- CTEs can be useful when you need to generate temporary result sets that can be accessed in a SELECT, INSERT, UPDATE, DELETE, or MERGE statement.


with order_details_cte as 
(select o.*, oi.order_item_product_id , oi.order_item_subtotal ,oi.order_item_order_id
from orders o join order_items oi  
on o.order_id  = oi.order_item_order_id)
select * from order_details_cte
where order_id = 2; 

