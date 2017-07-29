USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getGlobalQueueSummaryCount]    Script Date: 7/28/2017 10:17:13 PM ******/
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
