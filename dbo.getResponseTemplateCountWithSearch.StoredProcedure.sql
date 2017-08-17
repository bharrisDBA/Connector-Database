USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getResponseTemplateCountWithSearch]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getResponseTemplateCountWithSearch]
(
	@SearchString nvarchar(50)
)
AS
BEGIN
SELECT Count(*) As ResultCount FROM get_response_template
WHERE
	TemplateName LIKE '%" + @SearchString + "%' OR LanguageName LIKE '%" + @SearchString + "%' OR FilterName LIKE '%"+ @SearchString + "%'
END
GO
