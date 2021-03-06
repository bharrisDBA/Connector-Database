USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getDiscipleshipResponsesBySiteAndDate]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getDiscipleshipResponsesBySiteAndDate]
	-- Add the parameters for the stored procedure here
	@Start datetime,
	@End datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT dbo.cleanupURL(siteOfOrigin) as site,count(*) as cnt  FROM [_connector].[dbo].[EvangelismResponseRecording] 
	where visTime between @start and @End  group by siteOfOrigin
END

GO
