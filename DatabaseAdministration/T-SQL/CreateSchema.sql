/*SCHEMA */


SELECT E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName,
       T.Amount, T.DateOfTransaction
FROM [dbo].[tblEmployee] AS E
LEFT JOIN [dbo].[tblTransaction] AS T
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeNumber BETWEEN 200 AND 202
FOR XML RAW, XMLSCHEMA --or xmldata -- Output raw XML format 