USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getTemplatesCountWithSearch]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getTemplatesCountWithSearch]
(
	@SearchString nvarchar(50)
)
AS
BEGIN
SELECT Count(*) As ResultCount FROM ResponseTemplate
WHERE
	TemplateName LIKE '%' + @SearchString + '%'
	OR
	Subject LIKE '%' + @SearchString + '%' 
	OR
	Content LIKE '%' + @SearchString + '%'
END
GO
