/*
Table: Transactions

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| country       | varchar |
| state         | enum    |
| amount        | int     |
| trans_date    | date    |
+---------------+---------+

id is the primary key of this table.
The table has information about incoming transactions.
The state column is an enum of type ["approved", "declined"].

Write an SQL query to find for each month and country, the number of transactions and their total amount, the number of approved transactions and their total amount.

Return the result table in any order.
*/

SELECT
    DATE_FORMAT(t1.trans_date, '%Y-%m') AS month

    , t1.country

    , COUNT(t1.id) AS trans_count

    , SUM(CASE WHEN
            t1.state = 'approved' THEN 1 ELSE 0 END
) AS approved_count

    , SUM(t1.amount) AS trans_total_amount

    , SUM(CASE WHEN 
            t1.state = 'approved' THEN t1.amount ELSE 0 END
) AS approved_total_amount

FROM
    Transactions AS t1

GROUP BY
    DATE_FORMAT(t1.trans_date, '%Y-%m'),
    t1.country