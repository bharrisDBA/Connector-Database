USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getConversationIDForInquirer]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getConversationIDForInquirer] 
(
	@UserID int
)
AS
BEGIN
	SELECT ConversationID As ResultCount FROM ChatMembers WHERE UserID = @UserID
END

GO
