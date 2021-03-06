USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getFiltersForPage]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getFiltersForPage]
(
	@Start int,
	@End int,
	@Item As nvarchar(25),
	@Order As varchar(4)
)
AS
BEGIN
	SELECT 
		FilterID,
		FilterName,
		FilterDescription,
		FormFieldData,
		CreateDate,
		FormFieldID,
		FieldName
	FROM
	(
		SELECT
			FilterID,
			FilterName,
			FilterDescription,
			FormFieldData,
			CreateDate,
			FormFieldID,
			FieldName,
			ROW_NUMBER()
		OVER
		(
			ORDER BY
			CASE WHEN @Item='FilterName' THEN FilterName END,
			CASE WHEN @Item='FilterDescription' THEN FilterDescription END,
			CASE WHEN @Item='FormFieldData' THEN FormFieldData END,
			CASE WHEN @Item='FieldName' THEN FieldName END
		)
		AS RowNum FROM get_filters
	)
	AS MyDerivedTable
	WHERE MyDerivedTable.RowNum BETWEEN @Start AND @End
	ORDER BY
	CASE WHEN @Item = 'FilterName' AND @Order = 'asc' 
		THEN FilterName END ASC, 
    CASE WHEN @Item = 'FilterName' AND @Order = 'desc' 
        THEN FilterName END DESC,
	CASE WHEN @Item = 'FilterDescription' AND @Order = 'asc' 
		THEN FilterDescription END ASC, 
	CASE WHEN @Item = 'FilterDescription' AND @Order = 'desc' 
		THEN FilterDescription END DESC,
	CASE WHEN @Item = 'FormFieldData' AND @Order = 'asc' 
		THEN FormFieldData END ASC, 
	CASE WHEN @Item = 'FormFieldData' AND @Order = 'desc' 
		THEN FormFieldData END DESC,
	CASE WHEN @Item = 'FieldName' AND @Order = 'asc' 
		THEN FieldName END ASC, 
	CASE WHEN @Item = 'FieldName' AND @Order = 'desc' 
		THEN FieldName END DESC
END
GO
