USE [_connector]
GO
/****** Object:  UserDefinedFunction [dbo].[getUserTypeID]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith
-- Create date: 1/30/17
-- Description:	Returns the usertypeid for the passed userid
--     function of convenience
-- =============================================
CREATE FUNCTION [dbo].[getUserTypeID](
	-- Add the parameters for the function here
	@userID int
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @UserTypeID int = 0

	-- Add the T-SQL statements to compute the return value here
	SELECT @usertypeid = usertypeid from users where userid = @userid

	-- Return the result of the function
	RETURN @usertypeid

END

GO
