/*Udemy Course_ Microsoft SQL Server Database Administration Course
	Practicing different Queries and Statements on User Logins and Roles*/

	--Creating user logins and roles

USE [master]
GO
CREATE LOGIN [LAPTOP-JUKB3QVS\winuser01] FROM WINDOWS WITH DEFAULT_DATABASE=[master]
GO

-- SELECT User Permissions
-- Retrieves permission details for specific principals (users) in the system.


SELECT pr.PRINCIPAL_ID, pr.NAME, pe.STATE_DESC, pe.PERMISSION_NAME
FROM SYS.SERVER_PRINCIPALS pr
INNER JOIN [sys].[server_permissions] pe
   ON pr.PRINCIPAL_ID = pe.GRANTEE_PRINCIPAL_ID
WHERE pr.NAME = 'SQLUSER01'  -- Use login name directly for SQL Server login
   OR pr.NAME = 'LAPTOP-JUKB3QVS\winuser01';  -- Use login name directly for Windows user
GO


-- GRANT IMPERSONATE Permission
-- Grants the IMPERSONATE ANY LOGIN permission to specific users.
GRANT IMPERSONATE ANY LOGIN TO [LAPTOP-JUKB3QVS\winuser01], SQLUSER01;
GO

-- CREATE SERVER ROLE and Grant Permissions
-- Creates a new server role named 'devops', grants it ALTER ANY DATABASE permission, 
-- and adds a user to that role.
CREATE SERVER ROLE DEVOPS;
GRANT ALTER ANY DATABASE TO DEVOPS;
ALTER SERVER ROLE DEVOPS ADD MEMBER [LAPTOP-JUKB3QVS\winuser01];
GO

-- SELECT Permissions of the 'devops' Role
-- Retrieves permission details for the 'devops' role.
SELECT pe.STATE_DESC, pe.PERMISSION_NAME
  FROM SYS.SERVER_PRINCIPALS pr 
  INNER JOIN [sys].[server_permissions] pe  
    ON pr.PRINCIPAL_ID = pe.GRANTEE_PRINCIPAL_ID
  WHERE pr.PRINCIPAL_ID = SUSER_ID('DEVOPS');
GO

--Altering Server Roles (Server Role->Properties->Members->Type sqluser01 and check name then ADD)
ALTER SERVER ROLE [DEVOPS] ADD MEMBER [sqluser01]

GO

-- SELECT Role Members
-- Retrieves the members of the 'devops' role.
SELECT rm.MEMBER_PRINCIPAL_ID, pr.NAME
  FROM SYS.SERVER_ROLE_MEMBERS rm 
  INNER JOIN SYS.SERVER_PRINCIPALS pr  
    ON rm.MEMBER_PRINCIPAL_ID = pr.PRINCIPAL_ID
  WHERE rm.ROLE_PRINCIPAL_ID = SUSER_ID('DEVOPS');
GO

