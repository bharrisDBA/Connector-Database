USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getFormFieldsCountWithSearch]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getFormFieldsCountWithSearch]
(
	@SearchString nvarchar(50)
)
AS
BEGIN
SELECT Count(*) As ResultCount FROM get_form_fields
WHERE
	FieldName LIKE '%' + @SearchString + '%'
	OR
	DisplayName LIKE '%' + @SearchString + '%' 
	OR
	DisplayOrder LIKE '%' + @SearchString + '%'
	OR
	IsPermanent LIKE '%' + @SearchString + '%'
	OR
	IsActive LIKE '%' + @SearchString + '%'
END
GO
