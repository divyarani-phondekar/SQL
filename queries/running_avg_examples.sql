-- 1. Calculate Moving Average of a Stock

CREATE TABLE stocks(DAY date, company varchar, price NUMERIC);
ALTER TABLE stocks DROP COLUMN DAY;
ALTER TABLE stocks ADD daynum varchar;
SELECT * FROM stocks;

INSERT INTO stocks values('A', 100, 'day1'), ('A', 120, 'day2'), ('A', 140, 'day3'), ('A', 100, 'day4'), 
('B', 200, 'day1'), ('B', 200, 'day2'), ('B', 240, 'day3'), ('B', 250, 'day4')

company|price|daynum|
-------+-----+------+
A      |  100|day1  |
A      |  120|day2  |
A      |  140|day3  |
A      |  100|day4  |
B      |  200|day1  |
B      |  200|day2  |
B      |  240|day3  |
B      |  250|day4  |

-- Query
SELECT *,
avg(price) OVER (PARTITION BY company ORDER BY daynum 
ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS movingavg 
FROM stocks

-- Output 

company|price|daynum|movingavg         |
-------+-----+------+------------------+
A      |  100|day1  |             100.0|
A      |  120|day2  |             110.0|
A      |  140|day3  |             120.0|
A      |  100|day4  |             120.0|
B      |  200|day1  |             200.0|
B      |  200|day2  |             200.0|
B      |  240|day3  |213.33333333333334|
B      |  250|day4  |             230.0|