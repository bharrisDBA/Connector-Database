USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[REP_VisitsResponsesInquirersForSpanishSites]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[REP_VisitsResponsesInquirersForSpanishSites]
	-- Add the parameters for the stored procedure here
	@start nvarchar(20),
	@end nvarchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	/****** Script for SelectTopNRows command from SSMS  ******/
--declare @start date='2016-10-01'
--declare @end date = '2016-10-30'

select 'Spanish Sites' as Sites
--, v.countrycode
,case when c.name is null then 'Unknown' else c.name end as Country
,isnull(v.visits,0) as Visits
,isnull(er.responses,0) as Responses
,isnull(inq.totalInquiries,0) as TotalInquiries
,isnull(inq.salvation,0) as Salvations
,isnull(inq.recommitment,0) as Recommitments
,isnull(inq.question,0) as Questions
,isnull(inq.prayer,0) as [Prayer Requests]
,isnull(inq.subscription,0) as Subscriptions


from 
(SELECT [Data2] as countrycode ,sum([Count]) as visits
  FROM [_connector].[dbo].[Analaytics] where datatype='sc' 
  and date between  @start and @end
  -- and data1 in ('descubreajesus.com','respuestasdelavida.com')
  and (data1 like '%descubre%' or data1 like '%respuestas%')
  group by data2) v

left join (select countrycode,count(*) as responses  from EvangelismResponseRecording
where visTime between @start and @end and (siteoforigin like '%descubre%' or siteoforigin like '%respuestas%')
group by CountryCode) er on er.CountryCode = v.countrycode

left join (select 
		u.countrycode
		,sum(case when decisiontoday = 0 then 1 else 0 end) as salvation
		,sum(case when decisiontoday = 1 then 1 else 0 end) as recommitment
		,sum(case when decisiontoday = 2 then 1 else 0 end) as question
		,sum(case when decisiontoday = 3 then 1 else 0 end) as prayer
		,sum(case when decisiontoday = 4 then 1 else 0 end) as contact
		,sum(case when decisiontoday = 5 then 1 else 0 end) as subscription
		,sum(case when decisiontoday = 6 then 1 else 0 end) as dec6
		,sum(case when decisiontoday = 7 then 1 else 0 end) as dec7
		,sum(1) as totalInquiries
	from inquiries i
	left join users u on  u.userid = i.userid
	left join formdata fd on fd.userid = i.userid 
	where DateSubmitted between @start and @end and  formfieldid = 12 and (data like '%descubre%' or data like '%respuestas%')
	group by countrycode) inq on inq.CountryCode = v.countrycode

left join countries c on c.Code = v.countrycode and c.LanguageCode = 'en'
order by Country
END

GO
