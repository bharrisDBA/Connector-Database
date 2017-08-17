USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getVisitsResponsesInquirersByYear]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith
-- Create date: 1/14/17
-- Description:	Returns a table of stats totaled by Year for Visits, Responses & Inquirers
-- =============================================
CREATE PROCEDURE [dbo].[getVisitsResponsesInquirersByYear]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
select v.Year ,v.visits,r.responses,i.inquirers
	,cast(100*r.responses as float)/cast(v.visits as float) as ResponsesPerVisit
	,cast(100*i.inquirers as float)/cast(v.visits as float) as InquirersPerVisit
	,cast(100*i.inquirers as float)/cast(r.responses as float) as InquirersPerResponse
	from (select year(date) as Year
			,sum([count]) as visits 
		from Analaytics
		where datatype='c'
		group by year([date])
		 ) v
join (
	select year(vistime) as [Year]
		,count(*) as responses
	from EvangelismResponseRecording
	group by year(vistime)
	) r on r.year = v.year
join (
	select year(datesubmitted) as year
		,count(*) as inquirers
	from Inquiries
	group by year(datesubmitted)
	) i on i.year = v.year

order by v.year
END

GO
