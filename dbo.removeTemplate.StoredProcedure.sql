USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[removeTemplate]    Script Date: 8/16/2017 8:45:18 PM ******/
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
