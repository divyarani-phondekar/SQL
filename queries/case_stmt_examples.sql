-- 1. Find a sets of value which fits a triangle

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

------------------------------------------------------------------------------------
-- 2. Find the root, leaf and inner node of tree

CREATE TABLE tree(id integer, p_id integer);

INSERT INTO tree values(1, NULL),(2, 1),(3,1),(4,2),(5,2) 

SELECT * FROM tree
id|p_id|
--+----+
 1|    |
 2|   1|
 3|   1|
 4|   2|
 5|   2|

--query
SELECT id, p_id,
CASE WHEN p_id IS NULL THEN 'root node'
WHEN p_id IS NOT NULL AND id IN (SELECT DISTINCT p_id FROM tree) THEN 'inner_node'
ELSE 'leaf_node'
END AS node
FROM tree;

--output
id|p_id|node      |
--+----+----------+
 1|    |root node |
 2|   1|inner_node|
 3|   1|leaf_node |
 4|   2|leaf_node |
 5|   2|leaf_node |

 ------------------------------------------------------------------------------------


 