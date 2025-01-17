/*Table: Employee

+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| salary      | int  |
+-------------+------+
id is the primary key (column with unique values) for this table.
Each row of this table contains information about the salary of an employee.
 

Write a solution to find the second highest distinct salary from the Employee table.
If there is no second highest salary, return null (return None in Pandas). */


SELECT
    DISTINCT(
        MAX(t1.salary)
    ) AS SecondHighestSalary 

FROM 
    Employee AS t1

WHERE 1=1
    AND t1.salary <> (SELECT
                    MAX(t2.salary)
                    FROM Employee AS t2)