/*CREATE AND ALTER DML TRIGGERS*/

---CREATE AN AFTER TRIGGER using INSERT SNIPPET (SYNTAX)
CREATE TRIGGER tr_tblDepartment
    ON [dbo].[tblDepartment]
    AFTER DELETE, INSERT, UPDATE --Can have FOR/AFTER
    AS
    BEGIN
    SET NOCOUNT ON --Sets message ON/OFF
    END


-- Create AFTER TRIGGER on tblTransaction for DELETE, INSERT, UPDATE  
CREATE TRIGGER TR_tblTransaction  
ON tblTransaction  
AFTER DELETE, INSERT, UPDATE  --Any DML EVENT
AS  
BEGIN   
    SELECT *, 'Inserted' FROM Inserted  
    SELECT *, 'Deleted' FROM Deleted  
END  
GO  

-- Test trigger by inserting a row inside a TRANSACTION  
BEGIN TRAN  
INSERT INTO tblTransaction(Amount, DateOfTransaction, EmployeeNumber)  
VALUES (123, '2015-07-10', 123)  

-----------------------------------------------------------------------------------------------------------------------------------------------------------------
--CREATE AN INSTEAD OF TRIGGER (SYNTAX)

CREATE TRIGGER NameOfTrigger ON NameOfTable
INSTEAD OF DELETE, INSERT --Have to write seperately
AS
BEGIN
SET NOCOUNT ON
END


--------------------
--INSTEAD OF TRIGGER EXAMPLE:
CREATE TRIGGER tr_ViewByDepartment  
ON dbo.ViewByDepartment  
INSTEAD OF DELETE  
AS  
BEGIN  
	SELECT *, 'ViewByDepartment' FROM deleted
END;

SELECT * FROM ViewByDepartment WHERE TotalAmount = -2.77 AND EmployeeNumber = 132  


-- Create INSTEAD OF DELETE trigger on the View  
ALTER TRIGGER tr_ViewByDepartment  --After CREATE was executed-> change to ALTER
ON dbo.ViewByDepartment  
INSTEAD OF DELETE  
AS  
BEGIN  
    -- Declare variables to hold deleted row values  
    DECLARE @EmployeeNumber AS INT  
    DECLARE @DateOfTransaction AS SMALLDATETIME  
    DECLARE @Amount AS SMALLMONEY  

    -- Get values from the deleted row  (Another way of setting variables)
    SELECT  
        @EmployeeNumber = EmployeeNumber,  
        @DateOfTransaction = DateOfTransaction,  
        @Amount = TotalAmount  
    FROM deleted  

    -- Delete the matching row from the base table  
    DELETE tblTransaction  
    FROM tblTransaction AS T  
    WHERE T.EmployeeNumber = @EmployeeNumber  
      AND T.DateOfTransaction = @DateOfTransaction  
      AND T.Amount = @Amount  
END  
GO  

-- Test the trigger with a DELETE from the view  
BEGIN TRAN  

-- DELETE from the View (will actually delete from tblTransaction using the trigger)  
DELETE FROM ViewByDepartment  
WHERE TotalAmount = -2.77 AND EmployeeNumber = 132  

-- Check if the row is still visible  
--SELECT * FROM ViewByDepartment  
--WHERE TotalAmount = -2.77 AND EmployeeNumber = 132 
  
ROLLBACK TRAN  --undo changes  


-----------------------------------------------------------------------------------------------------------------------------------------------------------------
--NESTED TRIGGERS


-- ALTERING TR_tblTransaction
ALTER TRIGGER TR_tblTransaction  
ON tblTransaction  
AFTER DELETE, INSERT, UPDATE  
AS  
BEGIN   
		SELECT @@NESTLEVEL AS Nest_Level
        SELECT *FROM Inserted  
        SELECT * FROM Deleted  
 
END  
GO  

-- Test INSERT  
BEGIN TRAN  
INSERT INTO tblTransaction(Amount, DateOfTransaction, EmployeeNumber)  
VALUES (123, '2015-07-10', 123)  
ROLLBACK TRAN  

--Another test:
BEGIN TRAN
INSERT INTO tblTransaction (Amount, DateOfTransaction, EmployeeNumber)
VALUES (100.00, '2015-05-20', 123)
ROLLBACK TRAN



-- MODIFIED AFTER trigger on tblTransaction  
ALTER TRIGGER TR_tblTransaction  
ON tblTransaction  
AFTER DELETE, INSERT, UPDATE  
AS  
BEGIN  
    IF @@NESTLEVEL = 1  
    BEGIN  
        SELECT *, 'TABLEINSERT' FROM Inserted  
        SELECT *, 'TABLEDELETE' FROM Deleted  
    END  
END  
GO  


-- Test DELETE via view  
BEGIN TRAN  
SELECT * FROM ViewByDepartment WHERE TotalAmount = -2.77 AND EmployeeNumber = 132  
DELETE FROM ViewByDepartment  
WHERE TotalAmount = -2.77 AND EmployeeNumber = 132  
ROLLBACK TRAN  --Output: NestLevel=2

