/*RELATED TABLES AND JOINS*/

--Queries with Joins and Aggregations

--Joining Data from Different Tables
SELECT c.contents, u.username
FROM COMMENTS as c
JOIN users as u 
ON c.user_id=u.id;