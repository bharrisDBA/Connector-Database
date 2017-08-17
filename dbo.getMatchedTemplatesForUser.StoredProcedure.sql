USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getMatchedTemplatesForUser]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getMatchedTemplatesForUser]
(
	@UserID int
)
AS
BEGIN
	SELECT
	/*
		TemplateID,
  		TemplateName,
  		Subject,
  		Content,
  		DecisionType,
		LanguageID,
  		FilterID,
		Weight,
		IsDefault,
		CreateDate,*/
	Data,
	FormFieldData,
	FormFieldID,
	FilterID
	FROM get_filters_by_user_form_data WHERE UserID = @UserID AND
	CHARINDEX(',' + Data + ',', ',' + FormFieldData + ',',1) > 0
	end

GO
