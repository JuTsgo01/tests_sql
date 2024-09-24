/*

Show patient_id and first_name from patients where their first_name 
start and ends with 's' and is at least 6 characters long.

*/

WITH tb_characters_long AS (

  SELECT 
  		first_name,
		patient_id,
        len(first_name) AS characters_long

  FROM
      patients

  WHERE
      characters_long >= 6
  AND
      first_name LIKE 'S%s'
)

SELECT 
	patient_id,
    first_name
FROM 
	tb_characters_long;