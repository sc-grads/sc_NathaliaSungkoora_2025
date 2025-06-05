/* SQL STATEMENTS FOR AUTOMATED SSIS TIMESHEET PROJECT*/

-- Create the database
CREATE DATABASE TimesheetDB;
GO

Use TimesheetDB
Go

 --EMPLOYEE TABLE: 
 --Drop existing table if it exists
IF OBJECT_ID('dbo.Employee', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.Employee;
END
GO

CREATE TABLE Employee(FullName VARCHAR(100) PRIMARY KEY);

  --TIMESHEET TABLE: 
  --Drop existing table if it exists
IF OBJECT_ID('dbo.Timesheet', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.Timesheet;
END
GO

CREATE TABLE dbo.Timesheet (
    TimesheetID INT IDENTITY(1,1) PRIMARY KEY,
    FullName VARCHAR(100), -- FK to EMPLOYEE.FULLNAME
	Date DATE,
	DayOfWeek VARCHAR(255),
	Client VARCHAR(255),
	ClientProjectName VARCHAR(255),
	Description VARCHAR(255),
	Billable VARCHAR(255),
	Comments VARCHAR(255),
	TotalHours DECIMAL (5,2),
	StartTime TIME,
	EndTime TIME,

	CONSTRAINT FK_Timesheet_Employees
		FOREIGN KEY (FullName)
		REFERENCES dbo.Employee(FullName)
);



--CLIENT TABLE: 

-- Drop Client table if it exists
IF OBJECT_ID('dbo.Client', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.Client;
END
GO

-- Create Client table
CREATE TABLE dbo.Client (
    ClientID INT IDENTITY(1,1) PRIMARY KEY,
    ClientName VARCHAR(255) NOT NULL UNIQUE
);
GO

--PROJECT TABLE:
-- Drop Project table if it exists
IF OBJECT_ID('dbo.Project', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.Project;
END
GO

-- Create Project table
CREATE TABLE dbo.Project (
    ProjectID INT IDENTITY(1,1) PRIMARY KEY,
    ClientID INT NOT NULL,
    ProjectName VARCHAR(255) NOT NULL,
    FOREIGN KEY (ClientID) REFERENCES dbo.Client(ClientID)
);
GO

--LEAVE TABLE:
-- Drop Leave table if it exists
IF OBJECT_ID('dbo.Leave', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.Leave;
END
GO

-- Create Leave table
CREATE TABLE dbo.Leave (
    LeaveID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeID INT NOT NULL, -- FK to Employee table
    LeaveType VARCHAR(100) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    NumberOfDays DECIMAL(4,1) NOT NULL,
    ApprovalObtained BIT, -- 1 for Yes, 0 for No
    SickNoteProvided BIT, -- 1 for Yes, 0 for No
    ContactInfoDuringLeave VARCHAR(255),
    SubmissionDate DATE,
    EmployeeSignature VARCHAR(100), 
    ClientSignature VARCHAR(100), 
    --FOREIGN KEY (EmployeeID) REFERENCES dbo.Employee(EmployeeID)
);
GO

--EXPENSE TABLE
-- Drop Expense table if it exists
IF OBJECT_ID('dbo.Expense', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.Expense;
END
GO

-- Create Expense table
CREATE TABLE dbo.Expense (
    ExpenseID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeID INT NOT NULL, -- link to Employee table
    ExpenseMonth VARCHAR(20),
    ExpenseDescription VARCHAR(255),
    ExpenseType VARCHAR(100),
    Cost DECIMAL(10,2), -- don't use "R", use numbers only
    SubmissionDate DATE DEFAULT GETDATE(),
    --FOREIGN KEY (EmployeeID) REFERENCES dbo.Employee(EmployeeID)
);
GO




--------------------------------------------------------------------------------------

--INSERTING Employees into Employee Table:
INSERT INTO [dbo].[Employee](FullName)
VALUES
  ('Evashan Govender'),
  ('Iviwe Makinana'),
  ('Mehul Patel'),
  ('Nathalia Sungkoora'),
  ('Neo Motaung'),
  ('Siphenathi Ndevu');


  --SELECT Statements:
  SELECT TOP (1000) [FullName]
  FROM [TimesheetDB].[dbo].[Employee]



 