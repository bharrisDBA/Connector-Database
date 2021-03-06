USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[REP_test]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[REP_test]
	-- Add the parameters for the stored procedure here
	@ProcessorID int,
	@StartDate date,
	@EndDate date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select dbo.DecisionTypeToEnglish(decisiontoday) as [Decision Type]
	,firstcontacturl as [First Contact URL]
	,comments as [Inquirer Comments]
	,Format(datesubmitted,'d','en-US') as [Date Submitted]
	,Format(dateprocessed,'d','en-US') as [Date Processed] 
	from inquiries where ProcessorID = @ProcessorID and datesubmitted between @startdate and @enddate
END

GO
