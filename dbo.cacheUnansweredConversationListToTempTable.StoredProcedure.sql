USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[cacheUnansweredConversationListToTempTable]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith
-- Create date: 1/31/17
-- Description:	Creates an #unanswered temp table with a list of unanswsered
-- =============================================
CREATE PROCEDURE [dbo].[cacheUnansweredConversationListToTempTable]
	-- Add the parameters for the stored procedure here
	@LastYear varchar(4) = 2013
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


IF  OBJECT_ID('tmpunanswered', 'U') IS NOT NULL
    DROP TABLE tmpunanswered
	create table tmpunanswered(conversationid int,connectorid int,inquirerid int,datesent datetime)

	insert into tmpunanswered (conversationid)
	select  conversationid  from messages 
	 where dbo.isConversationUnanswered(conversationid)=1 and dbo.getconnectorsconversationfoldername(conversationid)='Inbox'
	  and 
	 datesent>@lastyear
	 group by conversationid

	 update ua set ua.datesent = m.maxdatesent
		from tmpunanswered ua
		join (select conversationid,max(datesent) as maxdatesent from messages group by conversationid) m on m.ConversationID = ua.conversationid

	update ua set ua.connectorid = u.FromUserID
		from tmpunanswered ua
		join (select fromuserid,conversationid from messages m join users u on u.userid=m.fromuserid where usertypeid>100) u on u.conversationid=ua.conversationid

	update ua set ua.inquirerid = u.Touserid
		from tmpunanswered ua
		join (select ToUserid,conversationid from messages m join users u on u.userid=m.fromuserid where usertypeid>100) u on u.conversationid=ua.conversationid
	
	--select * from tmpunanswered
END

GO
