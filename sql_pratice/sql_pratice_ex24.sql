/*
Show all of the patients grouped into weight groups.
Show the total amount of patients in each weight group.
Order the list by the weight group decending.

For example, if they weight 100 to 109 they are placed in the 100 weight group, 110-119 = 110 weight group, etc.

OBS: Comecei pensando em fazer usando CASE WHEN, no entanto a query ficaria verbosa, extensa e nada otimizada, então chegamos ao resultado:

Pesquisei e conheci a função 'FLOOR' que foi a usada nessa query
*/

SELECT
	COUNT(*) AS qte_paciente_grupo_peso,
    FLOOR(weight/10)*10 AS grupo_peso
FROM
	patients
GROUP BY
	FLOOR(weight/10)*10

ORDER BY
	FLOOR(weight/10)*10 
    DESC