USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getConversationCountByID]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getConversationCountByID] 
(
	@UserID int
)
AS
BEGIN
	SELECT Count(*) As ResultCount 
	FROM Conversation 
	INNER JOIN ChatMembers ON Conversation.ConversationID=ChatMembers.ConversationID 
	WHERE UserID = @UserID AND Conversation.ConversationTypeID = 1
END

GO
