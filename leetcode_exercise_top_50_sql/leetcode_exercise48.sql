/*Table Activities:

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| sell_date   | date    |
| product     | varchar |
+-------------+---------+
There is no primary key (column with unique values) for this table. It may contain duplicates.
Each row of this table contains the product name and the date it was sold in a market.
 

Write a solution to find for each date the number of different products sold and their names.

The sold products names for each date should be sorted lexicographically.

Return the result table ordered by sell_date.*/

SELECT
    t1.sell_date
    , COUNT(DISTINCT(t1.product)) AS num_sold
    , GROUP_CONCAT(DISTINCT(t1.product)) AS products

FROM
    Activities AS t1

GROUP BY
    t1.sell_date

ORDER BY
    t1.sell_date ASC
    , t1.product ASC

