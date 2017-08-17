USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getTemplatesForPage]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getTemplatesForPage]
(
	@Start int,
	@End int,
	@Item As nvarchar(25),
	@Order As varchar(4)
)
AS
BEGIN
	SELECT 
		TemplateID,
  		TemplateName,
  		Subject,
  		Content,
  		DecisionType,
		LanguageID,
  		FilterID,
		Weight,
		IsDefault,
		CreateDate
	FROM
	(
		SELECT
			TemplateID,
  			TemplateName,
  			Subject,
  			Content,
  			DecisionType,
			LanguageID,
  			FilterID,
			Weight,
			IsDefault,
			CreateDate,
			ROW_NUMBER()
		OVER
		(
			ORDER BY
				CASE WHEN @Item = 'TemplateName' AND @Order = 'asc' 
					THEN TemplateName END ASC, 
				CASE WHEN @Item = 'TemplateName' AND @Order = 'desc' 
					THEN TemplateName END DESC,
				CASE WHEN @Item = 'Subject' AND @Order = 'asc' 
					THEN Subject END ASC, 
				CASE WHEN @Item = 'Subject' AND @Order = 'desc' 
					THEN Subject END DESC,
				CASE WHEN @Item = 'DecisionType' AND @Order = 'asc' 
					THEN DecisionType END ASC, 
				CASE WHEN @Item = 'DecisionType' AND @Order = 'desc' 
					THEN DecisionType END DESC,
				CASE WHEN @Item = 'LanguageID' AND @Order = 'asc' 
					THEN LanguageID END ASC, 
				CASE WHEN @Item = 'LanguageID' AND @Order = 'desc' 
					THEN LanguageID END DESC,
				CASE WHEN @Item = 'IsDefault' AND @Order = 'asc' 
					THEN IsDefault END ASC, 
				CASE WHEN @Item = 'IsDefault' AND @Order = 'desc' 
					THEN IsDefault END DESC
		)
		AS RowNum FROM ResponseTemplate
		)
	AS MyDerivedTable
	WHERE MyDerivedTable.RowNum BETWEEN @Start AND @End
	end
GO
