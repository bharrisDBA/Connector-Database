USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getTECInquirers]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith
-- Create date: 12/13/16
-- Description:	Gets a list of inquirers with details for a TEC during a specific period
-- =============================================
CREATE PROCEDURE [dbo].[getTECInquirers] 
	-- Add the parameters for the stored procedure here
	
	@Code nvarchar(40),
	@Start date,
	@end date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT i.userid,fd.data as RawCode,dbo.GetIssueFromTECPartnerCode(fd.data) as IssuePageVisited,u.CountryCode,u.StateProvince,u.City,i.DateSubmitted,dbo.DecisionTypeToEnglish(i.decisiontoday) as decision
		,u2.firstname + ' ' + u2.lastname as Connector
		from inquiries i 
		  join  [_connector].[dbo].[FormData] fd on fd.UserID = i.userid
		  join users u on u.userid=i.userid
		  left join users u2 on u2.userid = i.ProcessorID
		  where fd.data like @code and formfieldid=24 and i.DateSubmitted between @start and @end
		  --order by StateProvince,city
		  order by DateSubmitted
END

GO
