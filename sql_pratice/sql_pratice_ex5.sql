/*

Show the total amount of male patients and the total amount of female patients in the patients table.
Display the two results in the same row.

*/

WITH tb_count_male AS (
  
  SELECT
      COUNT(*) AS male_count

  FROM patients AS t1

  WHERE
      t1.gender = 'M'
),

tb_count_female AS (

  SELECT
      COUNT(*) AS famale_count

  FROM patients AS t1

  WHERE
      t1.gender = 'F'
)
  
  
SELECT *

FROM tb_count_male, tb_count_female
