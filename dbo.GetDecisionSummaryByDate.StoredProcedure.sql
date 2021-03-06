USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[GetDecisionSummaryByDate]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetDecisionSummaryByDate]
	-- Add the parameters for the stored procedure here
	@start datetime,
	@end datetime
AS
BEGIN
	
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select 
	dbo.cleanupURL(fd.data) as site
	,sum(case when ie.DecisionToday=0 then 1 else 0 end) as dec0
	,sum(case when ie.DecisionToday=1 then 1 else 0 end) as dec1
	,sum(case when ie.DecisionToday=2 then 1 else 0 end) as dec2
	,sum(case when ie.DecisionToday=3 then 1 else 0 end) as dec3
	,sum(case when ie.DecisionToday=4 then 1 else 0 end) as dec4
	,sum(case when ie.DecisionToday=5 then 1 else 0 end) as dec5
	,sum(case when ie.DecisionToday=6 then 1 else 0 end) as dec6
	,sum(case when ie.DecisionToday=7 then 1 else 0 end) as dec7
	from FormData fd  join inquiries ie on ie.UserID = fd.UserID 
 where fd.FormFieldID = 12  and ie.DateSubmitted >= @start and ie.datesubmitted <= @end
 group by fd.data
END

GO
