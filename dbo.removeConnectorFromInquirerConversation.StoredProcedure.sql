USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[removeConnectorFromInquirerConversation]    Script Date: 7/28/2017 10:17:13 PM ******/
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
