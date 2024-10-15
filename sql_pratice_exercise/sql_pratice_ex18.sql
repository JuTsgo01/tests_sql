/*
For each doctor, display their id, full name, and the first and last admission date they attended.
*/

SELECT
	t2.doctor_id,
    	t2.first_name || ' ' || t2.last_name AS full_name,
    	min(t1.admission_date) AS first_admission,
    	max(t1.admission_date) AS last_admission
    
FROM 
    	admissions AS t1
INNER JOIN
	doctors as t2
ON 
	t1.attending_doctor_id = t2.doctor_id
GROUP BY 
    	t2.doctor_id
