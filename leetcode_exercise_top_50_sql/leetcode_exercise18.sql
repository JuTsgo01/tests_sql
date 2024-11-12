/*
****************************************************************************************
ESSE EXERCICIO PODE PARECER BOBO, MAS EU RESOLVI A PRIMEIRA VEZ USANDO A CLAUSULA 'ON'
DEPOIS DE FEITO, FUI VER AS DISCUSSÕES SOBRE O EXERCICIO E DESCOBRI A CLAUSULA 'USING'
QUE FACILITA MUITO QUANDO AS TABELAS QUE ESTAMOS FAZENDO 'JOIN' POSSUEM A MESMA COLUNA

COM ISSO EU SAIR DE "MELHOR QUE 13,63% DAS PESSOAS" PARA "MELHOR QUE 80,65%"
****************************************************************************************

Table: Person

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| personId    | int     |
| lastName    | varchar |
| firstName   | varchar |
+-------------+---------+
personId is the primary key (column with unique values) for this table.
This table contains information about the ID of some persons and their first and last names.
 

Table: Address

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| addressId   | int     |
| personId    | int     |
| city        | varchar |
| state       | varchar |
+-------------+---------+
addressId is the primary key (column with unique values) for this table.
Each row of this table contains information about the city and state of one person with ID = PersonId.
 

Write a solution to report the first name, last name, city, and state of each person in the Person table. If the address of a personId is not present in the Address table, report null instead.

Return the result table in any order.
*/

SELECT
    t1.firstName,
    t1.lastName,
    t2.city,
    t2.state
FROM
    Person AS t1
LEFT JOIN
    Address AS t2 USING(personId) 