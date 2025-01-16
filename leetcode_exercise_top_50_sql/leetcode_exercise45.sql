/*Table: Patients

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| patient_id   | int     |
| patient_name | varchar |
| conditions   | varchar |
+--------------+---------+
patient_id is the primary key (column with unique values) for this table.
'conditions' contains 0 or more code separated by spaces. 
This table contains information of the patients in the hospital.
 

Write a solution to find the patient_id, patient_name, and conditions of the patients who have Type I Diabetes. Type I Diabetes always starts with DIAB1 prefix.

Return the result table in any order.*/

SELECT 
    t1.patient_id
    , t1.patient_name 
    , t1.conditions

FROM
    Patients AS t1

WHERE
    t1.conditions LIKE '% DIAB1%'
    OR t1.conditions LIKE 'DIAB1%'
