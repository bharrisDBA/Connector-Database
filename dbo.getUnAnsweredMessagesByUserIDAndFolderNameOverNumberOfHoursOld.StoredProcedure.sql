USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getUnAnsweredMessagesByUserIDAndFolderNameOverNumberOfHoursOld]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith Sorbo
-- Create date: 7/27/16
-- Description:	Returns un answered messages given userid and foldername over a certain number of days
-- =============================================
CREATE PROCEDURE [dbo].[getUnAnsweredMessagesByUserIDAndFolderNameOverNumberOfHoursOld]
	-- Add the parameters for the stored procedure here
	@Userid int,
	@FolderName nvarchar(32),
	@OverHours int =72
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT conv.conversationid
	,conv.datesent as DateLastReceived
	,inq.InqID as InquirerID
--	,dbo.UDF_PROPER_CASE(uInq.Firstname) as InquirerName
	,(uInq.Firstname) as InquirerName
	,datediff(hour,datesent,getdate()) as HoursAgo
from 
    (select distinct(conversationid), max(dateSent) as DateSent
		from messages m2
		where (fromuserid=@userid or touserid=@userid) and dbo.isConversationUnanswered(conversationid) = 1
		group by conversationid) as conv   
join (select ToUserID as InqID,conversationid from Messages where fromuserid=@userid group by Conversationid,touserid) as inq on inq.ConversationID = conv.conversationid
join users uInq on uInq.userid = inq.InqID
join FolderAssignments on FolderAssignments.ConversationID = conv.ConversationID
join MessagesFolders on MessagesFolders.FolderID = FolderAssignments.FolderID and MessagesFolders.userid= @userid
where  MessagesFolders.FolderName = @FolderName
and datesent < dateadd(hour, @OverHours * -1 ,getdate())
order by datesent desc
END

GO
