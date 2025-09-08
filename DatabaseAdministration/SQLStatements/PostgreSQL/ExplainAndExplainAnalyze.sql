/*EXPLAIN and EXPLAIN ANALYZE*/


SELECT username, contents
FROM users
JOIN comments 
ON comments.user_id = users.id
WHERE username = 'Alyson14'; --GET ALL DATA

EXPLAIN 
SELECT username, contents
FROM users
JOIN comments 
ON comments.user_id = users.id
WHERE username = 'Alyson14';--GET QUERY PLAN


EXPLAIN ANALYZE
SELECT username, contents
FROM users
JOIN comments 
ON comments.user_id = users.id
WHERE username = 'Alyson14';--GET QUERY PLAN, RUN TIME(PLAN TIME, EXECUTION TIME) 


----------------------------------------------------------------------------------
--SELECT STATISTICS ON QUERY
SELECT *
FROM pg_stats
WHERE tablename = 'users'; 
















