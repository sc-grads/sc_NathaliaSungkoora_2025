/*RELATED TABLES AND JOINS*/

--Queries with Joins and Aggregations

--Joining Data from Different Tables
SELECT c.contents, u.username
FROM COMMENTS as c
JOIN users as u 
ON c.user_id=u.id;

SELECT c.contents, u.username, c.photo_id
FROM COMMENTS as c
JOIN users as u 
ON c.user_id=u.id;

SELECT c.contents, p.url
FROM COMMENTS as c
JOIN photos as p  
ON c.photo_id=p.id;

--Coding Exercise 9: Practice Joining Data
SELECT b.title, a.name
FROM books as b 
JOIN authors as a 
ON a.id=b.author_id;
----------------------------------------------

-- Alternate Forms of Syntax
--Order frequently matters
SELECT c.contents, p.url
FROM photos as p   
JOIN COMMENTS as c
ON c.photo_id=p.id;

--Duplicate Column Names
SELECT c.id
FROM photos as p   
JOIN COMMENTS as c
ON c.photo_id=p.id;

SELECT p.id
FROM photos as p   
JOIN COMMENTS as c
ON c.photo_id=p.id;

--Rename columns:
SELECT c.id AS comment_id, p.id
FROM photos as p   
JOIN COMMENTS as c
ON c.photo_id=p.id;

--Rename Tables
SELECT c.id , p.id
FROM photos as p   
JOIN COMMENTS as c
ON c.photo_id=p.id;

SELECT c.id AS comment_id, p.id
FROM photos  p   
JOIN COMMENTS  c
ON c.photo_id=p.id;
-------------------------------------------------------

--MISSING DATA IN JOINS
SELECT p.url, u.username
FROM photos  p   
JOIN users as u  
ON u.id=p.user_id;

--INSERTING NULL user id in photos tables:
INSERT INTO photos(url, user_id)
VALUES ('https:banner.jpg', NULL);

--Four Kinds of Joins

--Inner Join
SELECT url, username
FROM photos
JOIN users ON users.id = photos.user_id;

--Left Join
SELECT url, username
FROM photos
LEFT JOIN users ON users.id = photos.user_id;

--Right Join
SELECT url, username
FROM photos
RIGHT JOIN users ON users.id = photos.user_id;

--Full Outer Join
SELECT url, username
FROM photos
FULL JOIN users ON users.id = photos.user_id;


--Each Join in Practice

SELECT url, username
FROM photos
LEFT JOIN users ON users.id = photos.user_id;


INSERT INTO users(username)
VALUES('Nicole');

SELECT url, username
FROM photos
RIGHT JOIN users ON users.id = photos.user_id;

SELECT url, username
FROM photos
FULL JOIN users ON users.id = photos.user_id;


--Coding Exercise 10: Joins, Joins, Join!

SELECT b.title, a.name
FROM authors as a
LEFT JOIN books as b
ON a.ID=b.author_id;

--------------------------------------------------------------
-- WHERE Clause=Filtering
SELECT p.url, c.contents
FROM COMMENTS as c
JOIN photos as p
ON c.photo_id = p.id
WHERE c.user_id = p.user_id;


--Three Way Joins
SELECT p.url, c.contents, u.username
FROM COMMENTS as c
JOIN photos as p
ON c.photo_id = p.id
JOIN users as u 
ON u.id=c.user_id AND u.id=p.user_id;

--Coding Exercise 11: Three Way Exercise
SELECT b.title, a.name, r.rating
FROM books AS b
JOIN authors AS a
  ON a.id = b.author_id
JOIN reviews AS r
  ON a.id = r.reviewer_id
 AND b.id = r.book_id;



--------------------------------------------------------------------