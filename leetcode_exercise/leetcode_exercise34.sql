/*
Table: Logs

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| num         | varchar |
+-------------+---------+
In SQL, id is the primary key for this table.
id is an autoincrement column starting from 1.
 

Find all numbers that appear at least three times consecutively.

Return the result table in any order.
*/

WITH tb_row_number AS (

    SELECT
        *   
        , LAG(t1.num) OVER(ORDER BY t1.id) AS lag_num
        , LEAD(t1.num) OVER(ORDER BY t1.id) AS lead_num

    FROM
        Logs AS t1
    
    WHERE 1=1
    AND t1.id IS NOT NULL
    AND t1.num IS NOT NULL
)

SELECT
    DISTINCT(t2.num) AS ConsecutiveNums 

FROM
    tb_row_number AS t2

WHERE 1=1
    AND t2.num = t2.lag_num
    AND t2.num = t2.lead_num