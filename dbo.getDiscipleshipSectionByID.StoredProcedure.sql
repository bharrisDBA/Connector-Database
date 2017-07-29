USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getDiscipleshipSectionByID]    Script Date: 7/28/2017 10:17:13 PM ******/
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
