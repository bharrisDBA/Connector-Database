USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[deleteDraft]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deleteDraft]
(
	@UserID int,
	@ConversationID int
)
AS
BEGIN
	DELETE FROM EmailDrafts WHERE UserID = @UserID AND ConversationID = @ConversationID;
END
GO
