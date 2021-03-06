USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[ImportLegacyConversation]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith Sorbo
-- Create date: 8/15/16
-- Description:	Imports all the information needed to transfer a single conversation from the Legacy DB
-- =============================================
CREATE PROCEDURE [dbo].[ImportLegacyConversation]
	-- Add the parameters for the stored procedure here
	 @ConvID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT folderconversation.conversationid, folder.userid as folderOwnerID,folder.foldername,folder.foldertype,folderconversation.[folderid] as FolderConversationDI
      ,messages.userid,messages.messageid,messages.datesent,messages.subject,messages.body
  FROM [legacy].[dbo].[conversations] 
  join [legacy].[dbo].[folderconversation] on conversations.conversationid = folderconversation.conversationid
  join [legacy].[dbo].[folder] on folder.folderid = folderconversation.folderid
  join [legacy].[dbo].[messages] on messages.conversationid = conversations.conversationid
  where conversations.conversationid = @ConvID

  order by folderconversation.conversationid asc ,messages.datesent  asc
END

GO
