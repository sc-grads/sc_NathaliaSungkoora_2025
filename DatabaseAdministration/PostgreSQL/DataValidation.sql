
--CREATE TABLE AND INSERT DATA
CREATE TABLE products(
	id SERIAL PRIMARY KEY,
	name VARCHAR(40),
	department VARCHAR(40),
	price INTEGER,
	weight INTEGER
);


SELECT * FROM public.products
ORDER BY id ASC 

INSERT INTO products(name,department,price,weight)
VALUES
	('Shirt', 'Clothes', 20, 1);

--APPLYING A NULL CONSTRAINT
INSERT INTO products(name, department,weight)
VALUES
	('Pants', 'Clothes',3

--HAVE to deal with NULL values before applying constraints	
ALTER TABLE products
ALTER COLUMN price
SET NOT NULL; -- "ERROR:  column "price" of relation "products" contains null values"


--SOLVING NULL CONSTRAINT ISSUE

UPDATE products
SET price=999
WHERE price IS NULL;

--NOW CAN ALTER TABLE
ALTER TABLE products
ALTER COLUMN price
SET NOT NULL;

--INSERT DATA TO TEST NUL CONSTRAINTS
INSERT INTO products(name, department, weight)
VALUES
	('Shoes', 'Clothes', 5);
	--"ERROR:  null value in column "price" of relation "products" violates not-null constraint"

--DEFAULT COLUMN VALUES

SELECT * FROM public.products
ORDER BY id ASC 

ALTER TABLE products
ALTER COLUMN price
SET DEFAULT 999;

--NOW DO INSERT TO TEST IF DEAFULT IS SET:
INSERT INTO products(name, department, weight)
VALUES
	('Gloves','Tools',1);


--APPLYING A UNIQUE CONSTRAINT TO ONE COLUMN
INSERT INTO products(name, department,price,weight)
VALUES
	('Shirt', 'Tools', 24, 1);

--Firts have to deal with duplicates before altering table
--Manually changes Shirt ->RED Shirt->SAVED DATA CHANGES
ALTER TABLE products
ADD UNIQUE(name);

--TEST INSERT WITH UNIQUE CONSTRAINT ADDED:
--ERROR:  duplicate key value violates unique constraint "products_name_key"
--Key (name)=(Shirt) already exists. 
INSERT INTO products (name, department, price, weight)
VALUES
	('Shirt', 'Tools', 24,1);


--MULITPLE COLUMN UNIQUENESS
--DROP existing constraints
ALTER TABLE products
DROP CONSTRAINT products_name_key;

--ADDING A UNIQUE COMBO of name and department 
ALTER TABLE products
ADD UNIQUE (name, department);

--Insert product with same name but different department:
INSERT INTO products (name, department, price,weight)
VALUES
	('Shirt', 'Housewares',24,1);
	
SELECT * FROM public.products
ORDER BY id ASC 	

--TEST VALIDATION by adding the SAME name and department
INSERT INTO products (name, department, price,weight)
VALUES
	('Shirt', 'Clothes',24,1);
--ERROR:  duplicate key value violates unique constraint "products_name_department_key"
--Key (name, department)=(Shirt, Clothes) already exists.


--DROP CONSTRAINT(if needed):
ALTER TABLE products
DROP CONSTRAINT products_name_department_key;

--ADDING A VALIDATION CHECK

ALTER TABLE products
ADD CHECK (price>0);

--CHECK if constraint worked:
INSERT INTO products(name, department, price,weight)
VALUES
	('Belt', 'Clothes', -99,1);
--ERROR:  new row for relation "products" violates check constraint "products_price_check"
--Failing row contains (9, Belt, Clothes, -99, 1). 	


--CHECKS OVER MULTIPLE COLUMNS

CREATE TABLE orders(
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL,
	created_at TIMESTAMP NOT NULL,
	est_delivery TIMESTAMP NOT NULL

	CHECK (created_at<est_delivery)
	);

INSERT INTO orders (name, created_at, est_delivery)
VALUES
	('Shirt', '2000-NOV-20 01:00AM', '2000-NOV-25 01:00AM');

SELECT * FROM public.orders
ORDER BY id ASC; 

--CHECK IF CONSTRAINT WORKED:
INSERT INTO orders (name, created_at, est_delivery)
VALUES
	('Shirt', '2000-NOV-20 01:00AM', '2000-NOV-10 01:00AM');
--ERROR:  new row for relation "orders" violates check constraint "orders_check"



