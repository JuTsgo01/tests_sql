/*
Table: Courses

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| student     | varchar |
| class       | varchar |
+-------------+---------+
(student, class) is the primary key (combination of columns with unique values) for this table.
Each row of this table indicates the name of a student and the class in which they are enrolled.
 

Write a solution to find all the classes that have at least five students.

Return the result table in any order.
*/

SELECT
    t1.class

FROM
    Courses AS t1

GROUP BY
    t1.class
    
HAVING 
    (SELECT COUNT(*) FROM Courses WHERE class = t1.class) >= 5
