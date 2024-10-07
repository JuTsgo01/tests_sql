/*
All patients who have gone through admissions, can see their medical documents on our site.
Those patients are given a temporary password after their first admission. 
Show the patient_id and temp_password.

The password must be the following, in order:
1. patient_id
2. the numerical length of patient's last_name
3. year of patient's birth_date
*/

SELECT
	DISTINCT(t1.patient_id),
    CAST(t1.patient_id AS INTEGER)||CAST(len(t2.last_name) AS INTEGER)||CAST(year(t2.birth_date) AS INTEGER)
    
    
FROM
	admissions AS t1
    
INNER JOIN
	patients AS t2

ON t1.patient_id = t2.patient_id