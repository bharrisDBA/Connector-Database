USE [_connector]
GO
/****** Object:  UserDefinedFunction [dbo].[DateOfLastMessageInConversation]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	Date of last message in conversation
-- =============================================
CREATE FUNCTION [dbo].[DateOfLastMessageInConversation]
(
	-- Add the parameters for the function here
	@ConvID int
)
RETURNS datetime
AS
BEGIN
	-- Declare the return variable here
	DECLARE @retval datetime

	-- Add the T-SQL statements to compute the return value here
	select top 1 @retval = datesent from messages where conversationid = @convid order by datesent desc 

	-- Return the result of the function
	RETURN @retval
END

GO
