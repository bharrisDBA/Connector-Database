USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getFilterCountWithSearch]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getFilterCountWithSearch]
(
	@SearchString nvarchar(50)
)
AS
BEGIN
SELECT Count(*) As ResultCount FROM get_filters
WHERE
	FilterName LIKE '%' + @SearchString + '%'
	OR
	FilterDescription LIKE '%' + @SearchString + '%'
	OR
	FormFieldData LIKE '%' + @SearchString + '%'
	OR
	FieldName LIKE '%' + @SearchString + '%'
END
GO
