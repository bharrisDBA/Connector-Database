USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[removeLanguage]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[removeLanguage]
(
	@ID int
)
AS
BEGIN
DELETE FROM l_codes WHERE l_id = @ID
END
GO
