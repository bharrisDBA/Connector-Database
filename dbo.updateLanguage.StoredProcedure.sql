USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[updateLanguage]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateLanguage]
(
	@ID int,
	@Code nvarchar(5),
	@Name nvarchar(50),
	@Interface bit,
	@Right2Left bit
)
AS
DECLARE
	@count int 
	SELECT @count = 0
	SELECT @count = COUNT(*) FROM l_codes WHERE l_code = @Code AND l_id <> @ID
IF (@count = 0)
BEGIN
UPDATE l_codes SET l_code = @Code, l_lang = @Name, IsInterfaceLang = @Interface, RightToLeft = @Right2Left WHERE l_id = @ID
END
GO
