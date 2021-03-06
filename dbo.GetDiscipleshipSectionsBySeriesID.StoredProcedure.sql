USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[GetDiscipleshipSectionsBySeriesID]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith Sorbo
-- Create date: 8/3/16
-- Description:	Returns all the sections of a given series
-- =============================================
CREATE PROCEDURE [dbo].[GetDiscipleshipSectionsBySeriesID]
	 @SeriesID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT  [SectionID]
      ,[SeriesID]
      ,[SeriesLocation]
      ,[SectionName]
      ,[SectionHTML]
      ,[plainText]
	  ,[sectionhash]
  FROM [_connector].[dbo].[DiscipleshipSeriesSections]
  where seriesid = @SeriesID
  order by seriesLocation
END

GO
