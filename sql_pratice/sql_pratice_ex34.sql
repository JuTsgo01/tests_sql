SELECT
	t2.doctor_id,
    CONCAT(t2.first_name, " ", t2.last_name) AS full_name,
    t2.specialty,
    YEAR(admission_date) AS year_admission,
    count(*) AS qtde_admissions

FROM
	admissions AS t1

INNER JOIN
	doctors AS t2
 ON 
 	t1.attending_doctor_id = t2.doctor_id

group by
	CONCAT(t2.first_name, " ", t2.last_name),
    YEAR(admission_date)