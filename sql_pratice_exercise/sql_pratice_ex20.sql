/*
For every admission, display the patient's full name, their admission diagnosis, and their doctor's full name who diagnosed their problem.

*/

SELECT
	t2.first_name || ' ' || t2.last_name AS full_name_patient,
    	t1.diagnosis,
    	t3.first_name || ' ' || t3.last_name AS full_name_doctor
    

FROM
	admissions AS t1

INNER JOIN
	patients AS t2
ON
	t1.patient_id = t2.patient_id
    
INNER JOIN
	doctors AS t3
ON
	t1.attending_doctor_id = t3.doctor_id
