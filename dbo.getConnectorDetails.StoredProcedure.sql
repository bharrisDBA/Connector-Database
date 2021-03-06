USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getConnectorDetails]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith
-- Create date: 12/6/16
-- Description:	Returns a variety of detail information about a connector
-- =============================================
CREATE PROCEDURE [dbo].[getConnectorDetails]
	-- Add the parameters for the stored procedure here
	@UserID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure heredeclare @userID int = 2056
select u.userid ,firstname + ' ' + lastname as ConnectorName,dbo.userstatusenglish(u.status) as status,dbo.usertypeenglish(u.usertypeid) as UserType
	 ,coalesce(inq.days7,0) as Inquirers7,coalesce(inq.days30,0) as Inquirers30,coalesce(days90,0) as inquirers90,coalesce(days180,0) as inquirers180,
	 coalesce(days365,0) as Inquirers365,coalesce(inq.tot ,0) as TotalInquirers
	 ,dbo.LogOnInLastXDays( u.userid,7) as Logged7
	 ,dbo.LogOnInLastXDays( u.userid,30) as Logged30
	 ,dbo.LogOnInLastXDays( u.userid,90) as Logged90
	 ,dbo.LogOnInLastXDays( u.userid,180) as Logged180
	 ,dbo.LogOnInLastXDays( u.userid,365) as Logged365
 from users u
left join (select 
	processorid as ConnectorID
	,sum(case when datediff(day,dateprocessed,getdate())<=7 then 1 else 0 end) as days7
	,sum(case when datediff(day,dateprocessed,getdate())<=30 then 1 else 0 end) as days30
	,sum(case when datediff(day,dateprocessed,getdate())<=90 then 1 else 0 end) as days90
	,sum(case when datediff(day,dateprocessed,getdate())<=180 then 1 else 0 end) as days180
	,sum(case when datediff(day,dateprocessed,getdate())<=365 then 1 else 0 end) as days365
	,count(*) as tot
from inquiries group by processorid ) inq on u.userid=inq.ConnectorID

where u.usertypeid >100  
and u.userid = @userid

END

GO
