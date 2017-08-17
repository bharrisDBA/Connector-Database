USE [_connector]
GO
/****** Object:  UserDefinedFunction [dbo].[getLastRecipientInConversation]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith
-- Create date: 5/11/17
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[getLastRecipientInConversation]
(
	-- Add the parameters for the function here
	@ConversationID int
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Recipient int
	-- Add the T-SQL statements to compute the return value here
	SELECT  top 1  @Recipient=toUserID from messages m
		join users u on u.userid=m.touserid
		where conversationid=@ConversationID
		order by DateSent desc

	-- Return the result of the function
	RETURN @Recipient

END

GO
