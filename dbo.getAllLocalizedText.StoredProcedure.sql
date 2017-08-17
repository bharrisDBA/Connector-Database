USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getAllLocalizedText]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getAllLocalizedText]
AS
BEGIN
SELECT
	code, tag, text, textID, languageID,  tagID, language
FROM get_localized_text
END
GO
