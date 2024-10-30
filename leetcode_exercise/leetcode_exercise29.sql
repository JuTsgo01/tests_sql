/*
Table: MyNumbers

+-------------+------+
| Column Name | Type |
+-------------+------+
| num         | int  |
+-------------+------+
This table may contain duplicates (In other words, there is no primary key for this table in SQL).
Each row of this table contains an integer.
 

A single number is a number that appeared only once in the MyNumbers table.

Find the largest single number. If there is no single number, report null.
*/

WITH tb_count AS (

    SELECT
        t1.num AS num
        , COUNT(*) AS qtd_aparece

    FROM
        MyNumbers AS t1

    GROUP BY
        t1.num

    ORDER BY
        COUNT(*)
        , t1.num DESC
)

SELECT
    MAX(num) AS num

FROM
    tb_count

WHERE
    qtd_aparece = 1
