USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getGlobalQueueSummaryCount]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getGlobalQueueSummaryCount]
AS
SELECT 	
	COUNT(UserID) As ResultCount 
FROM get_global_queue_summary
GO
