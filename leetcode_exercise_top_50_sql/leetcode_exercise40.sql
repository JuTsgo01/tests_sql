/*
Table: Customer

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| customer_id   | int     |
| name          | varchar |
| visited_on    | date    |
| amount        | int     |
+---------------+---------+
In SQL,(customer_id, visited_on) is the primary key for this table.
This table contains data about customer transactions in a restaurant.
visited_on is the date on which the customer with ID (customer_id) has visited the restaurant.
amount is the total paid by a customer.
 

You are the restaurant owner and you want to analyze a possible expansion (there will be at least one customer every day).

Compute the moving average of how much the customer paid in a seven days window (i.e., current day + 6 days before). average_amount should be rounded to two decimal places.

Return the result table ordered by visited_on in ascending order.
*/

WITH tb_sum_amount_day AS (

    SELECT
        t1.visited_on
        , SUM(t1.amount) AS preview_amount

    FROM
        Customer AS t1

    GROUP BY
        t1.visited_on
),    

tb_window_function AS (

    SELECT
        *
        , ROUND(AVG(t2.preview_amount) OVER(ORDER BY t2.visited_on
                                            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW), 2)
                                        AS average_amount

        , SUM(t2.preview_amount) OVER(ORDER BY t2.visited_on
                                      ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)
                                  AS amount
    FROM
        tb_sum_amount_day AS t2
)

SELECT
    t3.visited_on
    , t3.amount
    , t3.average_amount

FROM
    tb_window_function AS t3

WHERE
    t3.visited_on >= DATE_ADD((SELECT t4.visited_on 
                              FROM tb_window_function AS t4
                              ORDER BY t4.visited_on 
                              LIMIT 1), INTERVAL 6 DAY)

ORDER BY
    t3.visited_on