USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getVisitsResponsesInquirersByYearMonth]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith
-- Create date: 1/13/17
-- Description:	Returns a table of stats totaled by Year-Month for Visits, Responses & Inquirers
-- =============================================
CREATE PROCEDURE [dbo].[getVisitsResponsesInquirersByYearMonth]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select v.YearMonth ,v.visits,r.responses,i.inquirers,v.YrMonth
from (select format([date],'yyyyMM') as YrMonth
,cast( year([date]) as varchar(4))+' ' + datename(month,[date]) as YearMonth
	,sum([count]) as visits 
from Analaytics
where datatype='c'
group by format([date],'yyyyMM')
,cast( year([date]) as varchar(4))+' ' + datename(month,[date]) ) v

join (
select format(vistime,'yyyyMM') as YrMnth
	,cast( year(visTime) as varchar(4))+' ' + datename(month,visTime) as YearMonth
	,count(*) as responses
from EvangelismResponseRecording
group by format(vistime,'yyyyMM'),cast( year(vistime) as varchar(4))+' ' + datename(month,vistime)
) r on r.YrMnth = v.YrMonth
join (select format(datesubmitted,'yyyyMM') as YrMth
	,cast( year(datesubmitted) as varchar(4))+' ' + datename(month,datesubmitted) as YearMonth
	,count(*) as inquirers
from Inquiries
group by format(datesubmitted,'yyyyMM'),cast( year(datesubmitted) as varchar(4))+' ' + datename(month,datesubmitted)
) i on i.YrMth = v.YrMonth

order by v.yrmonth
END

GO
