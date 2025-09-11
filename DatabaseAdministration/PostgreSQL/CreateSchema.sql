/*CREATE SCHEMA FOR API TESTING*/

--CREATE SCHEMA
CREATE SCHEMA test;

--CREATE TABLE IN TEST SCHEMA
CREATE TABLE test.users(
	id SERIAL PRIMARY KEY,
	username VARCHAR
);

SELECT * FROM test.users;


--INSERT VALUES INTO TEST.USERS SCHEMA
INSERT INTO test.users(username)
VALUES 
	('Alex'),
	('Bob');


--SHOW WHICH SCHEMA IS DEFAULT
SHOW search_path; --"$user", public


--UPDATING DEFAULT SCHEMA
SET search_path TO test, public;

SELECT * FROM users; --shows test users first
SELECT * FROM public.users; --shows public users table


--UNDO TESTING TO SET PUBLIC TO DEFAULT AGAIN
SET search_path TO "$user", public;


