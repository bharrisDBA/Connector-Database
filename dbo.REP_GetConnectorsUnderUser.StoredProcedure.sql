USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[REP_GetConnectorsUnderUser]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
IF OBJECT_ID('[dbo].[REP_GetConnectorsUnderUser]') IS NOT NULL
BEGIN
	DROP PROCEDURE [dbo].[REP_GetConnectorsUnderUser]
END
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith
-- Create date: 11/12/16
-- Description:	Report on all the COnnectors under me
-- =============================================
CREATE PROCEDURE [dbo].[REP_GetConnectorsUnderUser]
	-- Add the parameters for the stored procedure here
	@Userid int,
	@DaysBack int = 30
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

declare @UserType int
select @UserType = usertypeid from users where userid = @UserID;

select  distinct
convert(varchar(25), isNull( us.laston,Cast('01/01/1970' as datetime)), 120) as [Last Log On]
,(u3.firstname + ' ' + u3.lastname) as [ConnectorName]
,case when ie.inquirers is null then 0 else ie.inquirers end as [Total Inquirers]
,case when ie2.inquirers is null then 0 else ie2.inquirers end as [Inquirers in Specified Days]
,u3.userid
,dbo.userteams(u3.userid) as [Team Membership]
from TeamAssignment ta
join users u3 on u3.userid = ta.userid
join teams t2 on t2.TeamID = ta.TeamID
left join (select userid,max(starttime) LastOn from  UserSessions group by userid) us on us.userid = ta.UserID 
left join (select connectorid,count(*) as Inquirers from InquirerExtension group by connectorid) ie on ie.connectorid=ta.userid
left join (select connectorid,count(*) as Inquirers from InquirerExtension where dateassigned between dateadd(day,-1 * @DaysBack,getdate()) and getdate() group by connectorid) ie2 on ie2.connectorid=ta.userid
where ta.teamid in 
	(select t.TeamID from teams t 
	join users u1 on u1.userid = t.HeadCoachID
	join users u2 on u2.userid = t.TeamCoachID
	where 
		(headcoachid in (select headcoachid from ManagersHierarchy where ManagersID = @UserID))
		or (@UserID = t.HeadCoachID)
		or (@UserID = t.TeamCoachID)
		or (@UserType >=500))
order by ConnectorName
END

GO
