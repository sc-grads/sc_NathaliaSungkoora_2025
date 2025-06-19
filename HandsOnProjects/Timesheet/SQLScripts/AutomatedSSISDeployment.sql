/***** SSIS PROJECT DEPLOYMENT SCRIPT  *****/
DECLARE @ProjectBinary VARBINARY(MAX);

-- read the .ispac file as a single BLOB
SELECT @ProjectBinary = BulkColumn
FROM   OPENROWSET(
         BULK '$(IspacFullPath)',         
         SINGLE_BLOB
       ) AS ProjectFile;

--Create SSIS Folder 
EXEC SSISDB.catalog.create_folder 
     @folder_name = N'AutomatedTimesheetProject',
     @folder_id   = NULL;

EXEC SSISDB.catalog.deploy_project
     @folder_name   = N'AutomatedTimesheetProject',
     @project_name  = N'SSIS_Automated_Timesheet_Project',
     @project_stream= @ProjectBinary,
     @operation_id  = NULL;