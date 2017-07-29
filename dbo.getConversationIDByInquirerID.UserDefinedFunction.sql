USE [_connector]
GO
/****** Object:  UserDefinedFunction [dbo].[getConversationIDByInquirerID]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION  [dbo].[getConversationIDByInquirerID]
(
	-- Add the parameters for the function here
	@InquirerID int
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @retval int
	-- Add the T-SQL statements to compute the return value here
	SELECT @retval = ConversationID FROM ChatMembers WHERE UserID = @InquirerID

	-- Return the result of the function
	RETURN @retVal

END

GO
