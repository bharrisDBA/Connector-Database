USE [_connector]
GO
/****** Object:  UserDefinedFunction [dbo].[getLastAuthorInConversation]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[getLastAuthorInConversation]
(
	-- Add the parameters for the function here
	@ConversationID int
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @author int
	-- Add the T-SQL statements to compute the return value here
	SELECT  top 1  @author=FromUserID from messages m
		join users u on u.userid=m.touserid
		where conversationid=@ConversationID
		order by DateSent desc

	-- Return the result of the function
	RETURN @author

END

GO
