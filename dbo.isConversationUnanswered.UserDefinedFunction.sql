USE [_connector]
GO
/****** Object:  UserDefinedFunction [dbo].[isConversationUnanswered]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith
-- Create date: 1/31/17
-- Description:	 return 1 if unanswered or 0 if answered - answered means a non-inquirer sent the last messsage
-- =============================================
CREATE FUNCTION [dbo].[isConversationUnanswered]
(
	-- Add the parameters for the function here
	@ConversationID int
)
RETURNS Int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Unanswered int = 1

	-- Add the T-SQL statements to compute the return value here
	select top 1 @unanswered = (case when u.usertypeid=100 then 0 else 1 end)  from messages m
		join users u on u.userid=m.touserid
		where conversationid=@conversationid
		order by DateSent desc

	-- Return the result of the function
	RETURN @Unanswered

END

GO
