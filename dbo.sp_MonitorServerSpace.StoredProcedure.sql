USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[sp_MonitorServerSpace]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_MonitorServerSpace]
AS
-- ============================================= 
-- Author: Branton Harris 
-- Create date: 4/30/2017 
-- Description: Used to monitor free space on drives
-- ============================================= 
/*     
MODIFICATION HISTORY   
*/   
--create temp table
CREATE TABLE #FreeSpace (
 Drive CHAR (1), 
 MB_Free INT
)
--populate temp table
INSERT INTO #FreeSpace EXEC xp_fixeddrives
--populate ServerFreeSpace table from temp table
INSERT INTO ServerFreeSpace
SELECT 
 Drive, 
 MB_Free, 
 MB_Free/1024 AS GB_Free, 
 GETDATE()
FROM #FreeSpace
--drop temp table
DROP TABLE #FreeSpace
GO
