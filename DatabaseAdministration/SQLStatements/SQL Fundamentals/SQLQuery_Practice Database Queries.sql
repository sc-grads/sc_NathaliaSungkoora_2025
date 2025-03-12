
--- Practice Database (CRUD: with comments)
USE PracticeDB;


-- Create Operations( Create, Insert)
CREATE TABLE Employees 
(EmployeeID INT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Age INT);


ALTER TABLE Employees
 ADD Department VARCHAR(50)


INSERT INTO Employees (EmployeeID, FirstName, LastName, Age, Department)
VALUES ('1','Mary', 'Smith', '30', 'Marketing')

INSERT INTO Employees (EmployeeID, FirstName, LastName, Age, Department)
VALUES ('2','John', 'Brown', '33', 'Sales'),
		('3', 'Mike', 'Johnson', '28', 'IT'),
		('4', 'Sarah', 'Williams', '35', 'HR');

-- Read Operations( Selecting rows from table)
		SELECT FirstName
		FROM Employees;

		SELECT FirstName, Age, Department
		FROM Employees;

		SELECT EmployeeID,FirstName, LastName, Age
		FROM Employees
		WHERE Age>30;

		-- Update Operation (Updating existing Table)

		UPDATE Employees
		SET Department= 'IT'
		WHERE EmployeeID=2;

		UPDATE Employees
		SET Age='30'
		WHERE FirstName='Mary';

		SELECT*
		FROM Employees;


		--Delete Operation (Deleting contents in existing table)

		DELETE 
		FROM Employees
		WHERE EmployeeID=4;
		
		SELECT*
		FROM Employees;

		-- Selecting from database
SELECT TOP (1000) [EmployeeID]
      ,[FirstName]
      ,[LastName]
      ,[Age]
      ,[Department]
  FROM [PracticeDB].[dbo].[Employees]


  Select * 
  From Employees