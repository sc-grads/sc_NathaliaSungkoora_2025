/*SQL STATEMENTS for POSTGRESQL using a CLient*/
--FILTERING

--CREATE Table and INSERT Values:

--CREATE Table
CREATE TABLE cities (
	name VARCHAR(50), 
  country VARCHAR(50),
  population INTEGER,
  area INTEGER
);

--INSERT DATA into Table

INSERT INTO cities (name, country, population, area)
VALUES ('Tokyo', 'Japan', 38505000, 8223);

INSERT INTO cities (name, country, population, area)
VALUES 
	('Delhi', 'India', 28125000, 2240),
  ('Shanghai', 'China', 22125000, 4015),
  ('Sao Paulo', 'Brazil', 20935000, 3043);


--Using WHERE Clause
SELECT name, area
FROM cities
WHERE area> 4000;

SELECT name, area
FROM cities
WHERE area= 8223;

SELECT name, area
FROM cities
WHERE area<> 8223;

---COMPOUND WHERE

SELECT name, area
FROM cities
WHERE area BETWEEN 2000 AND 4000;

SELECT name, area
FROM cities
WHERE name IN ('Delhi', 'Shanghai');

SELECT name, area
FROM cities
WHERE area NOT IN ('8223', '3043');

SELECT name, area
FROM cities
WHERE area NOT IN ('8223', '3043') AND name = 'Delhi';

SELECT name, area
FROM cities
WHERE area NOT IN ('8223', '3043') OR name = 'Delhi';

SELECT name, area
FROM cities
WHERE area NOT IN ('8223', '3043') 
OR name = 'Delhi'
OR name = 'Tokyo';

--CODING EXERCISE 3:
SELECT name, price
FROM phones
WHERE units_sold > 5000;

SELECT name, manufacturer
FROM phones
WHERE manufacturer IN ('Apple', 'Samsung');


--Calculations in WHERE Clause:
SELECT name, population/area AS Population_density
FROM cities
WHERE population/area>6000;

--Coding Exercise

Select name, price * units_sold AS total_revenue
FROM phones
WHERE  price * units_sold > 1000000;

--UPDATING TABLE 
UPDATE cities
SET population = 39505000
WHERE name = 'Tokyo';
SELECT *
FROM cities
WHERE name = 'Tokyo';

--DELEE Records
DELETE
FROM cities
WHERE name = 'Tokyo';

--INSERT Row back into Table:
INSERT INTO cities (name, country, population, area)
VALUES('Tokyo', 'Japan', 38505000, 8223)

--Coding Exercise 6: Try Updating Records In a Table!
-- Write query here to update the 'units_sold' of the phone with name 'N8' to 8543
UPDATE phones
SET units_sold = 8543
WHERE name = 'N8';

-- Write query here to select all rows and columns of the 'phones' table
SELECT * 
FROM phones;

--Coding Exercise 7: Practice Deleting Records

-- Write your delete SQL here
DELETE 
FROM phones
WHERE manufacturer = 'Samsung';

-- Write query here to select all rows and columns from phones

SELECT *
FROM phones;



--