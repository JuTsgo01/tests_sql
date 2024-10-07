/*
For each day display the total amount of admissions on that day. Display the amount changed from the previous date.
*/

WITH tb_count_day_admission AS (
  
  SELECT 
  		admission_date,
		COUNT(*) AS qtd_admission_day
  FROM
      admissions

  GROUP BY
      admission_date

),

  tb_with_lag_admission_day AS (

  SELECT 
      *,
      LAG(qtd_admission_day) OVER(ORDER BY admission_date) AS lag_admission_day


  FROM
      tb_count_day_admission
)


SELECT
	admission_date,
    qtd_admission_day,
    (qtd_admission_day - lag_admission_day) AS diff_day_lagday_admission
    
FROM
	tb_with_lag_admission_day
	


