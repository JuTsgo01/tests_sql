/*
Show all of the days of the month (1-31) and how many admission_dates occurred on that day. 
Sort by the day with most admissions to least admissions.
*/

SELECT
	DAY(admission_date) AS day_number,
    COUNT(*) AS qtde_internacao

FROM
	admissions

GROUP BY
	DAY(admission_date)

ORDER BY
	COUNT(*) DESC