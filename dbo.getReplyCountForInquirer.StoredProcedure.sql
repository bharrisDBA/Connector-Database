USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getReplyCountForInquirer]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getReplyCountForInquirer] 
(
	@UserID int
)
AS
BEGIN
	SELECT Count(*) As ResultCount FROM Messages 
	LEFT JOIN Conversation 
	ON Messages.ConversationID = Conversation.ConversationID
	WHERE ToUserID = @UserID
END

GO
