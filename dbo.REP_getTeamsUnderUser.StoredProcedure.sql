USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[REP_getTeamsUnderUser]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith Sorbo
-- Create date: 11/12/16
-- Description:	Get all teams under a user, whatever his/her level
--              over level 500 gets all teams
-- =============================================
CREATE PROCEDURE [dbo].[REP_getTeamsUnderUser]
	-- Add the parameters for the stored procedure here
	@UserID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	-- teams under a user

declare @UserType int

select @UserType = usertypeid from users where userid = @UserID;

select 
	--@userType as MyUserTypeID
	--,@UserID as MyID
	t.TeamID
	,t.TeamName,u1.firstname + ' ' + u1.lastname as [HeadCoach]
	,u2.firstname + ' ' + u2.lastname as [Coach] 
	,tc.MemberCount as [Team Members]
	,case when tqs.AvailableOnQueue is null then 0 else tqs.AvailableOnQueue end as [In Queue]
	,case when tqs.AverageTimeInQueue is null then '--' else tqs.AverageTimeInQueue end as [Average Time In Queue]
	,case when tqs.OldestInQueue is null then '--' else tqs.OldestInQueue end as [Oldest In Queue]
from teams t 
join users u1 on u1.userid = t.HeadCoachID
join users u2 on u2.userid = t.TeamCoachID
join (select teamid,count(*) as MemberCount from TeamAssignment group by teamid) tc on tc.teamid= t.teamid
left join (select gt.teamid,count(*) as AvailableOnQueue
		,cast(floor(max(datediff(hour,createdate,getdate())) /24) as varchar(4)) + ' days ' +
		CAST((max(datediff(hour,createdate,getdate())) % 24) as varchar(4)) + ' hours' as OldestInQueue
		,cast(floor(avg(datediff(hour,createdate,getdate())) /24) as varchar(4)) + ' days ' +
		CAST((avg(datediff(hour,createdate,getdate())) % 24) as varchar(4)) + ' hours' as AverageTimeInQueue
		from groupteam gt
		join groupqueue gq on gq.GroupID=gt.GroupID
		group by gt.teamid) tqs on tqs.teamid = t.TeamID
where 
	(headcoachid in (select headcoachid from ManagersHierarchy where ManagersID = @UserID))
	or (@UserID = t.HeadCoachID)
	or (@UserID = t.TeamCoachID)
	or (@UserType >=500)
END

GO
