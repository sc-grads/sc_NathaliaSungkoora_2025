USE [OurFirstDatabase]
GO
-- Inserting Values into table created
INSERT INTO [dbo].[personalInfo]
           ([firstName]
           ,[lastName]
           ,[dob]
           ,[ID])
     VALUES
           ('Nathalia',
		   'Sungkoora',
           '2000-03-15',
           777)
GO		--Seperate Statements using GO

SELECT *
FROM [dbo].[personalInfo]
GO
