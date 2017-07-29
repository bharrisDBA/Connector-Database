USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getGroupQueueSummary]    Script Date: 7/28/2017 10:17:13 PM ******/
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
