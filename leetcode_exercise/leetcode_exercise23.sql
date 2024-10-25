/*
Table: Activity

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| player_id    | int     |
| device_id    | int     |
| event_date   | date    |
| games_played | int     |
+--------------+---------+
(player_id, event_date) is the primary key (combination of columns with unique values) of this table.
This table shows the activity of players of some games.
Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on someday using some device.
 

Write a solution to report the fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal places. 
In other words, you need to count the number of players that logged in for at least two consecutive days starting from their first login date, 
then divide that number by the total number of players.
*/

WITH tb_posision_log AS (

    SELECT
        t1.player_id
        , FIRST_VALUE(t1.event_date) OVER(PARTITION BY t1.player_id 
                                          ORDER BY t1.event_date
                                        ) AS first_log

        , LEAD(t1.event_date) OVER(PARTITION BY t1.player_id
                                   ORDER BY t1.event_date
                                ) AS second_log

    FROM
    Activity AS t1
)

SELECT
    ROUND(    
        COUNT(
            DISTINCT
            CASE
                WHEN DATEDIFF(second_log, first_log) = 1
                    THEN player_id
                    ELSE NULL
            END
        )/COUNT(DISTINCT player_id),2
    ) AS fraction

FROM
    tb_posision_log