USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getTECResponseAndInquirerCounts]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith
-- Create date: 12/14/16
-- Description:	Returns the number of hits on each partner key for a specified TEC
-- =============================================
CREATE PROCEDURE [dbo].[getTECResponseAndInquirerCounts]
	-- Add the parameters for the stored procedure here
	@PartnerCode nvarchar(40),
	@StartDate as Date,
	@EndDate as Date
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	set @PartnerCode =  @PartnerCode 
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select r.pKey as Issue,r.Cnt as Responses,(case when i.cnt is null then 0 else i.cnt end) as Inquirers
	
	from (select  dbo.GetIssueFromTECPartnerCode(substring(refurl,patindex('%nPartner=%',refurl) + 9,len(refurl))) as pKey,count(*) as Cnt from EvangelismResponseRecording 
		where refurl like @PartnerCode and vistime between @StartDate and @EndDate
		group by substring(refurl,patindex('%nPartner=%',refurl) + 9,len(refurl))) r
    left join (SELECT fd.data,dbo.GetIssueFromTECPartnerCode(fd.data) as IssuePageVisited
		,count(*) as cnt
		from inquiries i 
		  join  [_connector].[dbo].[FormData] fd on fd.UserID = i.userid
		  join users u on u.userid=i.userid
		  left join users u2 on u2.userid = i.ProcessorID
		  where fd.data like @PartnerCode and formfieldid=24 and i.DateSubmitted between  @StartDate and @EndDate
		  --order by StateProvince,city
		group by fd.data) i on i.IssuePageVisited = r.pKey


END

GO
