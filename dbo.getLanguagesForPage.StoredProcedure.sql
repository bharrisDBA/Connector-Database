USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getLanguagesForPage]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getLanguagesForPage]
(
	@Start int,
	@End int,
	@Item As nvarchar(25),
	@Order As varchar(4)
)
AS
BEGIN
	SELECT 
		l_id, 
		l_code, 
		l_lang, 
		IsInterfaceLang, 
		RightToLeft
	FROM
	(
		SELECT
			l_id, 
			l_code, 
			l_lang, 
			IsInterfaceLang, 
			RightToLeft,
			ROW_NUMBER()
		OVER
		(
			ORDER BY IsInterfaceLang desc,
				CASE WHEN @Item = 'l_id' AND @Order = 'asc' 
					THEN l_id END ASC, 
				CASE WHEN @Item = 'l_id' AND @Order = 'desc' 
					THEN l_id END DESC,
				CASE WHEN @Item = 'l_code' AND @Order = 'asc' 
					THEN l_code END ASC, 
				CASE WHEN @Item = 'l_code' AND @Order = 'desc' 
					THEN l_code END DESC,
				CASE WHEN @Item = 'l_lang' AND @Order = 'asc' 
					THEN l_lang END ASC, 
				CASE WHEN @Item = 'l_lang' AND @Order = 'desc' 
					THEN l_lang END DESC,
				CASE WHEN @Item = 'RightToLeft' AND @Order = 'asc' 
					THEN RightToLeft END ASC, 
				CASE WHEN @Item = 'RightToLeft' AND @Order = 'desc' 
					THEN RightToLeft END DESC
		)
		AS RowNum FROM l_codes
	)
	AS MyDerivedTable
	WHERE MyDerivedTable.RowNum BETWEEN @Start AND @End
	end
GO
