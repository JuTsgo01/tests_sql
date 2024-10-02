/*
Show patient_id, first_name, last_name from patients whose does not have any records in the admissions table. 
(Their patient_id does not exist in any admissions.patient_id rows.)
*/



SELECT 
	patient_id,
    first_name,
    last_name
FROM
	patients AS t1
    
WHERE NOT EXISTS (
    SELECT 1
    FROM
    admissions AS t2
    WHERE
    t1.patient_id = t2.patient_id
)