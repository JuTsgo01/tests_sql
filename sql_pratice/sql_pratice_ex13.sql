/*
Show the difference between the largest weight and smallest weight for patients with the last name 'Maroni'
*/

SELECT
    (MAX(t1.weight) - MIN(t1.weight)) AS diferenca_pesos

FROM
    patients AS t1

WHERE
    t1.last_name = 'Maroni'