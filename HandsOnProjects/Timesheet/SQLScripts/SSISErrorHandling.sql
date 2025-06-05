--SSIS Error Handling Scripts

SELECT TOP (1000) [id]
      ,[work_date]
      ,[day_of_week]
      ,[client]
      ,[client_project_name]
      ,[description]
      ,[billable_or_non_billable]
      ,[comments]
      ,[total_hours]
      ,[start_time]
      ,[end_time]
  FROM [N.I.N.E.S].[dbo].[timesheet]

  DELETE FROM [N.I.N.E.S].[dbo].[timesheet]
  -- Drop existing table if it exists
IF OBJECT_ID('dbo.timesheet', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.timesheet;
END
GO

-- Create new table with auto-incrementing id
CREATE TABLE dbo.timesheet (
    id INT IDENTITY(1,1) PRIMARY KEY,  -- auto-incrementing id
    work_date DATE,
    day_of_week VARCHAR(20),
    client VARCHAR(100),
    client_project_name VARCHAR(100),
    description VARCHAR(MAX),
    billable_or_non_billable VARCHAR(20),
    comments VARCHAR(MAX),
    total_hours DECIMAL(5,2),
    start_time TIME,
    end_time TIME
);
GO


ALTER TABLE dbo.timesheet
ALTER COLUMN day_of_week VARCHAR(255);

ALTER TABLE dbo.timesheet
ALTER COLUMN client VARCHAR(255);

ALTER TABLE dbo.timesheet
ALTER COLUMN client_project_name VARCHAR(255);

ALTER TABLE dbo.timesheet
ALTER COLUMN billable_or_non_billable VARCHAR(255);


--ATTEMPT 2:
IF OBJECT_ID('dbo.timesheet', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.timesheet;
END
GO

CREATE TABLE dbo.timesheet (
    id INT IDENTITY(1,1) PRIMARY KEY,  -- auto-incrementing id
    work_date DATE,
    day_of_week VARCHAR(255),
    client VARCHAR(255),
    client_project_name VARCHAR(255),
    description VARCHAR(MAX),
    billable_or_non_billable VARCHAR(255),
    comments VARCHAR(MAX),
    total_hours DECIMAL(5,2),
    start_time TIME,
    end_time TIME
);
GO


--Modify table: ALTER TABLE dbo.timesheet
-- Increase length of VARCHAR columns
ALTER COLUMN day_of_week VARCHAR(500) NULL;

ALTER TABLE dbo.timesheet
ALTER COLUMN client VARCHAR(500) NULL;

ALTER TABLE dbo.timesheet
ALTER COLUMN client_project_name VARCHAR(500) NULL;

ALTER TABLE dbo.timesheet
ALTER COLUMN billable_or_non_billable VARCHAR(500) NULL;

-- Allow comments and description to be NULL if they aren't already
ALTER TABLE dbo.timesheet
ALTER COLUMN comments VARCHAR(MAX) NULL;

ALTER TABLE dbo.timesheet
ALTER COLUMN description VARCHAR(MAX) NULL;

-- Change work_date to DATETIME2 for more flexible date/time handling
ALTER TABLE dbo.timesheet
ALTER COLUMN work_date DATETIME2 NULL;

-- Change start_time and end_time to DATETIME2 to handle possible variations
ALTER TABLE dbo.timesheet
ALTER COLUMN start_time DATETIME2 NULL;

ALTER TABLE dbo.timesheet
ALTER COLUMN end_time DATETIME2 NULL;

-- Increase precision of total_hours if needed
ALTER TABLE dbo.timesheet
ALTER COLUMN total_hours DECIMAL(7,2) NULL;



--ATTEMPTS 3:
IF OBJECT_ID('dbo.timesheet', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.timesheet;
END
GO

CREATE TABLE dbo.timesheet (
    id INT IDENTITY(1,1) PRIMARY KEY,  
    work_date DATETIME2 NULL,           
    day_of_week VARCHAR(500) NULL,      
    client VARCHAR(500) NULL,            
    client_project_name VARCHAR(500) NULL, 
    description VARCHAR(MAX) NULL,      
    billable_or_non_billable VARCHAR(500) NULL, 
    comments VARCHAR(MAX) NULL,          -- comments column added back
    total_hours DECIMAL(7,2) NULL,      
    start_time DATETIME2 NULL,           
    end_time DATETIME2 NULL              
);
GO
