/*Table: Users

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| user_id       | int     |
| name          | varchar |
| mail          | varchar |
+---------------+---------+
user_id is the primary key (column with unique values) for this table.
This table contains information of the users signed up in a website. Some e-mails are invalid.
 

Write a solution to find the users who have valid emails.

A valid e-mail has a prefix name and a domain where:

The prefix name is a string that may contain letters (upper or lower case), digits, underscore '_', period '.', and/or dash '-'. The prefix name must start with a letter.
The domain is '@leetcode.com'.
Return the result table in any order.*/

--Pode parecer simples, mas, por não saber REGEX no SQL perdi 4 tentativas e perdi 4 pontos percentuais 

SELECT
    *

FROM
    Users AS t1

WHERE 1=1

    AND t1.mail REGEXP '^[a-zA-Z][a-zA-Z0-9._-]+@leetcode\\.com$'
    OR t1.mail REGEXP '^[a-zA-Z]+@leetcode\\.com$'
