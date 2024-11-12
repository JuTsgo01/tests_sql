/*+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| department  | varchar |
| managerId   | int     |
+-------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table indicates the name of an employee, their department, and the id of their manager.
If managerId is null, then the employee does not have a manager.
No employee will be the manager of themself.
 

Write a solution to find managers with at least five direct reports.

Return the result table in any order.
*/

WITH count_managerId_repeat AS (
    
    SELECT
        managerId,
        COUNT(*) AS count_managerId_repeat
    FROM
        Employee
    WHERE
        managerId IS NOT NULL
    GROUP BY
        managerId
    HAVING
        COUNT(*) >= 5
)

SELECT 
    t2.name
FROM
    count_managerId_repeat AS t1
JOIN
    Employee AS t2
ON
    t1.managerId = t2.id