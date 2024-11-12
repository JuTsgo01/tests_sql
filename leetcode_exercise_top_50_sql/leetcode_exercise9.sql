/*
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| recordDate    | date    |
| temperature   | int     |
+---------------+---------+
id is the column with unique values for this table.
There are no different rows with the same recordDate.
This table contains information about the temperature on a certain day.
 

Write a solution to find all dates' id with higher temperatures compared to its previous dates (yesterday).

Return the result table in any order.
*/

WITH tb_lag_diff AS (
    SELECT
        id,
        temperature,
        recordDate,
        LAG(recordDate) OVER(ORDER BY recordDate)  AS lag_date,
        temperature - LAG(temperature) OVER(ORDER BY recordDate)  AS diff_lag_temp

    FROM
        Weather
)

SELECT
    id AS ID
FROM
    tb_lag_diff
WHERE
    DATEDIFF(recordDate, lag_date) = 1 AND diff_lag_temp > 0
