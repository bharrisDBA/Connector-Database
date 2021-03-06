USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getFormFieldsForPage]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getFormFieldsForPage]
(
	@Start int,
	@End int,
	@Item As nvarchar(25),
	@Order As varchar(4)
)
AS
BEGIN
	SELECT 
		FormFieldID, 
		FieldType, 
		FieldName, 
		DisplayName, 
		DefaultValue,
		ValidationType, 
		DisplayOrder, 
		IsPermanent, 
		IsActive
	FROM
	(
		SELECT
			FormFieldID, 
			FieldType, 
			FieldName, 
			DisplayName, 
			DefaultValue,
			ValidationType, 
			DisplayOrder, 
			IsPermanent, 
			IsActive,
			ROW_NUMBER()
		OVER
		(
			ORDER BY
				CASE WHEN @Item = 'FormFieldID' AND @Order = 'asc' 
					THEN FormFieldID END ASC, 
				CASE WHEN @Item = 'FormFieldID' AND @Order = 'desc' 
					THEN FormFieldID END DESC,
				CASE WHEN @Item = 'FieldName' AND @Order = 'asc' 
					THEN FieldName END ASC, 
				CASE WHEN @Item = 'FieldName' AND @Order = 'desc' 
					THEN FieldName END DESC,
				CASE WHEN @Item = 'DisplayName' AND @Order = 'asc' 
					THEN DisplayName END ASC, 
				CASE WHEN @Item = 'DisplayName' AND @Order = 'desc' 
					THEN DisplayName END DESC,
				CASE WHEN @Item = 'DefaultValue' AND @Order = 'asc' 
					THEN DefaultValue END ASC, 
				CASE WHEN @Item = 'DefaultValue' AND @Order = 'desc' 
					THEN DefaultValue END DESC,
				CASE WHEN @Item = 'ValidationType' AND @Order = 'asc' 
					THEN ValidationType END ASC, 
				CASE WHEN @Item = 'ValidationType' AND @Order = 'desc' 
					THEN ValidationType END DESC,
				CASE WHEN @Item = 'DisplayOrder' AND @Order = 'asc' 
					THEN DisplayOrder END ASC, 
				CASE WHEN @Item = 'DisplayOrder' AND @Order = 'desc' 
					THEN DisplayOrder END DESC,
				CASE WHEN @Item = 'IsPermanent' AND @Order = 'asc' 
					THEN IsPermanent END ASC, 
				CASE WHEN @Item = 'IsPermanent' AND @Order = 'desc' 
					THEN IsPermanent END DESC,
				CASE WHEN @Item = 'IsActive' AND @Order = 'asc' 
					THEN IsActive END ASC, 
				CASE WHEN @Item = 'IsActive' AND @Order = 'desc' 
					THEN IsActive END DESC
		)
		AS RowNum FROM get_form_fields
	)
	AS MyDerivedTable
	WHERE MyDerivedTable.RowNum BETWEEN @Start AND @End
	end
GO
