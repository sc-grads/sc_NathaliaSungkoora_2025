SELECT COUNT(*)
FROM users; --5345

SELECT COUNT(*)
FROM likes; --752009


--Highest User ID's Exercise
SELECT *
FROM users 
ORDER BY id DESC
LIMIT 3;

--Posts by a Particular User
SELECT u.username, p.caption
FROM users as u
JOIN posts as p
ON u.id=p.user_id
WHERE p.user_id=200;

--Likes Per User
SELECT u.username, COUNT(l.id)
FROM users as u
JOIN likes as l
ON u.id=l.user_id
GROUP BY u.username;
