/*CREATE INDEXES*/


--CREATE INDEX
CREATE INDEX ON users (username);

--Can add own name of index:
--Name of table, name of columns, idx
CREATE INDEX users_sername_idx ON users (username);

--DROPPING AN INDEX
--DROP INDEX users_username_idx;

------------------------------------------------------------------------------------

--BENCHMARKING QUERIES

SELECT *
FROM users
WHERE username = 'Emil30';

--USING EXPLAIN ANALYZE

--WITH index: 0.70ms
EXPLAIN ANALYZE
SELECT *
FROM users
WHERE username = 'Emil30';

--WITHOUT index: 1.40ms
--DROP INDEX users_username_idx;
EXPLAIN ANALYZE
SELECT *
FROM users
WHERE username = 'Emil30';

-------------------------------------------------------------------------
--Downsides of Indexes

--Print out size(space) used by users table:
SELECT pg_size_pretty(pg_relation_size('users'));
--Output= "872 kB"

--Print out size(space) used by users index:
SELECT pg_size_pretty(pg_relation_size('users_username_idx'));
--Output = "184 kB"

-------------------------------------------------------------------------
--Automatically Generated Indexes

SELECT relname, relkind
FROM pg_class
WHERE relkind = 'i'; --'i'=indexes in DB

-----------------------------------------------------------------
--Behind the Scenes of Indexes

CREATE EXTENSION pageinspect;

--Retrieve info from B-tree, Meta Page:
SELECT *
FROM bt_metap ('users_username_idx');
--Root=3

--Retrieve items from a specific page(ROOT NODE)
SELECT * 
FROM bt_page_items('users_username_idx', 3);
--ctid=index of leaf nodes to go to

--Retrieve items from a specific page (LEAF NODE)
SELECT * 
FROM bt_page_items('users_username_idx', 1);
--ctid=index of info in leaf nodes to go to

------------------------------------------------------------------------------
--Retrieve file info of DB
SELECT oid, datname
FROM pg_database; --16418

SHOW data_directory;

SELECT * --SELECT INDEXES
FROM PG_CLASS
WHERE relkind = 'i'; 


------------------------------------------------------------------------------
--Using my INDEX

SELECT *
FROM likes
WHERE created_at <'2013-01-01';


SELECT COUNT(*)
FROM likes
WHERE created_at <'2013-01-01'; --63055

--ADDING EXPLAIN
EXPLAIN
SELECT *
FROM likes
WHERE created_at <'2013-01-01'; --
--"Seq Scan on likes  (cost=0.00..14248.11 rows=64220 width=24)"
--"Filter: (created_at < '2013-01-01 00:00:00+02'::timestamp with time zone)"

--CREATE INDEX ON created_at to SPEED UP QUERY:
CREATE INDEX likes_created_at_idx 
ON likes(created_at);

--RERUN ORGINAL QUERY:
EXPLAIN
SELECT *
FROM likes
WHERE created_at <'2013-01-01'; 
-- ADDS an INDEX CHECK

--TRY GREATER THAN QUERY:

SELECT COUNT(*)
FROM likes
WHERE created_at >'2013-01-01';  --688954

--CHECK HOW QUERY IS GETTING EXECUTED:
EXPLAIN
SELECT *
FROM likes
WHERE created_at >'2013-01-01';
--LOOKS AT EACH FILE SCANNED SEQUENTIALLY ->SAVES TIME NOT USING THE INDEX
--"Seq Scan on likes  (cost=0.00..14248.11 rows=687788 width=24)"
--"Filter: (created_at > '2013-01-01 00:00:00+02'::timestamp with time zone)"








