USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[updateResponseTemplate]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateResponseTemplate]
(
	@TemplateID int,
	@TemplateName nvarchar(64),
	@Subject nvarchar(64),
	@Content nvarchar(max),
	@DecisionType int,
	@LanguageID int,
	@FilterID int= NULL,
	@Weight int,
	@IsDefault bit
)
AS 
BEGIN 
UPDATE ResponseTemplate
SET
	TemplateName = @TemplateName,
	Subject = @Subject,
	Content = @Content,
	DecisionType = @DecisionType,
	LanguageID = @LanguageID,
	FilterID = @FilterID,
	Weight = @Weight,
	IsDefault = @IsDefault
WHERE TemplateID = @TemplateID
END
GO
