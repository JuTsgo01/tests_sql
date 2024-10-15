/*
display the first name, last name and number of duplicate patients based on their first name and last name.
Ex: A patient with an identical name can be considered a duplicate.
*/

SELECT
    	first_name,
    	last_name,
    	COUNT(*)

FROM
	patients
    
GROUP BY
	last_name, first_name

HAVING
	COUNT(*) > 1

ORDER BY 
	3 DESC
