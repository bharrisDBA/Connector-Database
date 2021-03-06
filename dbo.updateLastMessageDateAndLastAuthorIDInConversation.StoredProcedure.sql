USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[updateLastMessageDateAndLastAuthorIDInConversation]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith
-- Create date: 5/4/17
-- Description:	Sets lastmessagedate and last author id for a conversation
-- =============================================
CREATE PROCEDURE [dbo].[updateLastMessageDateAndLastAuthorIDInConversation]
	@ConvId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
update conversation 
   set LastAuthorID =	  dbo.getlastauthorinconversation(conversationid)
	   ,LastRecipientID = dbo.getlastrecipientinconversation(conversationid)
		,LastMessagedate = dbo.DateOfLastMessageInConversation(conversationid)
		where conversationid = @ConvId
END

GO
