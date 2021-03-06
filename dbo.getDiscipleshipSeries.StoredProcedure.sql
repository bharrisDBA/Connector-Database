USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getDiscipleshipSeries]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getDiscipleshipSeries]
AS
BEGIN
  SELECT
  	SeriesID,
  	SeriesName,
  	SeriesLanguage,
  	SeriesLength,
  	SeriesDescription,
	SeriesDescriptionHTML,
  	Regularity,
	Active
  FROM DiscipleshipSeries
  ORDER BY SeriesLanguage,SeriesName
END
GO
