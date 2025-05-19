/*PracticeActivityNumber2*/


USE [70-461]
GO


--Create table
CREATE TABLE 
tblPrimeNumbers (intField INT);

--Inserting values into table
INSERT INTO tblPrimeNumbers (intField)
VALUES (2), (3), (5), (7), (11);

SELECT * FROM tblPrimeNumbers; 

--DELETE contents from table 
DELETE FROM tblPrimeNumbers;

--Dropping table to DELETE entire table
DROP TABLE tblPrimeNumbers;

