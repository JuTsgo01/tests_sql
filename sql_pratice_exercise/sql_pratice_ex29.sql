/*
Show the provinces that has more patients identified as 'M' than 'F'. 
Must only show full province_name
*/

WITH tb_qtd_homem_mulher AS (
  
  SELECT
      t2.province_name,
      COUNT(CASE WHEN t1.gender = "M" THEN "M" END) AS qtd_homem,
      COUNT(CASE WHEN t1.gender = "F" THEN "M" END) AS qtd_mulher

  FROM
      patients AS t1
  INNER JOIN
      province_names AS t2
  ON
      t1.province_id = t2.province_id

  GROUP BY
      t2.province_name
)
 
SELECT
 	province_name
FROM
	tb_qtd_homem_mulher

WHERE
	qtd_homem > qtd_mulher



