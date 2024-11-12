/*
Table: Users

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| user_id     | int     |
| user_name   | varchar |
+-------------+---------+
user_id is the primary key (column with unique values) for this table.
Each row of this table contains the name and the id of a user.
 
Table: Register

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| contest_id  | int     |
| user_id     | int     |
+-------------+---------+
(contest_id, user_id) is the primary key (combination of columns with unique values) for this table.

Each row of this table contains the id of a user and the contest they registered into.
 
Write a solution to find the percentage of the users registered in each contest rounded to two decimals.

Return the result table ordered by percentage in descending order. In case of a tie, order it by contest_id in ascending order.
*/

WITH tb_count_contest_id AS (

    SELECT
        t2.contest_id,
        CAST(COUNT(*) AS FLOAT) AS count_contest_id

    FROM
        Users AS t1

    LEFT JOIN
        Register AS t2
        
    USING(user_id)

    GROUP BY
        t2.contest_id 
)

SELECT
    contest_id,
    ROUND(count_contest_id/(SELECT COUNT(DISTINCT user_id) FROM Users) * 100,2) AS percentage 

FROM
    tb_count_contest_id

WHERE
    contest_id IS NOT NULL

ORDER BY
    ROUND(count_contest_id/(SELECT COUNT(DISTINCT user_id) FROM Users) * 100,2) DESC,
    contest_id ASC