USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[REP_InquirerStatisticsByEvangelismIssue]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[REP_InquirerStatisticsByEvangelismIssue]
	-- Add the parameters for the stored procedure here
	@Start Date,
	@End date,
	@Sites nvarchar(650)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
select d.SiteOfOrigin,case when right(IssuePage,1)='/' then left(issuepage,len(issuepage)-1) else issuepage end as IssuePage
	,sum(case when d.decisiontoday=0 then 1 else 0 end) as Salvations
	,sum(case when d.decisiontoday=1 then 1 else 0 end) as Recommitments
	,sum(case when d.decisiontoday=2 then 1 else 0 end) as Questions
	,sum(case when d.decisiontoday=3 then 1 else 0 end) as Prayer
	,sum(case when d.decisiontoday=4 then 1 else 0 end) as Contacts
	,sum(case when d.decisiontoday=5 then 1 else 0 end) as Subscriptions
	,count(*) as total
from

(select   fd1.createdate,fd1.userid,fd1.data
	,
	replace(replace(replace(replace(replace(case when CHARINDEX('?',fd1.data)>5 then 
		left(fd1.data,CHARINDEX('?',fd1.data)-1)  else fd1.data end,'/index.php','') ,'www.','') ,'https://',''),'http://',''),'/index.html','')
		as IssuePage
	,fd2.data as SiteOfOrigin
	,fd3.Data as decisiontoday
	from formdata fd1 
	join formdata fd2 on fd2.UserID = fd1.userid and fd2.FormFieldID = 12
	join formdata fd3 on fd3.userid = fd1.userid and fd3.FormFieldID = 7
	where fd1.FormFieldID = 37
	and fd1.createdate between @Start and @end
	and charindex(fd2.data,@sites) > 0

	 ) d
	group by siteoforigin,case when right(IssuePage,1)='/' then left(issuepage,len(issuepage)-1) else issuepage end

	order by count(*) desc 
 
END

GO
