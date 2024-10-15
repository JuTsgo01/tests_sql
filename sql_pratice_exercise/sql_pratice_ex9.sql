/*
Show all allergies ordered by popularity. Remove NULL values from query.

*/

SELECT 
    t1.allergies,
	count(*) AS qtde_alergia
    
FROM 
	patients AS t1

WHERE
    t1.allergies IS NOT NULL


GROUP BY
	t1.allergies
    
ORDER BY 2 DESC