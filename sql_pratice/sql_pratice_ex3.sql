/*
Show patient_id, first_name, last_name from patients whos diagnosis is 'Dementia'.

Primary diagnosis is stored in the admissions table.
*/

SELECT
	t1.patient_id,
    t1.first_name,
    t1.last_name
FROM
	patients AS t1

INNER JOIN 
	admissions as t2
ON 
	t1.patient_id = t2.patient_id
    
WHERE
	t2.diagnosis = 'Dementia'