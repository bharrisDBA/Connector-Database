USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[updateLocalizedText]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateLocalizedText]
(
	@LanguageID int,
	@TagID int,
	@Text nvarchar(max)
)
AS
BEGIN
UPDATE l_text SET l_text=@Text WHERE l_tag=@TagID AND l_code=@LanguageID
END
GO
