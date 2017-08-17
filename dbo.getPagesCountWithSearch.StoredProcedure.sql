USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getPagesCountWithSearch]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getPagesCountWithSearch]
(
	@SearchString nvarchar(50)
)
AS
BEGIN
SELECT Count(*) As ResultCount FROM Pages
WHERE
(
	PageID LIKE '%' + @SearchString + '%'
	OR
	PageName LIKE '%' + @SearchString + '%' 
	OR
	PageTree LIKE '%' + @SearchString + '%'
	OR
	FileName LIKE '%' + @SearchString + '%'
	OR
	NavIcon LIKE '%' + @SearchString + '%'
)
END
GO
