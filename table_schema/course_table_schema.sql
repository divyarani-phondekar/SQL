drop table if exists courses;

create table courses(
	course_id serial primary key,
	course_name varchar(60),
	course_author varchar(40),
	course_status varchar(9),
	course_published_dt date
);


insert into courses 
(course_name, course_author, course_status, course_published_dt)
values 
('Programming using Python', 'Bob Dillon', 'published', '2020-09-30'),
('Data Engineering using Python', 'Bob Dillon', 'published', '2020-07-15'),
('Data Engineering using Scala', 'Elvis Presley', 'draft', null),
('Programming using Scala', 'Elvis Presley', 'published', '2020-05-12'),
('Programming using Java', 'Mike Jack', 'inactive', '2020-08-10'),
('Web Apllication - Python Flask', 'Bob Dillon', 'inactive', '2020-07-20'),
('Web Apllication - Java Spring', 'Bob Dillon', 'draft', null),
('Pipeline Orchetration - Python', 'Bob Dillon', 'draft', null),
('Streaming Pipeline - Python', 'Bob Dillon', 'published', '2020-10-05'),
('Web Apllication - Scala Play', 'Elvis Presley', 'inactive', '2020-09-30'),
('Web Apllication - Python Django', 'Bob Dillon', 'published', '2020-06-23'),
('Server Automation - Ansible', 'Uncle Sam', 'published', '2020-07-05')


select * from courses;


-- course_id|course_name                    |course_author|course_status|course_published_dt|
-- ---------+-------------------------------+-------------+-------------+-------------------+
--         1|Programming using Python       |Bob Dillon   |published    |         2020-09-30|
--         2|Data Engineering using Python  |Bob Dillon   |published    |         2020-07-15|
--         3|Data Engineering using Scala   |Elvis Presley|draft        |                   |
--         4|Programming using Scala        |Elvis Presley|published    |         2020-05-12|
--         5|Programming using Java         |Mike Jack    |inactive     |         2020-08-10|
--         6|Web Apllication - Python Flask |Bob Dillon   |inactive     |         2020-07-20|
--         7|Web Apllication - Java Spring  |Bob Dillon   |draft        |                   |
--         8|Pipeline Orchetration - Python |Bob Dillon   |draft        |                   |
--         9|Streaming Pipeline - Python    |Bob Dillon   |published    |         2020-10-05|
--        10|Web Apllication - Scala Play   |Elvis Presley|inactive     |         2020-09-30|
--        11|Web Apllication - Python Django|Bob Dillon   |published    |         2020-06-23|
--        12|Server Automation - Ansible    |Uncle Sam    |published     |         2020-07-05|



update courses 
set course_status = 'published'
where course_name = 'Server Automation - Ansible';