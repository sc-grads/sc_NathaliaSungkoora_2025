USE msdb;
GO

DECLARE @jobName NVARCHAR(100) = N'AutomatedTimesheetProject_NS_Job';
DECLARE @jobId UNIQUEIDENTIFIER;
DECLARE @shouldReplace BIT = 1; -- Change to 0 if you don't want auto-replacement
DECLARE @startDate INT = CONVERT(INT, CONVERT(VARCHAR, GETDATE(), 112));  -- Fix here

-- Check if the job exists
SELECT @jobId = job_id FROM msdb.dbo.sysjobs WHERE name = @jobName;

-- Drop job if exists and replacement is enabled
IF @jobId IS NOT NULL AND @shouldReplace = 1
BEGIN
    EXEC msdb.dbo.sp_delete_job @job_name = @jobName;
    SET @jobId = NULL;
END

-- Only create if it doesn't exist
IF @jobId IS NULL
BEGIN
    -- Create job
    EXEC msdb.dbo.sp_add_job 
        @job_name = @jobName,
        @enabled = 1,
        @description = N'Runs the Import Timesheet Data SSIS package.',
        @owner_login_name = N'LAPTOP-JUKB3QVS\NathaliaSungkoora',
        @job_id = @jobId OUTPUT;

    -- Add job step
    EXEC msdb.dbo.sp_add_jobstep 
        @job_id = @jobId,
        @step_name = N'ImportTimesheetData',
        @subsystem = N'SSIS',
        @command = N'/ISSERVER "\"\SSISDB\AutomatedTimesheetProject\SSIS_Automated_Timesheet_Project\ImportTimesheetDataFinal.dtsx\"" /SERVER "\"LAPTOP-JUKB3QVS\"" /Par "\"$ServerOption::LOGGING_LEVEL(Int16)\"";1 /Par "\"$ServerOption::SYNCHRONIZED(Boolean)\"";True /CALLERINFO SQLAGENT /REPORTING E',
        @database_name = N'master',
        @on_success_action = 1,
        @on_fail_action = 2,
		@proxy_name=N'SSIS_RunAs_WindowsUser';

    -- Add schedule
    EXEC msdb.dbo.sp_add_schedule 
        @schedule_name = N'Run every minute',
        @enabled = 1,
        @freq_type = 4,  -- Daily
        @freq_interval = 1,
        @freq_subday_type = 4,  -- Minutes
        @freq_subday_interval = 1,
        @active_start_date = @startDate,     -- use the variable here
        @active_start_time = 0;

    -- Attach schedule
    EXEC msdb.dbo.sp_attach_schedule 
        @job_name = @jobName,
        @schedule_name = N'Run every minute';

    -- Register the job to run on local server
    EXEC msdb.dbo.sp_add_jobserver 
        @job_name = @jobName,
        @server_name = N'(local)';
END
GO