USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getUnAnsweredMessagesByUserIDAndFolderName]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith Sorbo
-- Create date: 7/27/16
-- Description:	Returns un answered messages given userid and foldername
-- =============================================
CREATE PROCEDURE [dbo].[getUnAnsweredMessagesByUserIDAndFolderName]
	@Userid int,
	@FolderName nvarchar(32)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

select cm.ConversationID
	,cn.LastMessageDate as DateLastReceived
	,cn.LastAuthorID as InquirerID
	,u.firstname as InquirerName
	,datediff(hour,LastMessageDate,getdate()) as HoursAgo	
	
from ChatMembers cm
join conversation cn on cn.ConversationID = cm.conversationid
join users u on u.userid = cn.LastAuthorID
join FolderAssignments fa on fa.ConversationID = cm.ConversationID
join MessagesFolders mf on mf.FolderID = fa.FolderID  and mf.UserID = @Userid

where cm.userid = @Userid and cn.LastAuthorID<> cm.userid and mf.FolderName like @foldername
order by cn.LastMessageDate
END

GO
