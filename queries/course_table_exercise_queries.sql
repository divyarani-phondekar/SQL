select * from courses;

-- Get all the details of courses which are in 'inactive' ot 'draft' state.
select *
from courses c 
where course_status in ('inactive', 'draft');


-- Get all the details of courses which are related to 'python' or 'scala'.
select *
from courses c
where course_name like '%Python%' or course_name like '%Scala%';


-- get count of courses by 'course_status'
-- Output should contain 'course_status' and 'course_count'
select course_status, count(*) as course_count
from courses c
group by course_status;


-- Get count of 'published' courses by 'course_author'
-- Output should contain 'course_author' and 'course_count'
select course_author, count(*) as course_count
from courses c 
where course_status = 'published'
group by course_author;


-- Get all the details of 'python' or 'scala' releted courses which are in 'draft' status.
select *
from courses c 
where (course_name like '%Python%' or course_name like '%Scala%') and course_status = 'draft';


-- Get author and count where author have more than one published course
-- Output should contain 'course_author' and 'course_count'
select course_author, count(*) as course_count
from courses c 
where course_status = 'published' 
group by course_author
having count(*) > 1;

