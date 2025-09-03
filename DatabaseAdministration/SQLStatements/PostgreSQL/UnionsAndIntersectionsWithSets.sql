/*UNIONS AND INTERSECTIONS WITH SETS*/

--UNION

 SELECT *
FROM products
ORDER BY price DESC 
LIMIT 4;

SELECT *
FROM products
ORDER BY price/weight DESC 
LIMIT 4;

--UNION
(  SELECT *
  FROM products
  ORDER BY price DESC 
  LIMIT 4
)
 UNION 
(
  SELECT *
  FROM products
  ORDER BY price/weight DESC 
  LIMIT 4
);

--UNION ALL
(  SELECT *
  FROM products
  ORDER BY price DESC 
  LIMIT 4
)
 UNION ALL
(
  SELECT *
  FROM products
  ORDER BY price/weight DESC 
  LIMIT 4
);

--ERROR: SELECT name FROM products
 UNION 
SELECT price FROM products


--INTERSECT
(  
  SELECT *
  FROM products
  ORDER BY price DESC
  LIMIT 4
)
INTERSECT
(
	SELECT *
  FROM products
  ORDER BY price/weight DESC
  LIMIT 4
);


(  
  SELECT *
  FROM products
  ORDER BY price DESC
  LIMIT 4
)
INTERSECT ALL
(
	SELECT *
  FROM products
  ORDER BY price/weight DESC
  LIMIT 4
);


--Removing Commonalities with Except

(  
  SELECT *
  FROM products
  ORDER BY price DESC
  LIMIT 4
)
EXCEPT
(
	SELECT *
  FROM products
  ORDER BY price/weight DESC
  LIMIT 4
);
  

--Coding Exercise 18: Merging Results with Union
SELECT manufacturer
FROM phones
WHERE price <170 

UNION  

SELECT manufacturer 
FROM phones 
GROUP BY manufacturer
HAVING COUNT(*)>2 ;

----------------------------------------------------------------------------------------------