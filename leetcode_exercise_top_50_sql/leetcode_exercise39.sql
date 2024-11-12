/*
Table: Movies

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| movie_id      | int     |
| title         | varchar |
+---------------+---------+
movie_id is the primary key (column with unique values) for this table.
title is the name of the movie.
 

Table: Users

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| user_id       | int     |
| name          | varchar |
+---------------+---------+
user_id is the primary key (column with unique values) for this table.
The column 'name' has unique values.
Table: MovieRating

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| movie_id      | int     |
| user_id       | int     |
| rating        | int     |
| created_at    | date    |
+---------------+---------+
(movie_id, user_id) is the primary key (column with unique values) for this table.
This table contains the rating of a movie by a user in their review.
created_at is the user's review date. 
 

Write a solution to:

Find the name of the user who has rated the greatest number of movies. In case of a tie, return the lexicographically smaller user name.
Find the movie name with the highest average rating in February 2020. In case of a tie, return the lexicographically smaller movie name.
*/

WITH tb_user_rating AS (

    SELECT
        t2.name AS results

    FROM
        MovieRating AS t1

    LEFT JOIN
        Users AS t2

    ON
        t1.user_id = t2.user_id

    GROUP BY
        t2.name

    ORDER BY
        COUNT(t2.name) DESC
        , t2.name ASC
        
    LIMIT 1
), 

tb_avg_movie_rating AS (

    SELECT
        t4.title

    FROM
        MovieRating AS t3

    LEFT JOIN
        Movies AS t4

    ON
        t3.movie_id = t4.movie_id

    WHERE
        t3.created_at LIKE '2020-02%'

    GROUP BY
        t4.title

    ORDER BY
        AVG(t3.rating) DESC
        , t4.title ASC

    LIMIT 1

)

SELECT * FROM tb_user_rating

UNION ALL

SELECT * FROM tb_avg_movie_rating