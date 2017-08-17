USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getPagesForPage]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getPagesForPage]
(
	@Start int,
	@End int,
	@Item As nvarchar(25),
	@Order As varchar(4)
)
AS
BEGIN
	SELECT 
		PageID, 
		PageName, 
		PageTree, 
		FileName, 
		NavIcon
	FROM
	(
		SELECT
			PageID, 
			PageName, 
			PageTree, 
			FileName, 
			NavIcon,
			ROW_NUMBER()
		OVER
		(
			ORDER BY
				CASE WHEN @Item = 'PageID' AND @Order = 'asc' 
					THEN PageID END ASC, 
				CASE WHEN @Item = 'PageID' AND @Order = 'desc' 
					THEN PageID END DESC,
				CASE WHEN @Item = 'PageName' AND @Order = 'asc' 
					THEN PageName END ASC, 
				CASE WHEN @Item = 'PageName' AND @Order = 'desc' 
					THEN PageName END DESC,
				CASE WHEN @Item = 'PageTree' AND @Order = 'asc' 
					THEN PageTree END ASC, 
				CASE WHEN @Item = 'PageTree' AND @Order = 'desc' 
					THEN PageTree END DESC,
				CASE WHEN @Item = 'FileName' AND @Order = 'asc' 
					THEN FileName END ASC, 
				CASE WHEN @Item = 'FileName' AND @Order = 'desc' 
					THEN FileName END DESC,
				CASE WHEN @Item = 'NavIcon' AND @Order = 'asc' 
					THEN NavIcon END ASC, 
				CASE WHEN @Item = 'NavIcon' AND @Order = 'desc' 
					THEN NavIcon END DESC
		)
		AS RowNum FROM Pages
	)
	AS MyDerivedTable
	WHERE MyDerivedTable.RowNum BETWEEN @Start AND @End
	end
GO
