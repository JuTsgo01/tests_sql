/*
Table: Delivery

+-----------------------------+---------+
| Column Name                 | Type    |
+-----------------------------+---------+
| delivery_id                 | int     |
| customer_id                 | int     |
| order_date                  | date    |
| customer_pref_delivery_date | date    |
+-----------------------------+---------+
delivery_id is the column of unique values of this table.
The table holds information about food delivery to customers that make orders at some date and specify a preferred delivery date (on the same order date or after it).
 

If the customer's preferred delivery date is the same as the order date, then the order is called immediate; otherwise, it is called scheduled.

The first order of a customer is the order with the earliest order date that the customer made. It is guaranteed that a customer has precisely one first order.

Write a solution to find the percentage of immediate orders in the first orders of all customers, rounded to 2 decimal places.
*/

WITH tb_named_pref_delivery AS (
    SELECT
        *
        , (
            CASE 
                WHEN t1.order_date = t1.customer_pref_delivery_date
                    THEN 'immediate'
                    ELSE 'scheduled'
            END
        ) AS name_pref_delivery

        , ROW_NUMBER() 
                OVER (
                    PARTITION BY t1.customer_id
                    ORDER BY t1.customer_id, t1.order_date
        ) AS number_row

    FROM
        Delivery AS t1

    WHERE 1=1
        AND t1.order_date IS NOT NULL
        AND t1.customer_pref_delivery_date IS NOT NULL
)

SELECT
    ROUND(
        (
            SUM(
                CASE 
                    WHEN name_pref_delivery = 'immediate' 
                        THEN 1 
                        ELSE 0 
                END
        ) / COUNT(*)
    ) * 100, 2
) AS immediate_percentage 

FROM
    tb_named_pref_delivery

WHERE
    number_row = 1


/*
Segunda opição seria retirar o "CASE WHEN" da "tb_named_pref_delivery", usado para dar nome ao tipo. 

FICARIA ASSIM:
*/


WITH tb_named_pref_delivery AS (
    SELECT
        *
        , ROW_NUMBER() 
                OVER (
                    PARTITION BY t1.customer_id
                    ORDER BY t1.customer_id, t1.order_date
        ) AS number_row

    FROM
        Delivery AS t1

    WHERE 1=1
        AND t1.order_date IS NOT NULL
        AND t1.customer_pref_delivery_date IS NOT NULL
)

SELECT

    ROUND(
        (
            SUM(
                CASE 
                    WHEN order_date = customer_pref_delivery_date
                        THEN 1 
                        ELSE 0 
                END
        ) / COUNT(*)
    ) * 100, 2
) AS immediate_percentage 

FROM
    tb_named_pref_delivery

WHERE
    number_row = 1