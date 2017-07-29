USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[createLocalizedText]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[createLocalizedText]
(
	@LanguageID int,
	@TagID int,
	@Text nvarchar(max)
)
AS
DECLARE
	@count int 
	SELECT @count = 0
	SELECT @count = COUNT(*) FROM l_text WHERE l_tag = @TagID AND l_code = @LanguageID
IF (@count = 0)
BEGIN
INSERT INTO l_text
(
	l_tag,
	l_code,
	l_text
)
VALUES
(
	@TagID,
	@LanguageID,
	@Text
)
END
GO
