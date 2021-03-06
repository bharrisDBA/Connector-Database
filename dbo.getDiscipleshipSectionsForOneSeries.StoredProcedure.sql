USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getDiscipleshipSectionsForOneSeries]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith Sorbo
-- Create date: 7/18/16
-- Description:	Returns all the sections of one series
-- =============================================
CREATE PROCEDURE [dbo].[getDiscipleshipSectionsForOneSeries]
	-- Add the parameters for the stored procedure here
	@SeriesID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
  discipleshipseries.SeriesID,[SeriesName],[SeriesLanguage],[SeriesLength],[SeriesDescription],[Regularity],[SeriesDescriptionHTML],[Active]
   ,sectionID,serieslocation,sectionname,SectionHTML,plainText,sectionhash
  FROM [_connector].[dbo].[DiscipleshipSeries]
  join DiscipleshipSeriesSections on DiscipleshipSeriesSections.SeriesID = DiscipleshipSeries.SeriesID
  where discipleshipseries.seriesID = @SeriesID
  
  order by SeriesLanguage,SeriesName,SeriesLocation
END

GO
