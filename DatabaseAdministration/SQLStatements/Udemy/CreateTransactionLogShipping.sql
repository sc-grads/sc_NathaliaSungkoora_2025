/*Udemy Course_ Microsoft SQL Server Database Administration Course
Practicing different Queries and Statements Script Tansaction Log Shipping*/



-- Execute the following statements at the Primary to configure Log Shipping 
-- for the database [LAPTOP-JUKB3QVS].[AdventureWorks2022],
-- The script needs to be run at the Primary in the context of the [msdb] database.  
------------------------------------------------------------------------------------- 
-- Adding the Log Shipping configuration 

-- ****** Begin: Script to be run at Primary: [LAPTOP-JUKB3QVS] ******


DECLARE @LS_BackupJobId	AS uniqueidentifier 
DECLARE @LS_PrimaryId	AS uniqueidentifier 
DECLARE @SP_Add_RetCode	As int 


EXEC @SP_Add_RetCode = master.dbo.sp_add_log_shipping_primary_database 
		@database = N'AdventureWorks2022' 
		,@backup_directory = N'\\LAPTOP-JUKB3QVS\Users\NathaliaSungkoora\OneDrive - Northern Data (Pty) Ltd\Desktop\Transaction Log Shipping' 
		,@backup_share = N'\\LAPTOP-JUKB3QVS\Users\NathaliaSungkoora\OneDrive - Northern Data (Pty) Ltd\Desktop\Transaction Log Shipping' 
		,@backup_job_name = N'LSBackup_AdventureWorks2022' 
		,@backup_retention_period = 4320
		,@backup_compression = 2
		,@monitor_server = N'LAPTOP-JUKB3QVS\NAMEDINSTANCE1' 
		,@monitor_server_security_mode = 1 
		,@backup_threshold = 15 
		,@threshold_alert_enabled = 1
		,@history_retention_period = 5760 
		,@backup_job_id = @LS_BackupJobId OUTPUT 
		,@primary_id = @LS_PrimaryId OUTPUT 
		,@overwrite = 1 


IF (@@ERROR = 0 AND @SP_Add_RetCode = 0) 
BEGIN 

DECLARE @LS_BackUpScheduleUID	As uniqueidentifier 
DECLARE @LS_BackUpScheduleID	AS int 


EXEC msdb.dbo.sp_add_schedule 
		@schedule_name =N'LSBackupSchedule_LAPTOP-JUKB3QVS1' 
		,@enabled = 1 
		,@freq_type = 4 
		,@freq_interval = 1 
		,@freq_subday_type = 4 
		,@freq_subday_interval = 15 
		,@freq_recurrence_factor = 0 
		,@active_start_date = 20250318 
		,@active_end_date = 99991231 
		,@active_start_time = 0 
		,@active_end_time = 235900 
		,@schedule_uid = @LS_BackUpScheduleUID OUTPUT 
		,@schedule_id = @LS_BackUpScheduleID OUTPUT 

EXEC msdb.dbo.sp_attach_schedule 
		@job_id = @LS_BackupJobId 
		,@schedule_id = @LS_BackUpScheduleID  

EXEC msdb.dbo.sp_update_job 
		@job_id = @LS_BackupJobId 
		,@enabled = 1 


END 


-- ****** End: Script to be run at Primary: [LAPTOP-JUKB3QVS]  ******


