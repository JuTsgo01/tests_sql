/*
Show all columns for patient_id 542's most recent admission_date.
*/

WITH tb_patientid_542 AS (

    SELECT *

    FROM
        admissions AS t1

    WHERE
        t1.patient_id = 542

    ORDER BY
        t1.admission_date DESC
)

SELECT *

FROM
	tb_patientid_542
    
LIMIT 1
	


