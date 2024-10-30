/*
Table: Customer

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| customer_id | int     |
| product_key | int     |
+-------------+---------+
This table may contain duplicates rows. 
customer_id is not NULL.
product_key is a foreign key (reference column) to Product table.
 

Table: Product

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| product_key | int     |
+-------------+---------+
product_key is the primary key (column with unique values) for this table.
 

Write a solution to report the customer ids from the Customer table that bought all the products in the Product table.

Return the result table in any order.

Nessa solução eu não precisaria usar o IS NOT NULL. No entanto, imaginando um cenário de empresa, imaginemos que existisse dados nulos

*/

SELECT 
    t1.customer_id

FROM
    Customer AS t1

WHERE 1=1
    AND t1.product_key IS NOT NULL

GROUP BY
    t1.customer_id

HAVING
    COUNT(DISTINCT t1.product_key) = (SELECT COUNT(DISTINCT t2.product_key)
                                      FROM Product AS t2
                                      WHERE t2.product_key IS NOT NULL)