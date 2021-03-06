USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getDiscipleshipSeriesForPageWithSearch]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getDiscipleshipSeriesForPageWithSearch]
(
	@Start int,
	@End int,
	@Item As nvarchar(25),
	@Order As varchar(4),
	@SearchString As nvarchar(25)
)
AS
BEGIN
	SELECT 
		SeriesID,
  		SeriesName,
  		SeriesLanguage,
		SeriesLanguageName,
  		SeriesLength,
  		SeriesDescription,
		SeriesDescriptionHTML,
  		Regularity,
		Active
	FROM
	(
		SELECT
			SeriesID,
  			SeriesName,
  			SeriesLanguage,
			SeriesLanguageName,
  			SeriesLength,
  			SeriesDescription,
			SeriesDescriptionHTML,
  			Regularity,
			Active,
			ROW_NUMBER()
		OVER
		(
			ORDER BY
				CASE WHEN @Item = 'SeriesName' AND @Order = 'asc' 
					THEN SeriesName END ASC, 
				CASE WHEN @Item = 'SeriesName' AND @Order = 'desc' 
					THEN SeriesName END DESC,
				CASE WHEN @Item = 'SeriesLanguageName' AND @Order = 'asc' 
					THEN SeriesLanguageName END ASC, 
				CASE WHEN @Item = 'SeriesLanguageName' AND @Order = 'desc' 
					THEN SeriesLanguageName END DESC,
				CASE WHEN @Item = 'SeriesLength' AND @Order = 'asc' 
					THEN SeriesLength END ASC, 
				CASE WHEN @Item = 'SeriesLength' AND @Order = 'desc' 
					THEN SeriesLength END DESC,
				CASE WHEN @Item = 'SeriesDescription' AND @Order = 'asc' 
					THEN SeriesDescription END ASC, 
				CASE WHEN @Item = 'SeriesDescription' AND @Order = 'desc' 
					THEN SeriesDescription END DESC,
				CASE WHEN @Item = 'Regularity' AND @Order = 'asc' 
					THEN Regularity END ASC, 
				CASE WHEN @Item = 'Regularity' AND @Order = 'desc' 
					THEN Regularity END DESC,
				CASE WHEN @Item = 'Active' AND @Order = 'asc' 
					THEN Active END ASC, 
				CASE WHEN @Item = 'Active' AND @Order = 'desc' 
					THEN Active END DESC
		)
		AS RowNum FROM get_discipleships
		WHERE
		(
			SeriesName LIKE '%' + @SearchString + '%' OR
			SeriesLanguage LIKE @SearchString  OR
			SeriesLength LIKE  @SearchString OR 
			SeriesDescription LIKE '%' + @SearchString + '%' OR
			Regularity LIKE '%' + @SearchString + '%'
		)
	)
	AS MyDerivedTable
	WHERE MyDerivedTable.RowNum BETWEEN @Start AND @End
	end
GO
