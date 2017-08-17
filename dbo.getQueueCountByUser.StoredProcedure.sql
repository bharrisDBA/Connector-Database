USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getQueueCountByUser]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getQueueCountByUser]
(
	@UserID int
)
AS
BEGIN
	SELECT COUNT(*) As QueueCount FROM       
	dbo.GroupQueue Left Join dbo.GroupTeam 
	ON dbo.GroupQueue.GroupID = dbo.GroupTeam.GroupID 
	Left Join TeamAssignment ON 
	TeamAssignment.TeamID = dbo.GroupTeam.TeamID 
	Where TeamAssignment.UserID = @UserID
END

GO
