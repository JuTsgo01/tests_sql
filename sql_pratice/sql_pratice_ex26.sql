/*
Show patient_id, first_name, last_name, and attending doctor's specialty.
Show only the patients who has a diagnosis as 'Epilepsy' and the doctor's first name is 'Lisa'

Check patients, admissions, and doctors tables for required information.
*/

SELECT
	t1.patient_id,
    t1.first_name,
    t1.last_name,
    t3.specialty

FROM
	patients AS t1

INNER JOIN
	admissions AS t2
    
ON 
	t1.patient_id = t2.patient_id

INNER JOIN
	doctors AS t3

ON
	t2.attending_doctor_id = t3.doctor_id
    
WHERE
	t2.diagnosis = 'Epilepsy'
AND
	t3.first_name = 'Lisa'     
