
/*DATA STORAGE*/
SHOW data_directory; --"C:/Program Files/PostgreSQL/17/data"

SELECT oid, datname
FROM pg_database; --Lists all database name with unique internal id


SELECT * 
FROM pg_class; --Lists all objects stored in databse
---------------------------------------------------------------------------------------------------
