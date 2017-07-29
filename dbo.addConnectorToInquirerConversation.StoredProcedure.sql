USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[addConnectorToInquirerConversation]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addConnectorToInquirerConversation] 
(
	@UserID int,
	@ConversationID int
)
AS
DECLARE
	@count int 
	SELECT @count = 0
	SELECT @count = COUNT(*) FROM ChatMembers WHERE ConversationID = @ConversationID
	AND UserID = @UserID
IF (@count = 0)
BEGIN
INSERT INTO ChatMembers 
(
	ConversationID, 
	UserID
) 
VALUES 
(
	@ConversationID,
	@UserID
)
END
GO
