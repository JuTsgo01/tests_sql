/*
Show all patient's first_name, last_name, and birth_date who were born in the 1970s decade.
Sort the list starting from the earliest birth_date.
*/

SELECT 
	t1.first_name,
    t1.last_name,
    t1.birth_date
    
FROM
    patients AS t1

WHERE
    t1.birth_date LIKE '197%'

ORDER BY 
    t1.birth_date ASC