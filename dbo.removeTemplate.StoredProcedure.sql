USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[removeTemplate]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[removeTemplate]
(
	@TemplateID int
)
AS
BEGIN
	DELETE FROM ResponseTemplate WHERE TemplateID = @TemplateID
END

GO
