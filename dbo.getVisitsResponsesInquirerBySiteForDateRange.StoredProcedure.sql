USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getVisitsResponsesInquirerBySiteForDateRange]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith
-- Create date: 3/8/17
-- Description:	Returns Site Visits,Evangelism Responses and total inquirers by site for the given date range
-- =============================================
CREATE PROCEDURE [dbo].[getVisitsResponsesInquirerBySiteForDateRange]
	-- Add the parameters for the stored procedure here
	@startDate datetime,
	@endDate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
--	Declare @startDate as dateTime = '2017-03-03'
-- declare @enddate as datetime = '2017-03-04'

set @startdate = @startdate + ' 00:00:00';
set @enddate = @enddate + ' 23:59:50';

with Domains(domain)
as
(select  data1 from Analaytics where datatype='s' group by data1
union
select  lower(data) as domain  from formdata where formfieldid = 12 group by lower(data) 
)

select 
   -- @startdate,@enddate,
    domains.domain,
	case when visits.visits is null then 0 else visits.visits end as visits
	,case when resp.responses is null then 0 else resp.responses end as responses
	,case when inq.inquiries is null then 0 else inq.inquiries end as inquiries 
from domains
left join
	(SELECT data1 as domain, sum(count) as visits
		FROM [_connector].[dbo].[Analaytics]
		where datatype = 's' and [date] >= @startdate and [date]<= @enddate
		group by data1 
		) 
visits on visits.domain = domains.domain

left join (SELECT 
		 dbo.spExtractDomainFromURL(linkto) as domain
		 ,count(*) as responses
	      FROM [_connector].[dbo].[EvangelismResponseRecording] 
	      where vistime >= @startDate and vistime <= @enddate
	      group by dbo.spExtractDomainFromURL(linkto)
	  ) 
resp on resp.domain=domains.domain

left join(
	  SELECT 
      fd.data as domain ,count(*) as inquiries
	  FROM [_connector].[dbo].[Inquiries] i 
	  join formdata fd on fd.userid = i.userid and ( fd.FormFieldID = 12)
	  where DateSubmitted >= @startdate and datesubmitted <= @enddate
	  group by fd.data ) 
	inq on inq.domain=domains.domain
where visits.visits>0 or resp.responses>0 or inq.inquiries>0
;
END

GO
