USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getLanguagesCountWithSearch]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getLanguagesCountWithSearch]
(
	@SearchString nvarchar(50)
)
AS
BEGIN
SELECT Count(*) As ResultCount FROM l_codes
WHERE
	l_id LIKE '%' + @SearchString + '%'
	OR
	l_code LIKE '%' + @SearchString + '%' 
	OR
	l_lang LIKE '%' + @SearchString + '%'
	OR
	IsInterfaceLang LIKE '%' + @SearchString + '%'
	OR
	RightToLeft LIKE '%' + @SearchString + '%'
END
GO
