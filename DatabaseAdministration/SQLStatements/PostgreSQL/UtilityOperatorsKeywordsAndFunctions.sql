/*Utility Operators, Keywords, and Functions*/


--GREATEST
SELECT GREATEST (20, 10, 30);

SELECT GREATEST (200, 10, 30);

SELECT name, weight, GREATEST (30,2*weight)
FROM products

--LEAST

SELECT LEAST(1, 20, 50, 100);

SELECT LEAST(120, 50, 100);

SELECT name, price, LEAST (price*0.5, 400)
FROM products


--CASE STATEMENT
SELECT
	name, 
  price,
  CASE
  	WHEN price > 600 THEN 'high'
    WHEN price > 300 THEN 'medium'
    ELSE 'cheap'
  END
 FROM products; 


SELECT
	name, 
  price,
  CASE
  	WHEN price*weight > 600 THEN 'high'
    WHEN price > 300 THEN 'medium'
    ELSE 'cheap'
  END 
 FROM products; 


 SELECT
	name, 
  price,
  CASE
  	WHEN price/weight > 600 THEN 'high'
    WHEN price > 300 THEN 'medium'
    ELSE 'cheap'
  END
 FROM products; 
