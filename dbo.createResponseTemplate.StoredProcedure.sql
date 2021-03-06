USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[createResponseTemplate]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[createResponseTemplate]
(
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
INSERT INTO ResponseTemplate
(
	TemplateName,
	Subject,
	Content,
	DecisionType,
	LanguageID,
	FilterID,
	Weight,
	IsDefault
)
VALUES
(
 	@TemplateName,
	@Subject,
	@Content,
	@DecisionType,
	@LanguageID,
	@FilterID,
	@Weight,
	@IsDefault
)
END
GO
