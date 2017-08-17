USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getLocalizedTextByTagID]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getLocalizedTextByTagID]
(
	@ID int
)
AS
BEGIN
SELECT
	code, tag, text, textID, languageID,  tagID, language
FROM get_localized_text WHERE tagID = @ID
END
GO
