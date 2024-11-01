CREATE TABLE triangle(x integer, y integer,z integer)

INSERT INTO triangle values(12, 13, 24),(15,16,17),(18,19,20),(13,14,29)

SELECT * FROM triangle t 
x |y |z |
--+--+--+
12|13|24|
15|16|17|
18|19|20|
13|14|29|

-- Query
SELECT x,y,z, 
CASE WHEN x+y>z and x+z>y and y+z>x THEN 'yes_triangle'
ELSE 'no_triangle' END AS triangle_logic
FROM triangle t 

--output
x |y |z |triangle_logic|
--+--+--+--------------+
12|13|24|yes_triangle  |
15|16|17|yes_triangle  |
18|19|20|yes_triangle  |
13|14|29|no_triangle   |