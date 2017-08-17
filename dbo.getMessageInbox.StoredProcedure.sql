USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getMessageInbox]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getMessageInbox] 
(
	@ConnectorID int
)
AS
BEGIN
	SELECT
		UserID,
		UserName,
		FirstName,
		LastName,
		DateCreated,
		NickName,
		FromUserID,
		Subject,
		Message,
		DateSent,
		MessageRead,
		ConversationID
	FROM get_messages
	WHERE DateSent IN (
    SELECT MAX(DateSent)
    FROM dbo.Messages WHERE ToUserID = @ConnectorID 
    GROUP BY ConversationID
) ORDER BY DateSent DESC
END

GO
