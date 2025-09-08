/*RECURSIVE CTEs: COMMON TABLE EXPRESSIONS*/

--EXAMPLE: Starts at 3 and countsdown to 1
WITH RECURSIVE countdown(val) AS (
  SELECT 3 AS val
  UNION
  SELECT val - 1 FROM countdown WHERE val > 1
)
SELECT * 
FROM countdown; 

--EXAMPLE: Starts at 10 and countsdown to 1
WITH RECURSIVE countdown(val) AS (
  SELECT 10 AS val
  UNION
  SELECT val - 1 FROM countdown WHERE val > 1
)
SELECT * 
FROM countdown; 


--------------------------------------------------------------------------------------
--STEP-BY-STEP
--EXAMPLE: Starts at 3 and countsdown to 1
WITH RECURSIVE countdown(val) AS (
  SELECT 3 AS val --SELECT statement=Initial, Non-recursive query
  UNION --WILL ALWAYS HAVE UNION
  SELECT val - 1 FROM countdown WHERE val > 1 --Recursive query
)
SELECT * 
FROM countdown; 


---------------------------------------------------------------------------------------
--WRITING OUT A RECURSIVE QUERY:
--WRITING SUGGESTIONS FOR USER ID=1000 AND WHO THEY SHOULD TRY FOLLOWING
WITH RECURSIVE suggestions (leader_id, follower_id, depth) AS (
    -- Initial selection: pick a starting point with follower_id = 1000 and depth 1
	    SELECT leader_id, follower_id, 1 AS depth
	    FROM followers
	    WHERE follower_id = 1000
    UNION
    -- Recursive step: join with the 'followers' table to find deeper connections
	    SELECT followers.leader_id, followers.follower_id, depth + 1
	    FROM followers
	    JOIN suggestions ON suggestions.leader_id = followers.follower_id
	    -- Limit the depth of recursion to 3 levels
	    WHERE depth < 3
	)
-- Select unique user IDs and usernames from the users table
SELECT DISTINCT users.id, users.username
FROM suggestions
JOIN users ON users.id = suggestions.leader_id
WHERE depth > 1
-- Limit the result to 30 rows
LIMIT 30;	