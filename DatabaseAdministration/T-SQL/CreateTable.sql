/*Create Table */

CREATE TABLE tblSecond
(myNumbers int);


--Inserting values into table using query

INSERT INTO tblSecond
VALUES(234);

SELECT * FROM tblSecond;

INSERT INTO [dbo].[tblSecond]
VALUES(678), (456), (156), (478);

-------------------------------------------------------------------
/*Udemy Practice Query

INSERT INTO SportTeams (TeamName)
VALUES ('Wolf FC');


SELECT * FROM SportTeams */

------------------------------------------------------------------
--SELECT from tables

SELECT myNumbers
FROM tblSecond;

SELECT * --getting all columns
FROM [dbo].[tblFirst];

SELECT  myNumbers --getting specific columns
FROM tblSecond;

SELECT  myColumn
FROM tblFirst;


------------------------------------------------------------------
--DELETE from tables
DELETE 
FROM tblFirst; --Deletes contents not entire table

TRUNCATE TABLE --Deletes contents not entire table
tblSecond; 

--DELETING ENTIRE TABLE
DROP TABLE tblfirst;


