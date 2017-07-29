USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[updateLocalizedTextByID]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateLocalizedTextByID]
(
	@ID int,
	@LanguageID int,
	@TagID int,
	@Text nvarchar(max)
)
AS
BEGIN
UPDATE l_text SET l_tag = @TagID, l_code = @LanguageID, l_text = @Text WHERE l_text_id = @ID
END
GO
