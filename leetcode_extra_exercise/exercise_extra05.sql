/*Table: Employee

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| id           | int     |
| name         | varchar |
| salary       | int     |
| departmentId | int     |
+--------------+---------+
id is the primary key (column with unique values) for this table.
departmentId is a foreign key (reference columns) of the ID from the Department table.
Each row of this table indicates the ID, name, and salary of an employee. It also contains the ID of their department.
 

Table: Department

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
+-------------+---------+
id is the primary key (column with unique values) for this table. It is guaranteed that department name is not NULL.
Each row of this table indicates the ID of a department and its name.
 

Write a solution to find employees who have the highest salary in each of the departments.

Return the result table in any order.*/

--Básico: left join com CTE para filtrar

WITH tb_rnk AS(

    SELECT
        t2.name AS Department
        , t1.name AS Employee
        , t1.salary AS Salary
        , RANK() OVER(PARTITION BY t2.name  ORDER BY t1.salary DESC) AS rnk
    FROM
        Employee AS t1

    LEFT JOIN
        Department AS t2

    ON
        t1.departmentId = t2.id
)

SELECT 
    t3.Department 
    , t3.Employee
    , t3.Salary 

FROM
    tb_rnk AS t3

WHERE
    t3.rnk = 1