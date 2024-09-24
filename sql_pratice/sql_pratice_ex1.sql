/*
Show unique first names from the patients table which only occurs once in the list

For example, if two or more people are named 'John' in the first_name
    column then don't include their name in the output list. If only 1
    person is named 'Leo' then include them in the output.

*/

WITH tb_name_unique AS (

    SELECT first_name,
            count(first_name)

    FROM 
        patients

    group by
    first_name

    having 
    count(first_name) = 1
 )
 
select 
	first_name 
FROM
	tb_name_unique