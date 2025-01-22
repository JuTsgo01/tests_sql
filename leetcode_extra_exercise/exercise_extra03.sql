/*Table: Person

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| email       | varchar |
+-------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table contains an email. The emails will not contain uppercase letters.
 

Write a solution to report all the duplicate emails. Note that it's guaranteed that the email field is not NULL.

Return the result table in any order.
*/

-- COUNT com GOUP BY e aplicar uma CTE para filtrar maior a dois

WITH tb_count AS(

    SELECT
        *
        , COUNT(t1.email) AS count_times

    FROM
        Person AS t1

    GROUP BY
        t1.email
)

SELECT
    t2.email AS Email

FROM
    tb_count AS t2

WHERE
    t2.count_times > 1