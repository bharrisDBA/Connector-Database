USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[GetConnectionsResults]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith Sorbo
-- Create date: 9/30/16
-- Description:	Returns Evang. Responses, and each inquirer type for date range
-- =============================================
CREATE PROCEDURE [dbo].[GetConnectionsResults]
	-- Add the parameters for the stored procedure here
	@BeginDate datetime,
	@EndDate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
	case 
		when Data=0 then 'Salvation'
		when data=1 then 'Recommitment'
		when data=2 then 'Question'
		when data=3 then 'Prayer'
		when data=4 then 'Contact'
		when data=5 then 'Subscription' end as decisionType
	,count(data)
  FROM [_connector].[dbo].[FormData] fd
  where fd.FormFieldID = 7
  and createdate between @BeginDate and @EndDate
  group by fd.data
  --order by decisionType
  union 
  select 'Evangelism Responses', count(*) from EvangelismResponseRecording
  where visTime between @BeginDate and @EndDate
END

GO
