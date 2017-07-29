USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getFormFieldsCountWithSearch]    Script Date: 7/28/2017 10:17:13 PM ******/
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
