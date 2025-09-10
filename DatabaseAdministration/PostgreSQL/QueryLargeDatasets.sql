/*WORK WITH LARGE DATASETS*/


--Coding Exercise 15: Group By Review
SELECT paid, COUNT(*)
FROM orders
GROUP BY paid;

--Coding Exercise 16: Inner Join Review
SELECT u.first_name, u.last_name, o.paid
FROM users as u 
JOIN orders as o 
ON o.user_id=u.id;


