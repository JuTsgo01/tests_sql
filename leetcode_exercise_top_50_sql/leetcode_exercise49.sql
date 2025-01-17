/*Table: Products
+------------------+---------+
| Column Name      | Type    |
+------------------+---------+
| product_id       | int     |
| product_name     | varchar |
| product_category | varchar |
+------------------+---------+
product_id is the primary key (column with unique values) for this table.
This table contains data about the company's products.
 
Table: Orders
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| order_date    | date    |
| unit          | int     |
+---------------+---------+
This table may have duplicate rows.
product_id is a foreign key (reference column) to the Products table.
unit is the number of products ordered in order_date.
 
Write a solution to get the names of products that have at least 100 units ordered in February 2020 and their amount.

Return the result table in any order.*/

WITH tb_join_tables AS (

    SELECT
        t2.product_name 
        , t1.unit
        , t1.order_date 

    FROM
        Orders AS t1
        
    LEFT JOIN
        Products AS t2
    ON
        t1.product_id = t2.product_id
)

SELECT
    t2.product_name
    , SUM(t2.unit) AS unit         
FROM
    tb_join_tables AS t2

WHERE
    t2.order_date LIKE '2020-02%'

GROUP BY
    t2.product_name

HAVING
    SUM(t2.unit) >= 100
