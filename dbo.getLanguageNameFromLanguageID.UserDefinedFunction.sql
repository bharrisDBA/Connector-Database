USE [_connector]
GO
/****** Object:  UserDefinedFunction [dbo].[getLanguageNameFromLanguageID]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[getLanguageNameFromLanguageID]
(
	-- Add the parameters for the function here
	@LanguageID int,
	@LanguageCode varChar(2)
)
RETURNS nvarchar(50)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @LanguageName nvarchar(50)
	if @languageCode = ''  -- means were are going to return the language name in the language named
	   Begin
		   select @LanguageName = l.LanguageName from l_codes lc 
		   join Languages l  on l.languageCode = lc.l_code and l.thisLangCode = lc.l_code
		   where l_id = @LanguageID
	   end
    else
	   begin
		   select @LanguageName = l.LanguageName from l_codes lc 
		   join Languages l  on l.languageCode = lc.l_code and l.thisLangCode = @LanguageCode
		   where l_id = @LanguageID

	   end

	-- Return the result of the function
	RETURN @LanguageName

END

GO
