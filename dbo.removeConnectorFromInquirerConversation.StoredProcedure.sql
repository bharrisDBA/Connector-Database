USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[removeConnectorFromInquirerConversation]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[removeConnectorFromInquirerConversation] 
(
	@UserID int,
	@ConversationID int
)
AS
BEGIN
	DELETE FROM ChatMembers
	WHERE ConversationID = @ConversationID AND
	UserID = @UserID
END
GO
