/*
Table: Triangle

+-------------+------+
| Column Name | Type |
+-------------+------+
| x           | int  |
| y           | int  |
| z           | int  |
+-------------+------+
In SQL, (x, y, z) is the primary key column for this table.
Each row of this table contains the lengths of three line segments.
 

Report for every three line segments whether they can form a triangle.

Return the result table in any order.

Explicação: para uma forma ser triangulo, a soma de dois lado deve ser maior que o terceiro lado e não deve ter lado com valor nulo/zero
*/

SELECT
    t1.*
    , CASE 
        WHEN (t1.x + t1.y) > t1.z 
            AND (t1.y + t1.z) > t1.x
            AND (t1.x + t1.z) > t1.y
        THEN 'Yes'
        ELSE 'No' 
    END AS triangle

FROM
    Triangle AS t1

WHERE 1=1
    AND t1.x IS NOT NULL
    AND t1.y IS NOT NULL
    AND t1.z IS NOT NULL