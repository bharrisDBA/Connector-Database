USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getConnectionStatsForAPartnerCode]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith
-- Create date: 5/10/17
-- Description:	Gets Evangelism Responses and Inquirer for a specific partnercode by date range
-- =============================================
CREATE PROCEDURE [dbo].[getConnectionStatsForAPartnerCode]
	 @start datetime,
	 @end datetime,
	 @partnerCode nvarchar(50) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	/****** Script for SelectTopNRows command from SSMS  ******/


select ev.site as site,coalesce(ev.responses,0) as responses,coalesce(inq.inquiries,0) as inquiries from

(SELECT dbo.spextractdomainfromurl(linkTo) as site   ,count(*) as responses
  FROM [_connector].[dbo].[EvangelismResponseRecording] 
  where vistime between @start and @end and refurl like '%' + @partnerCode + '%'
  group by dbo.spextractdomainfromurl(linkto)) Ev
left join(
  select fd2.data as SiteOfOrigin,count(*) as inquiries from formdata fd 
  join formdata fd2 on fd2.FormFieldID=12 and fd2.userid = fd.userid
  where  fd.CreateDate between @start and @end and fd.formfieldid=24 and fd.data like  '%' + @partnerCode + '%'
  group by fd2.data) Inq on inq.SiteOfOrigin = ev.site
END

GO
