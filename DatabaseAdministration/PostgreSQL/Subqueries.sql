/*SUBQUERIES*/

--Subquery

SELECT name, price
FROM products
WHERE price > (
  SELECT MAX(price) FROM products WHERE department ='Toys'
);


--Structure of data in a subquery

SELECT *
FROM orders;

SELECT id
FROM orders;

SELECT COUNT(*)
FROM orders;

SELECT product_id, COUNT(*)
FROM orders
GROUP BY product_id;

SELECT paid
FROM orders
WHERE id = 3;S

SELECT paid
FROM orders
WHERE id IN (3, 4, 5);


--Subqueries in a Select

--Subquery:
SELECT MAX(price)
FROM products;

SELECT price 
FROM products 
WHERE id=3;

--Larger Queries
SELECT name, price, (
  SELECT price
	FROM products
  WHERE id =3
)
FROM products 
WHERE price>867;

SELECT name, price, (
  SELECT price
	FROM products
  WHERE id =3
) As id_3_price
FROM products 
WHERE price>867;

--Coding Exercise 19: Embedding in Select
SELECT name, price, price/
(SELECT MAX(price) FROM phones) AS price_ratio
FROM phones

------------------------------------------------------------------------
-- Subqueries in a From
SELECT name, price/weight as price_weight_ratio
FROM products;


SELECT name, price_weight_ratio
FROM (
  SELECT name, price/weight AS price_weight_ratio
  FROM products) AS p
WHERE price_weight_ratio>5 ;

-- From Subqueries that Return a Value

SELECT MAX(price)
FROM products;

SELECT *
FROM (SELECT MAX(price)
FROM products) as p;

--Example of a Subquery in a From

--grouping how many orders each customer made:
SELECT user_id, COUNT(*) AS order_count
FROM orders
GROUP BY user_id;

--have a single value =can now apply aggregate function to it
SELECT p.order_count   
FROM   
   (SELECT user_id, COUNT(*) AS order_count
    FROM orders
    GROUP BY user_id) AS p;

--NOW APPLY AVERAGE FUNCTION
SELECT AVG(p.order_count)   
FROM   
   (SELECT user_id, COUNT(*) AS order_count
    FROM orders
    GROUP BY user_id) AS p;


--Coding Exercise 20: Subquery From's
SELECT AVG(price) AS average_price
FROM phones 
GROUP BY manufacturer


SELECT MAX(average_price) AS max_average_price
FROM(
SELECT AVG(price) AS average_price
FROM phones 
GROUP BY manufacturer ) as p;

--Subqueries in a Join Clause
--Shows all users who ordered product 3
SELECT user_id
FROM orders
WHERE product_id=3;

SELECT u.first_name
FROM users AS u
JOIN(
    SELECT user_id
    FROM orders
    WHERE product_id=3
) AS o
ON o.user_id=u.id;

--ALTERNATIVELY:
SELECT u.first_name
FROM users AS u
JOIN orders AS o
ON o.user_id=u.id
WHERE o.product_id=3;

--More Useful - Subqueries with Where
SELECT id 
FROM products
WHERE price/weight >50;

SELECT id 
FROM orders
WHERE product_id IN (
			SELECT id 
			FROM products
			WHERE price/weight >50);
---------------------------------------------------------
--Data Structure with Where Subqueries

--SUBQUERY: 
SELECT AVG(price)
FROM products;

--COMBINATION:
SELECT name
FROM products
WHERE price>
            (
            SELECT AVG(price)
            FROM products
            );

--Coding Exercise 21: Subquery Where's
SELECT name, price
FROM phones
WHERE price > (
                SELECT price
                FROM phones
                WHERE name = 'S5620 Monte'
            );
--------------------------------------------------------------------
--The Not In Operator with a List

--SUBQUERY:
SELECT department
FROM products
WHERE price<100;

SELECT name, department 
FROM products
WHERE department NOT IN (
				SELECT department
				FROM products
				WHERE price<100
						);
-- A New Where Operator

SELECT name, department, price 
FROM products
WHERE price>ALL (
				SELECT price
                FROM products
                WHERE department = 'Industrial'
				);

--Finally Some!
--SUBQUERY:
SELECT price
   FROM products
   WHERE department = 'Industrial';


SELECT name, department, price 
FROM products
WHERE price>SOME (
	SELECT price
   FROM products
   WHERE department = 'Industrial'
				);

----------------------------------------------
--Coding Exercise 22: Practice Your Subqueries!
SELECT name
FROM phones
WHERE price>ALL (SELECT price
                 FROM phones 
                 WHERE manufacturer='Samsung');

------------------------------------------------------

-- Correlated Subqueries

SELECT name, department, price 
FROM products AS p1
WHERE p1.price = 
(
	SELECT MAX(price)
  FROM products AS p2
  WHERE p1.department = p2.department
				);

--More on Correlated Subqueries

SELECT p1.name, 
(
SELECT count(*)
FROM orders as o1
  WHERE o1.product_id=p1.id
) AS num_orders
FROM products as p1;


--A Select Without a From?

--MUST Return a SINGLE value
SELECT 
(
SELECT MAX(price)
FROM products  
);

--FIND RATIO between MAX and MIN price
SELECT 
(
  SELECT MAX(price)
  FROM products  
)
/
(
	SELECT MIN(price)
  FROM products
);


----FIND RATIO between MAX and AVG price

SELECT 
(
  SELECT MAX(price)
  FROM products  
)
/
(
	SELECT AVG(price)
  FROM products
) AS max_avg_ratio;

--SHOW BOTH
SELECT 
(
  SELECT MAX(price)
  FROM products  
)
,
(
	SELECT AVG(price)
  FROM products
) AS max_avg_ratio;


--Coding Exercise 23: From-less Selects
SELECT 
(
SELECT MAX(price)
FROM phones
) AS max_price,

(
SELECT MIN(price)
FROM phones
) AS min_price,

(
SELECT AVG(price)
FROM phones
) AS avg_price;


-----------------------------------------------------------