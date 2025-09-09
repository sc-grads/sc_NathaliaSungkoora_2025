/*VIEWS*/


--FIND MOST POPULAR USER =user with the MOST tags
SELECT users.username, COUNT(*)
FROM users
JOIN(
	SELECT user_id FROM photo_tags
	UNION ALL
	SELECT user_id FROM caption_tags
	) AS tags 
ON tags.user_id=users.id
GROUP BY username
ORDER BY COUNT(*) DESC;

--------------------------------------------------------------
--CREATE A VIEW:
CREATE VIEW tags AS (
	    SELECT id, created_at, user_id, post_id, 'photo_tag' AS type
	    FROM photo_tags
    UNION ALL
	    SELECT id, created_at, user_id, post_id, 'caption_tag' AS type
	    FROM caption_tags
);

--SEE VIEW RESULTS:
SELECT *
FROM tags;

SELECT *
FROM tags
WHERE type = 'caption_tag';

---------------------------------------------------------------------------------------------
--REWRITE PREVIOUS QUERY BY REMOVING SUB QUERY:
--FIND MOST POPULAR USER =user with the MOST tags
SELECT users.username, COUNT(*)
FROM users
JOIN tags 
ON tags.user_id=users.id
GROUP BY username
ORDER BY COUNT(*) DESC;

---------------------------------------------------------------------------------------------
--WHEN TO USE A VIEW:

--Example: showing the 10 most recent posts across the platform.
CREATE VIEW recent_posts AS (
    SELECT *
    FROM posts
    ORDER BY created_at DESC
    LIMIT 10
);

SELECT *
FROM recent_posts;

--Example 2: retrieves usernames for the ten most recent posts by using the recent_posts view
SELECT username
FROM recent_posts
JOIN users
ON users.id= recent_posts.user_id;


-------------------------------------------------------------------------------------------------------------------
--DELETING OR CHANGING VIEWS

--CHANGE VIEW
CREATE OR REPLACE VIEW recent_posts AS
(SELECT * FROM posts
ORDER BY created_at DESC
LIMIT 15);

SELECT *
FROM recent_posts;

--DELETE VIEW
DROP VIEW recent_posts;


------------------------------------------------------------------------------------------------------
--MATERIALIZED VIEWS

--1. FIRST JOIN TABLES
SELECT *
FROM likes
LEFT JOIN posts 
ON likes.post_id=posts.id
LEFT JOIN comments
ON likes.comment_id=comments.id;

---2. Grouping by Week
SELECT 
	date_trunc('week', COALESCE(posts.created_at, comments.created_at)) AS week
FROM likes
LEFT JOIN posts 
ON likes.post_id=posts.id
LEFT JOIN comments
ON likes.comment_id=comments.id;

--3. Sort values
SELECT 
	date_trunc('week', COALESCE(posts.created_at, comments.created_at)) AS week
FROM likes
LEFT JOIN posts 
ON likes.post_id=posts.id
LEFT JOIN comments
ON likes.comment_id=comments.id
ORDER BY week;

--4. Group by week
SELECT 
	date_trunc('week', COALESCE(posts.created_at, comments.created_at)) AS week
FROM likes
LEFT JOIN posts 
ON likes.post_id=posts.id
LEFT JOIN comments
ON likes.comment_id=comments.id
GROUP BY week
ORDER BY week;

--5. DO COUNT
SELECT 
	date_trunc('week', COALESCE(posts.created_at, comments.created_at)) AS week,
	count(posts.id) as num_likes_for_posts, --DOES NOT COUNT NULL values
	count(comment_id) as num_likes_for_comments
FROM likes
LEFT JOIN posts 
ON likes.post_id=posts.id
LEFT JOIN comments
ON likes.comment_id=comments.id
GROUP BY week
ORDER BY week;

--Creating and Refreshing Materialized Views

CREATE MATERIALIZED VIEW weekly_likes AS(
	SELECT 
		date_trunc('week', COALESCE(posts.created_at, comments.created_at)) AS week,
		count(posts.id) as num_likes_for_posts, --DOES NOT COUNT NULL values
		count(comment_id) as num_likes_for_comments
	FROM likes
	LEFT JOIN posts 
	ON likes.post_id=posts.id
	LEFT JOIN comments
	ON likes.comment_id=comments.id
	GROUP BY week
	ORDER BY week
	)WITH DATA;

SELECT *
FROM weekly_likes;

--DELETE DATA FROM ORIGINAL TABLE-> DOES NOT change/update data in materialized view
--DELETE FROM posts
--WHERE created_at,'2010-02-01';

--REFRESH MATERIALIZED VIEW:
REFRESH MATERIALIZED VIEW weekly_likes;












