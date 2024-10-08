/*
Sort the province names in ascending order in such a way that the province 'Ontario' is always on top
*/

SELECT 
	province_name
FROM
	province_names
ORDER BY 
	IIF(province_name = "Ontario", 0, 1), province_name
