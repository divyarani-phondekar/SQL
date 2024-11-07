-- 3rd Highest Salary of employee

CREATE TABLE cemployee (
    emp_name TEXT NOT NULL,
    salary INT NOT NULL
);

-- insert data into table 
INSERT INTO cemployee VALUES ('Tom',1500000);
INSERT INTO cemployee VALUES ('Dick',3900000);
INSERT INTO cemployee VALUES ('Hary',7700000);
INSERT INTO cemployee VALUES ('Mike',15000000);
INSERT INTO cemployee VALUES ('Harvey',33300000);
INSERT INTO cemployee VALUES ('Brush',2500000);

SELECT * FROM cemployee;

emp_name|salary  |
--------+--------+
Tom     | 1500000|
Dick    | 3900000|
Hary    | 7700000|
Mike    |15000000|
Harvey  |33300000|
Brush   | 2500000|

-- Query

SELECT * FROM 
(SELECT *,
DENSE_RANK() OVER (ORDER BY salary desc) AS ranking
FROM cemployee c )
WHERE ranking = 3

-- Output
emp_name|salary |ranking|
--------+-------+-------+
Hary    |7700000|      3|

 ------------------------------------------------------------------------------------


create table order_product_revenue
as
select o.order_date, oi.order_item_product_id, round(sum(oi.order_item_subtotal):: numeric, 2) as order_revenue
from orders as o join order_items as oi
on o.order_id = oi.order_item_order_id
where o.order_status in ('COMPLETE', 'CLOSED')
group by o.order_date, oi.order_item_product_id
order by order_revenue desc;

select * from order_product_revenue;

--- Over and Partition By 
select to_char(order_date:: timestamp, 'yyyy-MM') as order_month, 
		order_date, 
		order_revenue,
		sum(order_revenue) over(partition by to_char(order_date:: timestamp, 'yyyy-MM')) as monthly_order_revenue
from order_product_revenue  
order by order_date;


-- Total aggregation using Over and Partition By 
-- To get raw data along with aggregated result
-- (Use 1 in partition by clause which all not actually do the parition)
select *, sum(order_revenue) over(partition by 1) as total_revenue
from order_product_revenue
order by order_date;


select count(*) from order_product_revenue;


-- rank() over()
-- dense_rank() over()

-- Global ranking 
	-- rank() over(order by col1 desc)
-- Ranking based on key or partition key
	-- rank() over(partition by col2 order by col1 desc)

-- rank and dense_rank
select order_date,
		order_item_product_id,
		order_revenue,
		rank() over(order by order_revenue desc) as rnk,
		dense_rank() over(order by order_revenue desc) as drnk
from order_product_revenue
where order_date = '2014-01-01 00:00:00.000'
order by order_revenue desc;


-- rank and dense_rank with partition by 
select order_date,
		order_item_product_id,
		order_revenue,
		rank() over(partition by order_date order by order_revenue desc) as rnk,
		dense_rank() over(partition by order_date order by order_revenue desc) as drnk
from order_product_revenue
where to_char(order_date:: date, 'yyyy-MM') = '2014-01'
order by order_date, order_revenue desc;


-- Can't use windows functions as part of where clause directly
select order_date,
		order_item_product_id,
		order_revenue,
		rank() over(partition by order_date order by order_revenue desc) as rnk,
		dense_rank() over(partition by order_date order by order_revenue desc) as drnk
from order_product_revenue
where to_char(order_date:: date, 'yyyy-MM') = '2014-01' and rnk >= 5
order by order_date, order_revenue desc;
-- error -> column "rnk" does not exist
-- from, where, select, order by


-- Filtering on global ranks using nested query and CTEs 
select *  from
(
	select order_date,
			order_item_product_id,
			order_revenue,
			rank() over(partition by order_date order by order_revenue desc) as rnk,
			dense_rank() over(partition by order_date order by order_revenue desc) as drnk
	from order_product_revenue
	where order_date = '2014-01-01 00:00:00.000'
	order by order_date, order_revenue desc
) as q
where rnk <= 5
order by order_revenue desc;


with daily_product_revenue_ranks
as
(
	select order_date,
			order_item_product_id,
			order_revenue,
			rank() over(partition by order_date order by order_revenue desc) as rnk,
			dense_rank() over(partition by order_date order by order_revenue desc) as drnk
	from order_product_revenue
	where order_date = '2014-01-01 00:00:00.000'
	order by order_date, order_revenue desc
) 
select * 
from daily_product_revenue_ranks 
where rnk <= 5
order by order_revenue desc;

----------------------------------------
create table student_scores(
	student_id int primary key, 
	student_score int
);

insert into student_scores values
(1, 980),
(2, 960),
(3, 960),
(4, 990),
(5, 920),
(6, 960),
(7, 980),
(8, 960),
(9, 940),
(10, 940);

select * from student_scores 
order by student_score desc;


select *,
	row_number()over(order by student_score desc) as student_row_number,
	rank() over(order by student_score desc) as student_rank,
	dense_rank() over(order by student_score desc) as stiudent_dense_rank 
from student_scores
order by student_score desc;

