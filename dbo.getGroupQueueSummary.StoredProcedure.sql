USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getGroupQueueSummary]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getGroupQueueSummary]
(
	@GroupID int
)
AS
SELECT 	
	UserID, NickName, DateCreated, LastName, FirstName, UserName
FROM get_group_queue_summary WHERE GroupID = @GroupID
GO
