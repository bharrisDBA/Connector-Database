USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getInquiresOnQueueByTeamAndHours]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith Sorbo
-- Create date: 10/7/16
-- Description:	Gets inquirers on queues for team(s) by hours
-- =============================================
CREATE PROCEDURE [dbo].[getInquiresOnQueueByTeamAndHours]
	-- Add the parameters for the stored procedure here
	@HoursOld int
	--@TeamsIn nChar(100)  -- comma separated string of team ids
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Declare @TeamsIn varChar(100) = '21'
	
	select 
		groupteam.TeamID ,teams.TeamName
		,sum(case when Inquirers.Gender = 0 then 1 end) as Gender0
		,sum(case when Inquirers.Gender = 1 then 1 end) as Gender1
		from groupQueue
		join GroupTeam on GroupTeam.groupid=groupQueue.GroupID
		join teams on teams.teamid=groupteam.teamid
		join users as Inquirers on Inquirers.userid = groupqueue.userid
		where groupTeam.TeamID in (@TeamsIn)
		and datediff(hour,groupqueue.CreateDate,getdate()) > @HoursOld
		group by groupteam.teamid,teams.teamname	
END

GO
