USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getElapsedFromTempQueue]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getElapsedFromTempQueue]
(
	/* How long does each type stay in the queue in minutes? */
	@LockTimeForReply int,
	@LockTimeForAssigned int
)
AS 
BEGIN
	SELECT 
		TempQueueID,
		InquirerID, 
		QueueDate, 
		DateInserted,
		Comments,
		TeamID,
		GroupID,
		ConnectorID,
		[Type],
		datediff(n,dateinserted,getdate()) as MinutesOld
	FROM TempQueue 
	WHERE 
	(Type = 1 AND  datediff(n,dateinserted,getdate()) > @LockTimeForAssigned) OR 
	(Type = 2 AND datediff(n,dateinserted,getdate()) > @LockTimeForReply)
END
GO