-- Check and disable nested triggers  (if necessary)
EXEC sp_configure 'nested triggers';  
EXEC sp_configure 'nested triggers', 0;  
RECONFIGURE  
GO  

-----------------------------------------------------------------------------------------------------------------------------------------------------------------
--UPDATE FUNCTIONS


ALTER TRIGGER TR_tblTransaction  
ON tblTransaction  
AFTER DELETE, INSERT, UPDATE  
AS  
BEGIN  
    BEGIN  
        SELECT *, 'Inserted-tblTransaction' FROM Inserted
        SELECT *, 'Deleted-tblTransaction' FROM Deleted 
    END  
END  
GO  

--Using INSERT to test

INSERT INTO tblTransaction(Amount, DateOfTransaction, EmployeeNumber)
VALUES (123,'2015-07-11', 123) --Output shows: Inserted-tblTransaction

SELECT * FROM ViewByDepartment WHERE TotalAmount = -2.77 and EmployeeNumber = 123


--DELETE ROW :
BEGIN TRAN  
DELETE FROM ViewByDepartment
WHERE TotalAmount = -2.77 and EmployeeNumber = 123
ROLLBACK TRAN --Output shows:Deleted-tblTransaction

--Check again to see if it's there: (not there-deleted)

SELECT * FROM ViewByDepartment WHERE TotalAmount = -2.77 and EmployeeNumber = 123


--------------------------

--ADD ROWCOUNT AS A GLOBAL VARIABLE to see what rows are affected

ALTER TRIGGER TR_tblTransaction  
ON tblTransaction  
AFTER DELETE, INSERT, UPDATE  
AS  
BEGIN
	--IF @@ROWCOUNT > 0 --If rowcount is greater than 0 then do these SELECT statements otherwise don't do anything
	BEGIN
        SELECT *, 'Inserted-tblTransaction' FROM Inserted
        SELECT *, 'Deleted-tblTransaction' FROM Deleted 
    END  
END  
GO  

BEGIN TRAN
--SELECT * FROM ViewByDepartment where TotalAmount = -2.77 and EmployeeNumber = 123
UPDATE ViewByDepartment
SET TotalAmount = +2.77
WHERE TotalAmount = -2.77 and EmployeeNumber = 123
ROLLBACK TRAN

--------------------------------------------------------------
--MODIFY TRIGGER TO INCLUDE UPDATE FUNCTION
-- Cheching to see if has been updated

-- AFTER trigger for updates to Amount column only
ALTER TRIGGER TR_tblTransaction
ON tblTransaction
AFTER DELETE, INSERT, UPDATE
AS
BEGIN
	IF UPDATE(Amount)
	BEGIN
		SELECT * FROM Inserted
		SELECT * FROM Deleted
	END
END
GO

--Inserting a different value to test:
INSERT INTO tblTransaction(Amount, DateOfTransaction, EmployeeNumber)
VALUES (123, '2015-07-12', 123)

UPDATE ViewByDepartment
SET TotalAmount = +2.77
WHERE TotalAmount = -2.77 and EmployeeNumber = 123



-----------------------------------------------------------------------------------------------------------------------------------------------------------------
--HANDLING MULTIPLE ROWS IN A SESSION

--Telling me what I am deleting and assign variables from delete table
--Then going to delete Table Transaction where those variables are in the Table transaction
ALTER TRIGGER tr_ViewByDepartment
ON dbo.ViewByDepartment
INSTEAD OF DELETE
AS
BEGIN
	SELECT *, 'To Be Deleted' FROM deleted 
    DECLARE @EmployeeNumber INT,
            @DateOfTransaction SMALLDATETIME,
            @Amount SMALLMONEY

    SELECT @EmployeeNumber = EmployeeNumber, 
           @DateOfTransaction = DateOfTransaction,  
           @Amount = TotalAmount
    FROM deleted

    DELETE tblTransaction 
    FROM tblTransaction AS T
    WHERE T.EmployeeNumber = @EmployeeNumber
      AND T.DateOfTransaction = @DateOfTransaction
      AND T.Amount = @Amount
END
GO

BEGIN TRAN
-- Delete and check rows for EmployeeNumber = 132
SELECT *, 'Before Delete' FROM ViewByDepartment WHERE EmployeeNumber = 132 --Output in table shows "Before Delete"
DELETE FROM ViewByDepartment WHERE EmployeeNumber = 132
SELECT *, 'After Delete' FROM ViewByDepartment WHERE EmployeeNumber = 132--Output in table shows "After Delete"
ROLLBACK TRAN

SELECT * FROM ViewByDepartment WHERE EmployeeNumber = 132


--MODIFY TO INCLUDE JOIN:

ALTER TRIGGER tr_ViewByDepartment
ON dbo.ViewByDepartment
INSTEAD OF DELETE
AS
BEGIN
    SELECT *, 'To Be Deleted' FROM deleted

    DELETE T
    FROM tblTransaction AS T
    JOIN deleted AS D
      ON T.EmployeeNumber = D.EmployeeNumber
     AND T.DateOfTransaction = D.DateOfTransaction
     AND T.Amount = D.TotalAmount
END
GO




