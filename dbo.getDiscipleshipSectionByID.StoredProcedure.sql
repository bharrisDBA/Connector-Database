USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getDiscipleshipSectionByID]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getDiscipleshipSectionByID]
(
	@SectionID int
)
AS
BEGIN
	SELECT 
		SectionID,
		SectionName,
		SeriesLocation,
		SectionHTML,
		plainText,
		DiscipleshipSeries.SeriesName,
		sectionhash
	FROM DiscipleshipSeriesSections
	INNER JOIN DiscipleshipSeries ON DiscipleshipSeries.SeriesID = DiscipleshipSeriesSections.SeriesID
	WHERE SectionID = @SectionID
END
GO
