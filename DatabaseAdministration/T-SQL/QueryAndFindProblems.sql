/* LOOKING AT PROBLEMS */

--Looking at problems in the current database:

SELECT * FROM tblEmployee 

-- Show employee details for number 2001  
SELECT * FROM tblEmployee WHERE EmployeeNumber = 2001  

--LEFT JOINS TRANSACRION TABLE TO EMPLOYEE TABLE:
-- Show EMPLOYEE numbers from TRANSACTIONS and EMPLOYEES, and total AMOUNT  
SELECT T.EmployeeNumber AS TEmployeeNumber,  
       E.EmployeeNumber AS EEmployeeNumber,  
       SUM(Amount) AS SumAmount  
FROM tblTransaction AS T  
LEFT JOIN tblEmployee AS E  
ON T.EmployeeNumber = E.EmployeeNumber  
GROUP BY T.EmployeeNumber, E.EmployeeNumber  
ORDER BY EEmployeeNumber  
-------------------------------------------------------
--UPDATING DATE OF BIRTH to 2101-01-01 for employee 537  
BEGIN TRAN  

UPDATE tblEmployee  
SET DateOfBirth = '2101-01-01'  
WHERE EmployeeNumber = 537  
-- Show all employees ordered by DateOfBirth (latest first)  
SELECT * FROM tblEmployee ORDER BY DateOfBirth DESC  

ROLLBACK TRAN  
-------------------------------------------------------------------------
-- Update government IDs  of 10 employees to same Government ID
BEGIN TRAN  

-- Set EmployeeGovernmentID to 'aaaa' for employees 530 to 539  
UPDATE tblEmployee  
SET EmployeeGovernmentID = 'aaaa'  
WHERE EmployeeNumber BETWEEN 530 AND 539  

SELECT * FROM tblEmployee ORDER BY EmployeeGovernmentID ASC  

ROLLBACK TRAN  
-------------------------------------------------------------------------
-- Duplicate EMPLOYEES without the EmployeeNumber (set as NULL)  
INSERT INTO tblEmployee  
SELECT NULL, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName, EmployeeGovernmentID, DateOfBirth, Department  
FROM tblEmployee  --Output: RECEIVE ERROR MESSAGE
