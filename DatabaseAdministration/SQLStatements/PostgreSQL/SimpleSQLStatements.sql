/*SQL STATEMENTS for POSTGRESQL using a CLient*/

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

 --SELECTING frmo table
 SELECT area,name,country FROM cities;
 SELECT area,area,area FROM cities;
 SELECT country, population FROM cities;



 --CREATE,INSERT,SELECT CODING EXERCISE  
 -- You don't need to change these lines
CREATE TABLE movies (
    title VARCHAR(60),
    box_office INTEGER
);

INSERT INTO movies (title, box_office)
VALUES 
    ('The Avengers', 1500000000),
    ('Batman v Superman', 873000000);
    

-- WRITE YOUR SOLUTION BELOW THIS LINE!
    SELECT title, box_office
    FROM movies;

	--CALCULATED COLUMNS


--MATH OPERATORS
SELECT name, population/area FROM cities;
SELECT name, population+area FROM cities;
SELECT name, population*area FROM cities; --integer out of range

--Rneaming calculated coulumns:
SELECT name, population/area AS population_density
FROM cities;


--CALCULATED COLOUMNS CODING EXERCISE
SELECT name, price*units_sold AS revenue
FROM phones;

--STRING OPERATORS AND FUNCTIONS
SELECT name|| country
FROM cities;

SELECT name|| ', '|| country
FROM cities;

SELECT name|| ', '|| country AS location
FROM cities;

SELECT
  CONCAT(UPPER(name), ', ', UPPER(country)) AS location
FROM
  cities;

  SELECT
  UPPER(CONCAT(name, ', ', country)) AS location
FROM
  cities;