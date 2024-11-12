/*
Table: Seat

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| student     | varchar |
+-------------+---------+
id is the primary key (unique value) column for this table.
Each row of this table indicates the name and the ID of a student.
The ID sequence always starts from 1 and increments continuously.
 

Write a solution to swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped.

Return the result table ordered by id in ascending order.
*/

WITH tb_new_id AS (

    SELECT
        CASE
            WHEN t1.id % 2 = 0 THEN (t1.id - 1)
            WHEN t1.id <> (SELECT t2.id FROM Seat AS t2 ORDER BY t2.id DESC LIMIT 1) AND t1.id % 2 <> 0 
                                                                            THEN (t1.id + 1)
            WHEN t1.id = (SELECT t2.id FROM Seat AS t2 ORDER BY t2.id DESC LIMIT 1) AND t1.id % 2 <> 0 
                                                                            THEN t1.id
        END AS id
        , t1.student

    FROM
        Seat AS t1

)

SELECT
    *

FROM
    tb_new_id AS t2

ORDER BY
    t2.id