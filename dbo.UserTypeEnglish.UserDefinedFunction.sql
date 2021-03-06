USE [_connector]
GO
/****** Object:  UserDefinedFunction [dbo].[UserTypeEnglish]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith
-- Create date: 12/6/16
-- Description:	Returns a lookup from usertypes 
-- =============================================
CREATE FUNCTION [dbo].[UserTypeEnglish]
(
	-- Add the parameters for the function here
	@UserTypeID int
)
RETURNS varchar(30)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @stringtype varchar(30)

	-- Add the T-SQL statements to compute the return value here
	SELECT @stringtype = TypeName from userTypes where typeid=@usertypeid

	-- Return the result of the function
	RETURN @stringtype

END

GO
