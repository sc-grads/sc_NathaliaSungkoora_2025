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