/*Udemy Course_ Microsoft SQL Server Database Administration Course
Practicing different Queries and Statements Creating A Step in a Job  */


--Create Job Step: Truncate Table
USE [msdb]
GO
DECLARE @jobId BINARY(16)
EXEC  msdb.dbo.sp_add_job @job_name=N'DBA-Truncate Table AdventureWorks', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_page=2, 
		@delete_level=0, 
		@description=N'This job is going to Truncate table ErrorLog Table every week day at 10:00 p.m SAST', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
select @jobId
GO
EXEC msdb.dbo.sp_add_jobserver @job_name=N'DBA-Truncate Table AdventureWorks', @server_name = N'LAPTOP-JUKB3QVS'
GO
USE [msdb]
GO
EXEC msdb.dbo.sp_add_jobstep @job_name=N'DBA-Truncate Table AdventureWorks', @step_name=N'Truncate Table', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_fail_action=2, 
		@retry_attempts=1, 
		@retry_interval=30, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'Truncate Table ErrorLog', 
		@database_name=N'AdventureWorks2022', 
		@flags=0
GO
USE [msdb]
GO
EXEC msdb.dbo.sp_update_job @job_name=N'DBA-Truncate Table AdventureWorks', 
		@enabled=1, 
		@start_step_id=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_page=2, 
		@delete_level=0, 
		@description=N'This job is going to Truncate table ErrorLog Table every week day at 10:00 p.m SAST', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'sa', 
		@notify_email_operator_name=N'', 
		@notify_page_operator_name=N''
GO
USE [msdb]
GO
DECLARE @schedule_id int
EXEC msdb.dbo.sp_add_jobschedule @job_name=N'DBA-Truncate Table AdventureWorks', @name=N'Daily @ 10:00 p.m SAST', 
		@enabled=1, 
		@freq_type=8, 
		@freq_interval=62, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=1, 
		@active_start_date=20250318, 
		@active_end_date=20250418, 
		@active_start_time=220000, 
		@active_end_time=235959, @schedule_id = @schedule_id OUTPUT
select @schedule_id
GO
