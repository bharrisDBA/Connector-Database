USE [_connector]
GO
/****** Object:  UserDefinedFunction [dbo].[LanguageName]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[LanguageName]
(
	-- Add the parameters for the function here
	@LanguageCode nvarChar(2),
	@ThisLanguage nvarChar(2) = 'en'
)
RETURNS nvarChar(30)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @ReturnLang as nvarChar(30)

	-- Add the T-SQL statements to compute the return value here
	select @ReturnLang = languageName from languages where languagecode = @LanguageCode and thisLangcode = @ThisLanguage

	-- Return the result of the function
	RETURN @ReturnLang

END

GO
