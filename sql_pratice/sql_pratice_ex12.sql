/*
Show the province_id(s), sum of height; 
where the total sum of its patient's height is greater than or equal to 7,000.
*/

SELECT
	t1.province_id,
    SUM(t1.height) AS soma_altura

FROM 
	patients AS t1
    
GROUP BY
	t1.province_id

HAVING
	SUM(t1.height) >= 7000

ORDER BY
	SUM(t1.height) DESC