USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getTagsCountWithSearch]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getTagsCountWithSearch]
(
	@SearchString nvarchar(50)
)
AS
BEGIN
SELECT Count(*) As ResultCount FROM l_tags
WHERE
(
	l_tid LIKE '%' + @SearchString + '%'
	OR
	l_tag LIKE '%' + @SearchString + '%' 
)
END
GO
