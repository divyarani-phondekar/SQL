select * from information_schema.tables;

select count(*) from customers;

select * from orders limit 10;

-- Data Filtering
select distinct order_status from orders order by 1;
select * from orders where order_status  = 'CLOSED';
select * from orders where order_status in ('COMPLETE', 'CLOSED');

-- Aggregations
select * from orders;
select count(distinct order_status) from orders;

select * from order_items;
select sum(order_item_subtotal) from order_items where order_item_order_id = 2;
select avg(order_item_product_price) from order_items;
select max(order_item_product_price) from order_items;
select min(order_item_product_price) from order_items;

-- Group By
select count(*) as order_count, order_status 
from orders
group by order_status;

select count(*) as order_count, order_date 
from orders
group by order_date;

select count(*) as order_count, to_char(order_date, 'yyyy-MM') as month
from orders
group by month
order by month;

select * from order_items;

select order_item_order_id, round(sum(order_item_subtotal):: numeric, 2) as order_revenue
from order_items 
group by order_item_order_id
order by order_item_order_id;


-- SQL Query order of execution
select order_date, count(*) as order_count
from orders
where order_status in ('COMPLETE', 'CLOSED')
group by order_date
order by order_count desc;

1. from
2. where 
3. group by 
4. having
5. select 
6. order by 

-- RULES AND RESTRICTIONS --
-- Use column names other than aggregate function in group by.
-- You can't use newly added alias column name in where condition. It will throw column not found error.
-- Aggregate functions not allowed in where clause. Use having clause for the aggregate functions.
-- You can't use having clause without group by.

-- Having cluase
select order_date, count(*) as order_count
from orders
where order_status in ('COMPLETE', 'CLOSED')
group by order_date
having count(*) >= 120
order by order_count desc;




