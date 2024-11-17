/*
Table: RequestAccepted

+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| requester_id   | int     |
| accepter_id    | int     |
| accept_date    | date    |
+----------------+---------+
(requester_id, accepter_id) is the primary key (combination of columns with unique values) for this table.
This table contains the ID of the user who sent the request, the ID of the user who received the request, and the date when the request was accepted.
 

Write a solution to find the people who have the most friends and the most friends number.

The test cases are generated so that only one person has the most friends.
*/

WITH tb_union_all AS (

    SELECT 
        t1.requester_id
    FROM
        RequestAccepted AS t1

    UNION ALL

    SELECT 
        t2.accepter_id
    FROM
        RequestAccepted AS t2

)

SELECT
    DISTINCT(requester_id) AS id
    , COUNT(requester_id) AS num
FROM
    tb_union_all

GROUP BY
    requester_id

ORDER BY
    COUNT(requester_id) DESC

LIMIT 1