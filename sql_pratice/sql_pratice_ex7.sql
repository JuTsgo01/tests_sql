/*
Show patient_id, diagnosis from admissions.
Find patients admitted multiple times for the same diagnosis.
*/

SELECT 
	t1.patient_id,
    t2.diagnosis

FROM 
	patients AS t1

INNER JOIN
	admissions AS t2
ON
	t1.patient_id = t2.patient_id

GROUP BY
	t1.patient_id, t2.diagnosis

HAVING COUNT(t1.patient_id) > 1
