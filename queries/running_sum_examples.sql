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