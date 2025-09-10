/*SORTING RECORDS*/

--Basics of Sorting
SELECT *
FROM products
ORDER BY price;

SELECT *
FROM products
ORDER BY price ASC;

SELECT *
FROM products
ORDER BY price DESC;

--Two Variations on Sorting

SELECT *
FROM products
ORDER BY name;

SELECT *
FROM products
ORDER BY name DESC;

--Add second criteria for sorting data:
SELECT *
FROM products
ORDER BY price, weight;

--Can also mix order up:
SELECT *
FROM products
ORDER BY price ASC, weight DESC;


--Offset and Limit

SELECT COUNT(*)
FROM users;

--OFFSET skips 40 and shows last 10 records
SELECT*
FROM users
OFFSET 40;

SELECT*
FROM users
LIMIT 5;

SELECT *
FROM products
ORDER BY price
LIMIT 5;

SELECT *
FROM products
ORDER BY price DESC
LIMIT 5;

SELECT *
FROM products
ORDER BY price 
LIMIT 5
OFFSET 1;

--Used to show pages of records:
SELECT *
FROM products
ORDER BY price 
LIMIT 20
OFFSET 0;

SELECT *
FROM products
ORDER BY price 
LIMIT 20
OFFSET 40;



--Coding Exercise 17: Sorting, Offsetting, and Limiting
SELECT name
FROM phones
ORDER BY price DESC 
LIMIT 2
OFFSET 1;

----------------------------------------------------------------------------------