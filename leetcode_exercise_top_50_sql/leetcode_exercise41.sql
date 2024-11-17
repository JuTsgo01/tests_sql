/*
Table: Products

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| new_price     | int     |
| change_date   | date    |
+---------------+---------+
(product_id, change_date) is the primary key (combination of columns with unique values) of this table.
Each row of this table indicates that the price of some product was changed to a new price at some date.
 

Write a solution to find the prices of all products on 2019-08-16. Assume the price of all products before any change is 10.

Return the result table in any order.

The result format is in the following example
*/

WITH tb_max_date AS (


    SELECT
        DISTINCT(t1.product_id)
        , MAX(t1.change_date) OVER (PARTITION BY t1.product_id) AS max_change_date

    FROM
        Products AS t1

    WHERE 1=1
        AND t1.change_date <= '2019-08-16'
)

SELECT
    t2.product_id
    , t3.new_price AS price

FROM
    tb_max_date AS t2

LEFT JOIN
    Products AS t3
ON
    t2.product_id = t3.product_id
    AND t2.max_change_date = t3.change_date


UNION


SELECT
    t4.product_id
    , 10 AS price

FROM
    Products AS t4

WHERE
    t4.product_id NOT IN (SELECT product_id FROM tb_max_date)