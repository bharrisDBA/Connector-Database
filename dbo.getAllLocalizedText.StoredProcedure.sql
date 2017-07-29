USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getAllLocalizedText]    Script Date: 7/28/2017 10:17:13 PM ******/
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
