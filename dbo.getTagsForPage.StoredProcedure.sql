USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getTagsForPage]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getTagsForPage]
(
	@Start int,
	@End int,
	@Item As nvarchar(25),
	@Order As varchar(4)
)
AS
BEGIN
	SELECT 
		l_tid, 
		l_tag
	FROM
	(
		SELECT
			l_tid, 
			l_tag, 
			ROW_NUMBER()
		OVER
		(
			ORDER BY
				CASE WHEN @Item = 'l_tid' AND @Order = 'asc' 
					THEN l_tid END ASC, 
				CASE WHEN @Item = 'l_tid' AND @Order = 'desc' 
					THEN l_tid END DESC,
				CASE WHEN @Item = 'l_tag' AND @Order = 'asc' 
					THEN l_tag END ASC, 
				CASE WHEN @Item = 'l_tag' AND @Order = 'desc' 
					THEN l_tag END DESC
		)
		AS RowNum FROM l_tags
	)
	AS MyDerivedTable
	WHERE MyDerivedTable.RowNum BETWEEN @Start AND @End
	end
GO
