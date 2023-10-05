explain -- to fetch explain plan
select * 
from orders
where order_status in ('CLOSED', 'COMPLETE')
order by order_date;

-- QUERY PLAN                                                                |
-- --------------------------------------------------------------------------+
-- Sort  (cost=3650.73..3726.77 rows=30414 width=26)                         |
--   Sort Key: order_date                                                    |
--   ->  Seq Scan on orders  (cost=0.00..1386.04 rows=30414 width=26)        |
--      Filter: ((order_status)::text = ANY ('{CLOSED,COMPLETE}'::text[]))   |


-- Query Plan terms:
	-- Seq Scan - Scan entire table
	-- Index Scan - Scan first index table then scan actual table for that index value
	-- Index Only Scan - Scan only t=index table
	
-- Index
create index orders_order_customer_id_idx
on orders(order_customer_id)


-- Performace tuning steps:
--	1. Generate explain plan for sql query
--	2. Interpret explain plan and indentify the performance bottlenecks
--	3. Act by using right technique to improve the performance

