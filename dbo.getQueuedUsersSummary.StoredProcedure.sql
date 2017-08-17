USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getQueuedUsersSummary]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getQueuedUsersSummary]
AS 
SELECT 	
	UserID,
	UserName,
	UserTypeID,
	FirstName,
	LastName,
	NickName,
	DateCreated,
	GroupID
FROM get_queued_users_summary
GO
