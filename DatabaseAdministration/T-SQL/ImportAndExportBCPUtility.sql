/*BCP UTILITY */

--IMPORTING AND EXPORTING USING THE BCP UTILITY
--Use COMMAND PROMPT FOR EXPORT
-- Export data from the original table to a file (native format, trusted connection)
BCP [70-461(2)].dbo.tblDepartment OUT mydata.out -N -T

-- Create a new table with same structure to receive imported data
CREATE TABLE dbo.tblDepartment2 (
    [Department] VARCHAR(19) NULL,
    [DepartmentHead] VARCHAR(19) NULL
)

SELECT * FROM dbo.tblDepartment2 

-- Import data from the file into the new table (native format, trusted connection)
BCP [70-461(2)].dbo.tblDepartment2 IN mydata.out -N -T
