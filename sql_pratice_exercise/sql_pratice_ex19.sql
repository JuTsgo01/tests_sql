/*
Display the total amount of patients for each province. Order by descending.
*/

SELECT
	t2.province_name,
    	COUNT(DISTINCT patient_id) AS qtde_patient_province
FROM
	patients AS t1

INNER JOIN
	province_names AS t2
ON 
	t1.province_id = t2.province_id
    
GROUP BY
	t2.province_name

ORDER BY 
	2 DESC
