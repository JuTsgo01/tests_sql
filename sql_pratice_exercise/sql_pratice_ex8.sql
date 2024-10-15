/*
Show the city and the total number of patients in the city.
Order from most to least patients and then by city name ascending.
*/

SELECT
	t1.city,
    count(*) AS qtde

FROM patients AS t1

GROUP BY city

ORDER BY count(*) DESC, city ASC
