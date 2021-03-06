USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getDiscipleshipInfoByUnsubscribeToken]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith Sorbo
-- Create date: 8/3/16
-- Description:	Returns basic user information from a discipleship unsubscribe token
-- =============================================
CREATE PROCEDURE [dbo].[getDiscipleshipInfoByUnsubscribeToken]
	-- Add the parameters for the stored procedure here
	@UnsubscribeToken nchar(30)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT users.userid,email,SeriesName,firstname,DiscipleshipSeries.SeriesID,users.PreferredLanguage
  FROM [_connector].[dbo].[DiscipleshipSeriesUserConnection]
  join users on users.userid=DiscipleshipSeriesUserConnection.userid
  join DiscipleshipSeries on DiscipleshipSeries.SeriesID = DiscipleshipSeriesUserConnection.SeriesID

  where unsubscribetoken = @UnsubscribeToken
END

GO
