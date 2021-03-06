USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getLanguagesByTag]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getLanguagesByTag]
(
	@TagID int
)
AS
BEGIN
SELECT l_codes.l_id,l_codes.l_code,l_codes.l_lang,l_codes.IsInterfaceLang,l_codes.RightToLeft FROM l_codes INNER JOIN l_text ON l_codes.l_id = l_text.l_code AND l_text.l_tag = @TagID
END
GO
