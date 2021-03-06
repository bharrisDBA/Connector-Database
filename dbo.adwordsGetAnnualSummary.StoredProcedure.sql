USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[adwordsGetAnnualSummary]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[adwordsGetAnnualSummary] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from openquery([romans-adwords],
	'select date_format(startdate,"%Y-%m") as YearMonth, sum(visits) as visits 
	from analytics a
	join sites s on s.id=a.siteid
	group by date_format(startdate,"%Y-%m")
	order by startdate desc
	-- limit 400
	'
	)
END

GO
