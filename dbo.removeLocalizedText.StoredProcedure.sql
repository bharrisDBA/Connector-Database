USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[removeLocalizedText]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[removeLocalizedText]
(
	@ID int
)
AS
BEGIN
DELETE FROM l_text WHERE l_text_id = @ID
END
GO
