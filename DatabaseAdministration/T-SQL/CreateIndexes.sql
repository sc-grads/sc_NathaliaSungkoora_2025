/*INDEXES */

--CLUSTERED INDEX

-- CREATE CLUSTERED INDEX 
CREATE CLUSTERED INDEX idx_tblEmployee 
ON [dbo].[tblEmployee]([EmployeeNumber]);--Sort by  EmployeeNumber

-- DROP THE INDEX
DROP INDEX idx_tblEmployee 
ON [dbo].[tblEmployee];

-- SELECT SPECIFIC ROW (SEEK IF INDEX EXISTS)
SELECT * 
FROM [dbo].[tblEmployee2] 
WHERE [EmployeeNumber] = 127;

-- SELECT ALL ROWS (SCAN)
SELECT * 
FROM [dbo].[tblEmployee2];

-- CREATE NEW TABLE EXCLUDING EmployeeNumber 131
SELECT * 
INTO [dbo].[tblEmployee2] --HEAP
FROM [dbo].[tblEmployee]
WHERE EmployeeNumber <> 131;

-- ADD PRIMARY KEY (CREATES CLUSTERED INDEX)
ALTER TABLE [dbo].[tblEmployee2]
ADD CONSTRAINT pk_tblEmployee2 
PRIMARY KEY (EmployeeNumber);

-- CREATE TABLE WITH PRIMARY KEY
CREATE TABLE myTable (
    Field1 INT PRIMARY KEY
);

----------------------------------------------------------------------------------------------------------------------
--NON CLUSTERED INDEX
-- CREATE NONCLUSTERED INDEX ON DateOfBirth
CREATE NONCLUSTERED INDEX idx_tblEmployee_DateOfBirth 
ON [dbo].[tblEmployee]([DateOfBirth]);

-- CREATE NONCLUSTERED INDEX ON DateOfBirth AND Department
CREATE NONCLUSTERED INDEX idx_tblEmployee_DateOfBirth_Department 
ON [dbo].[tblEmployee]([DateOfBirth], Department);

-- DROP CLUSTERED INDEX
DROP INDEX idx_tblEmployee 
ON [dbo].[tblEmployee];

-- SEEK: FILTER BY KEY
SELECT * 
FROM [dbo].[tblEmployee2] 
WHERE [EmployeeNumber] = 127;

-- SCAN: GET ALL ROWS
SELECT * 
FROM [dbo].[tblEmployee2];

-- FILTER BY DateOfBirth RANGE
SELECT DateOfBirth, Department 
FROM [dbo].[tblEmployee]
WHERE DateOfBirth >= '1992-01-01' AND DateOfBirth < '1993-01-01';

-- ADD UNIQUE CONSTRAINT TO Department
ALTER TABLE [dbo].[tblDepartment]
ADD CONSTRAINT unq_tblDepartment UNIQUE(Department);


----------------------------------------------------------------------------------------------------------------------
--FILTERED INDICES

--Example of FILTERED INDEX where the DEPARTMENT is = HR
CREATE NONCLUSTERED INDEX idx_LastNameForHR
ON dbo.tblEmployee(EmployeeLastName)  
WHERE Department = 'HR';
	--Now run query:
	SELECT [EmployeeLastName]
	FROM [dbo].[tblEmployee]
	WHERE Department = 'HR';

-- CREATE FILTERED INDEX ON EmployeeNumber < 139
CREATE NONCLUSTERED INDEX idx_tblEmployee_Employee  
ON dbo.tblEmployee(EmployeeNumber)  
WHERE EmployeeNumber < 139;

----------------------------------------------------------------------------------------------------------------------
--INCLUDE

-- CREATE INDEX AND INCLUDE:
CREATE NONCLUSTERED INDEX idx_EmployeeNumber
ON dbo.tblEmployee(EmployeeNumber)  
INCLUDE ([EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName]);

--Execute Example:
SELECT [EmployeeLastName]
	FROM [dbo].[tblEmployee]
	WHERE Department BETWEEN 140 AND 150;

-- CREATE INDEX AND INCLUDE EmployeeFirstName
CREATE NONCLUSTERED INDEX idx_tblEmployee_Employee  
ON dbo.tblEmployee(EmployeeNumber)  
INCLUDE (EmployeeFirstName);

-- DROP INDEX
DROP INDEX idx_tblEmployee_Employee 
ON dbo.tblEmployee;
