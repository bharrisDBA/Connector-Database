USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getResponseTemplateByID]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getResponseTemplateByID]
(
	@TemplateID int
)
AS 
BEGIN 
SELECT
	TemplateName,
	Subject,
	Content,
	DecisionType,
	LanguageID,
	LanguageName,
	FilterID,
	FilterName,
	Weight,
	IsDefault,
	CreateDate
FROM get_response_template
WHERE TemplateID = @TemplateID
END
GO
