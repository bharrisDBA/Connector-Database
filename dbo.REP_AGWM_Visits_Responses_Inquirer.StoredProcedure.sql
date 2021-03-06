USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[REP_AGWM_Visits_Responses_Inquirer]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith
-- Create date: 11/15/16
-- Description:	returns a table of agwm regions, areas, countries with visits,responses and inquirer totals
-- =============================================
CREATE PROCEDURE [dbo].[REP_AGWM_Visits_Responses_Inquirer]
	-- Add the parameters for the stored procedure here
	@start date,
	@end date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	select region as [AGWM Region]
	,area as [AGWM Area]
	,c.Name as [Country Name]
	,case when a.visits is null then '0' else dbo.addcommastointeger(a.visits) end as Visits
	,case when er.responses is null then '0' else dbo.addcommastointeger(er.responses) end as [Evangelism Responses]
	,case when inq.inquirers is null then '0' else dbo.addcommastointeger(inq.inquirers) end as [Total Inquirers]
	, dbo.addcommastointeger(inq.Salvations) as Salvations
	, dbo.addcommastointeger(inq.Recommitments)  as Recommitments
	, dbo.addcommastointeger(inq.Questions)  as Questions
	, dbo.addcommastointeger(inq.Prayer) as [Prayer Requests]
	, dbo.addcommastointeger(inq.Contacts) as Contacts
	, dbo.addcommastointeger(inq.Subscriptions) as Subscriptions

	from agwm ag
	left join (select data1 as countrycode,sum([count]) as visits from analaytics  where datatype='c' and [date] between @start and @end group by data1) a on a.countrycode=ag.countrycode
	left join (select countrycode,count(*) as responses from EvangelismResponseRecording where visTime between @start and @end group by CountryCode ) er on er.CountryCode = ag.CountryCode
	left join (
		select u.countrycode,count(*) as inquirers 
			,sum(case when i.decisionToday=0 then 1 else 0 end) as Salvations
			,sum(case when i.decisionToday=1 then 1 else 0 end) as Recommitments
			,sum(case when i.decisionToday=2 then 1 else 0 end) as Questions
			,sum(case when i.decisionToday=3 then 1 else 0 end) as Prayer
			,sum(case when i.decisionToday=4 then 1 else 0 end) as Contacts
			,sum(case when i.decisionToday=5 then 1 else 0 end) as Subscriptions
			from users u
			join inquiries i on i.UserID = u.UserID
			where DateCreated between @start and @end group by countrycode
	) inq on inq.CountryCode = ag.CountryCode
	join countries c on c.Code = ag.CountryCode and c.LanguageCode = 'en'
	order by ag.region,ag.area,c.name
end
GO
