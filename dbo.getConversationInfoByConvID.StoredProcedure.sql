USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getConversationInfoByConvID]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith Sorbo
-- Create date: 7/21/16
-- Description:	Returns 1 record containing information about a specified conversation
-- =============================================
CREATE PROCEDURE [dbo].[getConversationInfoByConvID]
	-- Add the parameters for the stored procedure here
	@ConvID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT top (1) [MessageID],[FromUserID],messages.[ConversationID],[Subject],[Message],[DateSent],[MessageRead],[ToUserID]
      , (select top 1 FromUserID from messages m2 where m2.conversationid=messages.conversationid order by datesent desc) as lastAuthor
	  , Users.NickName, Users.FirstName, Users.LastName, Users.UserName
  FROM [_connector].[dbo].[Messages]
  join users on messages.FromUserID = users.UserID
  where messages.ConversationID = @ConvID
    order by messages.DateSent desc
END

GO
