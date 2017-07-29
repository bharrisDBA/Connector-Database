USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getExpiredQueuedUsersWithForwardingGroup]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getExpiredQueuedUsersWithForwardingGroup]
AS
BEGIN
	SELECT 
		UserID, 
		GroupQueue.GroupID, 
		GroupQueue.CreateDate, 
		Groups.ForwardGroupID 
	FROM GroupQueue 
		INNER JOIN Groups ON GroupQueue.GroupID = Groups.GroupID 
	WHERE 
		Groups.ExpirationTime > 0 
		AND Groups.ForwardGroupID > 0 
		AND GroupQueue.CreateDate <= DATEADD(hh,-Groups.ExpirationTime,GETDATE())
END

GO
