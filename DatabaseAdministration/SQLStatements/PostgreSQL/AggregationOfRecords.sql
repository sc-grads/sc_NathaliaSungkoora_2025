/*AGGREGATION OF RECORDS*/


--GROUP BY
SELECT user_id
FROM COMMENTS
GROUP BY user_id;

--AGGREGATE FUNCTIONS
-- Find the maximum ID in the comments table
SELECT MAX(id) AS max_id
FROM comments;

-- Find the minimum ID
SELECT MIN(id) AS min_id
FROM comments;

-- Find the average ID
SELECT AVG(id) AS avg_id
FROM comments;

-- Count how many IDs there are
SELECT COUNT(id) AS total_ids
FROM comments;

-- Sum all IDs together
SELECT SUM(id) AS sum_ids
FROM comments;

--Combining Group By and Aggregates

SELECT user_id, MAX(id) 
FROM comments
GROUP BY user_id;

SELECT user_id, COUNT(id) AS num_comments_created
FROM comments
GROUP BY user_id;

--NULLS are NOT counted in COUNTED:
SELECT COUNT(user_id)
FROM photos;

--COUNT(*)->selects all rows including NULLS:
SELECT COUNT(*)
FROM photos;

SELECT user_id, COUNT(*)
FROM comments
GROUP BY user_id;

--MORE GROUPING EXAMPLES
SELECT photo_id,COUNT(*)
FROM comments
GROUP BY photo_id;


--Coding Exercise 12: Practice For Grouping and Aggregating
SELECT author_id, COUNT(*)
FROM books
GROUP BY author_id;


--------------------------------------------------------------------------

--Coding Exercise 13: Grouping With a Join!
SELECT a.name, COUNT(*)
FROM authors as a
JOIN books as b 
ON a.id=b.author_id
GROUP BY a.name;

--------------------------------------------------------------------------
--Filtering Groups with Having
SELECT photo_id,COUNT(*)
FROM comments
WHERE photo_id < 3
GROUP BY photo_id
HAVING COUNT(*) > 2;