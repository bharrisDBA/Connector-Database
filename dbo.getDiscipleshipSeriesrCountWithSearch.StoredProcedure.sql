USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getDiscipleshipSeriesrCountWithSearch]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getDiscipleshipSeriesrCountWithSearch]
(
	@SearchString nvarchar(50)
)
AS
BEGIN
SELECT Count(*) As ResultCount FROM DiscipleshipSeries
WHERE
	SeriesName LIKE '%' + @SearchString + '%'
	OR
	SeriesDescription LIKE '%' + @SearchString + '%' 
	OR
	Regularity LIKE '%' + @SearchString + '%'
END
GO
