USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[removeInquirerExtension]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[removeInquirerExtension]
(
	@UserID int
)
AS
BEGIN
DELETE FROM InquirerExtension WHERE UserID = @UserID
END
GO
