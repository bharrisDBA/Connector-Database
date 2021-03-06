USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getChatMessages]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getChatMessages]
(
	@conversationID int
)
AS
BEGIN
	SELECT TOP 7 
		ChatMessages.Message, 
		ChatMessages.UserFrom, 
		ChatMessages.DateTimeSent, 
		Users.FirstName, 
		Users.UserID 
	FROM ChatMessages 
	INNER JOIN Users ON UserFrom=UserID 
	WHERE ConversationID = @conversationID 
	ORDER BY DateTimeSent DESC
END
GO
