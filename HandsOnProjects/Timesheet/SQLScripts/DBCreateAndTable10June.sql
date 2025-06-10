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

CREATE TABLE Employee(
EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
FullName VARCHAR(100) ,
CreatedAt DATETIME);

ALTER TABLE dbo.Employee
ADD CONSTRAINT DF_Employee_CreatedAt DEFAULT GETDATE() FOR CreatedAt;


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
    ClientName VARCHAR(255) NOT NULL UNIQUE,
	CreatedAt DATETIME
);
GO
ALTER TABLE dbo.Client
ADD CONSTRAINT DF_Client_CreatedAt DEFAULT GETDATE() FOR CreatedAt;



--PROJECT TABLE:
-- Drop Project table if it exists
IF OBJECT_ID('dbo.Project', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.Project;
END
GO


--DESCRIPTION TABLE:
-- Drop the table if it exists
IF OBJECT_ID('dbo.Description', 'U') IS NOT NULL
    DROP TABLE dbo.Description;

-- Create the table
CREATE TABLE dbo.Description (
    DescriptionID INT IDENTITY(1,1) PRIMARY KEY,
    Description VARCHAR(100),
	CreatedAt DATETIME
);
ALTER TABLE dbo.Description
ADD CONSTRAINT DF_Description_CreatedAt DEFAULT GETDATE() FOR CreatedAt;



  --TIMESHEET TABLE: 
  --Drop existing table if it exists
IF OBJECT_ID('dbo.Timesheet', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.Timesheet;
END
GO

CREATE TABLE dbo.Timesheet (
  TimesheetID             INT IDENTITY(1,1) PRIMARY KEY,
  EmployeeID          INT            NOT NULL,
  Date                DATE           NOT NULL,
  DayOfWeek           VARCHAR(255)    NULL,  -- e.g. “Monday”
  ClientID            INT            NOT NULL,
  ProjectName         VARCHAR(255)        NULL,
  DescriptionID       INT			 NOT NULL,
  Billable            VARCHAR(255)    NULL,  -- e.g. “Yes”/“No”
  Comments            VARCHAR(255)   NULL,
  TotalHours          DECIMAL(5,2)   NULL,
  StartTime           TIME           NULL,
  EndTime             TIME           NULL,
  CreatedAt           DATETIME       DEFAULT GETDATE(),
  FOREIGN KEY (EmployeeID) REFERENCES dbo.Employee(EmployeeID),
  FOREIGN KEY (ClientID)   REFERENCES dbo.Client(ClientID),
  FOREIGN KEY (DescriptionID)  REFERENCES dbo.Description(DescriptionID)
);




--LEAVE TABLE:
-- Drop Leave table if it exists
IF OBJECT_ID('dbo.Leave', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.Leave;
END
GO

CREATE TABLE dbo.Leave (
    LeaveID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeID INT NOT NULL, -- FK to Employee table
    TypeOfLeave VARCHAR(255) ,
    StartDate DATE ,
    EndDate DATE ,
    NumberOfDays DECIMAL(4,1) ,
    ApprovalObtained VARCHAR(255), 
    SickNoteProvided VARCHAR(255),
    ContactInformation VARCHAR(1000),
    SubmissionDate DATE,
	CreatedAt DATE NOT NULL DEFAULT GETDATE(),
    FOREIGN KEY (EmployeeID) REFERENCES dbo.Employee(EmployeeID)
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
    EmployeeID INT NOT NULL,
    Month DATE  NULL,
	ExpenseDescription VARCHAR(255)  NULL,
	Type VARCHAR(255)  NULL,
	ZarCost DECIMAL(5,2),
	CreatedAt DATE,
    FOREIGN KEY (EmployeeID) REFERENCES dbo.Employee(EmployeeID)
);
GO
ALTER TABLE dbo.Expense
ADD CONSTRAINT DF_Expense_CreatedAt DEFAULT GETDATE() FOR CreatedAt;


