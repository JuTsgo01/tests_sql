/*Table: Employee

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| salary      | int     |
| managerId   | int     |
+-------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table indicates the ID of an employee, their name, salary, and the ID of their manager.
 

Write a solution to find the employees who earn more than their managers.

Return the result table in any order.*/

--Básico: left join em si mesma e filtra com uma CTE


WITH tb_join AS (
    SELECT
        t1.name
        , t1.salary AS employee_salary
        , t2.salary AS manager_salary

    FROM
        Employee AS t1

    LEFT JOIN
        Employee AS t2

    ON t1.managerId = t2.id
)

SELECT
    t3.name AS Employee

FROM
    tb_join AS t3 
    
WHERE
    t3.employee_salary > t3.manager_salary