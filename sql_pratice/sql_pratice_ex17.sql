/*
Show first_name, last_name, and the total number of admissions attended for each doctor.
Every admission has been attended by a doctor.
*/

SELECT
	t2.first_name,
    	t2.last_name,
    	count(*) AS admissions_total
    
FROM
    	admissions AS t1

INNER JOIN
    	doctors AS t2
ON
    	t1.attending_doctor_id = t2.doctor_id

GROUP BY
    	t1.attending_doctor_id
