/*
Show the percent of patients that have 'M' as their gender. Round the answer to the nearest hundreth number and in percent form.
*/

SELECT
	CONCAT(
    	ROUND(CAST(COUNT(CASE WHEN gender = "M" THEN 1 END) AS FLOAT) / CAST(COUNT(*) AS FLOAT), 4) * 100, "%")
    	AS percent
    
FROM
	patients
