USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getInquirerCountForPeriod]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith
-- Create date: 8/25/16
-- Description:	Get total inquirers by category within a date range
-- =============================================
CREATE PROCEDURE [dbo].[getInquirerCountForPeriod] 
	-- Add the parameters for the stored procedure here
	@StartDate varchar(15),
	@EndDate varchar(15)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT decisiontoday,count(*)
  FROM [_connector].[dbo].[Inquiries]
  where datesubmitted >=@StartDate and datesubmitted <=@EndDate
  group by decisiontoday
END

GO
