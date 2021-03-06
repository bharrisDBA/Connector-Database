USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[createLanguage]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[createLanguage]    Script Date: 8/10/2015 1:03:26 PM ******/
CREATE PROCEDURE [dbo].[createLanguage]
(
	@Code nvarchar(5),
	@Name nvarchar(50),
	@Interface bit,
	@Right2Left bit
)
AS
DECLARE
	@count int 
	SELECT @count = 0
	SELECT @count = COUNT(*) FROM l_codes WHERE l_code = @Code
IF (@count = 0)
BEGIN
INSERT INTO l_codes
(
	l_code,
	l_lang,
	IsInterfaceLang,
	RightToLeft
)
VALUES
(
	@Code,
	@Name,
	@Interface,
	@Right2Left
)
END
GO
