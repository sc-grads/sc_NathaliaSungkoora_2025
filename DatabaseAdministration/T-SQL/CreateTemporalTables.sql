/* TEMPORAL TABLES */

--CREATE TEMPORAL TABLE

-- Create a temporal table with system-versioned history tracking
CREATE TABLE [dbo].[tblEmployeeTemporal](
	[EmployeeNumber] INT NOT NULL PRIMARY KEY CLUSTERED,          -- Primary key
	[EmployeeFirstName] VARCHAR(50) NOT NULL,
	[EmployeeMiddleName] VARCHAR(50) NULL,
	[EmployeeLastName] VARCHAR(50) NOT NULL,
	[EmployeeGovernmentID] CHAR(10) NOT NULL,
	[DateOfBirth] DATE NOT NULL,
	[Department] VARCHAR(19) NULL,
	ValidFrom DATETIME2(2) GENERATED ALWAYS AS ROW START,         -- Start of row version (hidden)
	ValidTo DATETIME2(2) GENERATED ALWAYS AS ROW END,             -- End of row version (hidden)
	PERIOD FOR SYSTEM_TIME (ValidFrom, ValidTo)                   -- Defines the system time period
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.tblEmployeeHistory))  -- Enables system versioning with a history table
GO

-- Insert sample employee data
INSERT INTO [dbo].[tblEmployeeTemporal]
([EmployeeNumber], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName],
 [EmployeeGovernmentID], [DateOfBirth], [Department])
VALUES 
(123, 'Jane', NULL, 'Zwilling', 'AB123456G', '1985-01-01', 'Customer Relations'),
(124, 'Carolyn', 'Andrea', 'Zimmerman', 'AB234578H', '1975-06-01', 'Commercial'),
(125, 'Jane', NULL, 'Zabokritski', 'LUT778728T', '1977-12-09', 'Commercial'),
(126, 'Ken', 'J', 'Yukish', 'PO201903O', '1969-12-27', 'HR'),
(127, 'Terri', 'Lee', 'Yu', 'ZH206496W', '1986-11-14', 'Customer Relations'),
(128, 'Roberto', NULL, 'Young', 'EH793082D', '1967-04-05', 'Customer Relations')

-- Check current data in the temporal table
SELECT * FROM dbo.tblEmployeeTemporal

-- Make updates to track changes (history will be recorded)
UPDATE [dbo].[tblEmployeeTemporal] SET EmployeeLastName = 'Smith' WHERE EmployeeNumber = 124
UPDATE [dbo].[tblEmployeeTemporal] SET EmployeeLastName = 'Albert' WHERE EmployeeNumber = 124

-- See latest data after updates
SELECT * FROM dbo.tblEmployeeTemporal


-- Turn off system versioning before dropping the table
ALTER TABLE [dbo].[tblEmployeeTemporal] SET (SYSTEM_VERSIONING = OFF)

-- Drop the main and history tables
DROP TABLE [dbo].[tblEmployeeTemporal]
DROP TABLE [dbo].[tblEmployeeHistory]

---------------------------------------------------------------------------------------------------------------------------------------------------------------
--ALTER EXISTING TABLE

-- Add temporal columns to existing table
ALTER TABLE [dbo].[tblEmployee]
ADD
    ValidFrom DATETIME2(2) GENERATED ALWAYS AS ROW START          -- Start time of the row
        CONSTRAINT def_ValidFrom DEFAULT SYSUTCDATETIME(),       -- Default to current UTC time
    ValidTo DATETIME2(2) GENERATED ALWAYS AS ROW END             -- End time of the row
        CONSTRAINT def_ValidTo DEFAULT 
            CONVERT(DATETIME2(2), '9999-12-31 23:59:59');         -- Default far future end time

-- Enable system versioning to track changes
ALTER TABLE dbo.tblEmployee
SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.tblEmployeeHistory2)); -- Create and use history table

---------------------------------------------------------------------------------------------------------------------------------------------------------------
--QUERYING TEMPORAL DATA AT A POINT IN TIME

SELECT * FROM dbo.tblEmployeeTemporal
FOR SYSTEM_TIME AS OF '2021-02-01'


---------------------------------------------------------------------------------------------------------------------------------------------------------------
--QUERYING TEMPORAL DATA BETWEEN TIME PERIODS

SELECT * FROM dbo.tblEmployeeTemporal
FOR SYSTEM_TIME
--FROM startdatetime TO enddatetime
--BETWEEN startdatetime AND enddatetime
--CONTAINED IN (startdatetime, enddatetime)
