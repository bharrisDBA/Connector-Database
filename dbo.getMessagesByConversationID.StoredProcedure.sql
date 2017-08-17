USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getMessagesByConversationID]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getMessagesByConversationID] 
(
	@ConversationID int
)
AS
BEGIN
	SELECT 
		MessageID,
		FromUserID,
		ToUserID,
		ConversationID,
		Subject,
		Message,
		MessageRead,
		DateSent 
	FROM Messages 
	WHERE ConversationID = @ConversationID ORDER BY MessageID DESC
END

GO
