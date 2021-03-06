USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[moveConversationToConnectorsInbox]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith
-- Create date: 1/23/17
-- Description:	Move Conversation to Connector's inbox
-- =============================================
CREATE PROCEDURE [dbo].[moveConversationToConnectorsInbox]
	-- Add the parameters for the stored procedure here
	@ConvID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- if from the connector then do nothing assumes a check before calling this script
	-- if from the inquirer then move it back to the connector's inbox
	declare @ConnID int = 0
	declare @ConnInboxid int = 0

	-- get the connector id in this conversation
	select distinct @connid = u.userid from messages m
	join users u on (u.userid=m.ToUserID or u.userid=m.FromUserID)
	where u.usertypeid>100 and m.ConversationID = @convid

	-- get the connector's inbox id
	select @ConnInboxid = folderid from MessagesFolders where userid = @ConnID and foldername='Inbox'

	if @ConnID > 0 and @ConnInboxid >0 
	begin 
		--move to Connector's inbox
		update FolderAssignments set folderid = @conninboxid where ConversationID = @convid and folderid in ( select folderid from MessagesFolders where userid=@ConnID)
	end
END

GO
