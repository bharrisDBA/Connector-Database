USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[sp_MonitorDatabaseSize]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_MonitorDatabaseSize]
AS
-- ============================================= 
-- Author: Branton Harris 
-- Create date: 04/30/2017 
-- Description: Used to monitor the size of the database 
-- ============================================= 
/*     
MODIFICATION HISTORY   

*/   
 

--Populate DatabaseMonitoring table
INSERT INTO dbo.DatabaseMonitoring
SELECT 
                Database_Name, 
                Backup_Size, 
                backup_size/1024/1024/1024 AS DBSize_GB, 
                Backup_Finish_Date
FROM msdb.dbo.backupset
WHERE Database_Name = '_Connector'
                AND CONVERT(DATE, backup_start_date) = CONVERT(DATE, GETDATE())
 
 
 
GO
