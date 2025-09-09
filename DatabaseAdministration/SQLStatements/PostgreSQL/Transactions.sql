/*TRANSACTIONS*/

--CREATE Sample Data to test TRANSACTIONS:

CREATE TABLE accounts(
	id SERIAL PRIMARY KEY,
	name VARCHAR(20) NOT NULL,
	balance INTEGER NOT NULL
);

--INSERTING DATA INTO accounts table for noth Alyson and Gia:
INSERT INTO accounts(name, balance)
VALUES 
	('Gia', 100),
	('Alyson', 100);

--SEEING INFO ADDED:
SELECT * FROM accounts;

-----------------------------------------------------------------------------------------
--TEST WITH TWO CONNECTIONS:

--CONNECTION 1: 
BEGIN;

UPDATE accounts
SET balance = balance-50
WHERE name = 'Alyson';


SELECT * FROM accounts;

UPDATE accounts
SET balance = balance+50
WHERE name = 'Gia';

COMMIT;

--CONNECTION 2: 
--(DO NOT RUN BEGIN)
--READS FROM MAIN DATA POOL
SELECT * FROM accounts;
-----------------------------------------------------------------------------------------

--RESET ACCOUNTS TO 100 TO TEST CRASH SIMULATION:
UPDATE accounts
SET balance=100;

SELECT * FROM accounts;

--CONNECTION 1: 
BEGIN;

UPDATE accounts
SET balance = balance-50
WHERE name = 'Alyson';


SELECT * FROM accounts;

--CONNECTION 2:

SELECT * FROM accounts;

--TERMINATE SESSIONS TO SIMULATE CRASH

--NOW WHEN YOU RUN 
SELECT * FROM accounts;
--GIVES 100 EACH AS IF NO CHANGES WERE MADE


---------------------------------------------------------------------------------------------------------------------\

--Closing Aborted Transactions

BEGIN;

SELECT * FROM AASDFGHJKLKJHGFDSADFGHJKL;
--ERROR:  relation "aasdfghjklkjhgfdsadfghjkl" does not exist

SELECT * FROM accounts;
--ERROR:  current transaction is aborted, commands ignored until end of transaction block 

ROLLBACK;

--NOW eveything works as expected:
SELECT * FROM accounts;






	