-- 1. Get running sum of total

SELECT invoiceid, total FROM Invoice i 

InvoiceId|Total|
---------+-----+
        1| 1.98|
        2| 3.96|
        3| 5.94|
        4| 8.91|
        5|13.86|

SELECT invoiceid, total, sum(total) over(ORDER BY invoiceid) AS runningsum
FROM Invoice i 

InvoiceId|Total|runningsum|
---------+-----+----------+
        1| 1.98| 1.98|
        2| 3.96| 5.94|
        3| 5.94|11.88|
        4| 8.91|20.79|
        5|13.86|34.65|

------------------------------------------------------------------------------------
-- 2. Get percentage of prize money

CREATE TABLE proportion(name varchar, prize integer);

INSERT INTO proportion values('Aakash', 100), ('Ajay', 200), ('Ajesh', 400),('Amey', 300)

SELECT * FROM proportion p;

name  |prize|
------+-----+
Aakash|  100|
Ajay  |  200|
Ajesh |  400|
Amey  |  300|

-- Query
SELECT name, prize, total, (CAST(prize AS float)/total) * 100 
FROM
(SELECT name, prize, 
sum(prize) over(ORDER BY name  ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS total
FROM proportion p )

-- Output
name  |prize|total|(CAST(prize AS float)/total) * 100|
------+-----+-----+----------------------------------+
Aakash|  100| 1000|                              10.0|
Ajay  |  200| 1000|                              20.0|
Ajesh |  400| 1000|                              40.0|
Amey  |  300| 1000|                              30.0|