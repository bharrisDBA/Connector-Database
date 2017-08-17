USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getUnreadInBoxMessagesByUserID]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith Sorbo
-- Create date: 7/27/17
-- Description:	Returns Name and date of all unread messages in the inbox of user
-- =============================================
CREATE PROCEDURE [dbo].[getUnreadInBoxMessagesByUserID]
	-- Add the parameters for the stored procedure here
	@UserId int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select users.FirstName, max(messages.DateSent) as latestMessage from messages
		join Conversation on Conversation.ConversationID = messages.ConversationID
		join FolderAssignments on FolderAssignments.ConversationID = Conversation.ConversationID
		join MessagesFolders on MessagesFolders.FolderID = FolderAssignments.FolderID and MessagesFolders.UserID = @UserId
		join Users on users.UserID = messages.FromUserID
		where messageRead = 0 and MessagesFolders.FolderName = 'Inbox' 
		and messages.ToUserID =  @UserID
		group by users.firstname,conversation.ConversationID
END

GO
