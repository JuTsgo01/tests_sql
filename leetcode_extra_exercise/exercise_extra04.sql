/*Table: Customers

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
+-------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table indicates the ID and name of a customer.
 

Table: Orders

+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| customerId  | int  |
+-------------+------+
id*/

# Write your MySQL query statement below
WITH tb_join AS(
    SELECT
        t1.name
        , t2.id
    FROM
        Customers AS t1

    LEFT JOIN
        Orders AS t2

    ON
        t1.id = t2.customerId
)

SELECT
    t3.name AS Customers
FROM
    tb_join AS t3

WHERE
    t3.id IS NULL