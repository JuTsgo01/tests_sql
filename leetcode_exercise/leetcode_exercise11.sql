/*
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| empId       | int     |
| name        | varchar |
| supervisor  | int     |
| salary      | int     |
+-------------+---------+
empId is the column with unique values for this table.
Each row of this table indicates the name and the ID of an employee in addition to their salary and the id of their manager.
 
Table: Bonus

+-------------+------+
| Column Name | Type |
+-------------+------+
| empId       | int  |
| bonus       | int  |
+-------------+------+
empId is the column of unique values for this table.
empId is a foreign key (reference column) to empId from the Employee table.
Each row of this table contains the id of an employee and their respective bonus.
 
Write a solution to report the name and bonus amount of each employee with a bonus less than 1000.

Return the result table in any order.
*/

SELECT 
    t1.name,
    t2.bonus
FROM
    Employee AS t1
LEFT JOIN
    Bonus AS t2
ON
    t1.empId = t2.empId
WHERE
    t2.bonus < 1000
    OR
    t2.bonus IS NULL