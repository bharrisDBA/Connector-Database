USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getConversationsForConnector]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith Sorbo
-- Create date: 7/19/16
-- Description:	Returns messages for a connector sorted by Folder and conversation
-- =============================================
CREATE PROCEDURE [dbo].[getConversationsForConnector]
	-- Add the parameters for the stored procedure here
	@ConnectorID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [MessageID],[FromUserID],messages.[ConversationID],[Subject],[Message],[DateSent],[MessageRead],[ToUserID]
	  , (select top 1 FromUserID  from messages m2 where m2.conversationid=messages.conversationid order by datesent desc) as lastAuthor
	  ,MessagesFolders.FolderName
  FROM [_connector].[dbo].[Messages]
  join FolderAssignments on FolderAssignments.ConversationID = messages.ConversationID
  join MessagesFolders on MessagesFolders.folderid = FolderAssignments.FolderID
  where fromUserID = @ConnectorID or TouserID=@ConnectorID and MessagesFolders.UserID = @ConnectorID
   order by MessagesFolders.Permanent desc,MessagesFolders.FolderName, messages.conversationid desc ,datesent desc

END

GO
