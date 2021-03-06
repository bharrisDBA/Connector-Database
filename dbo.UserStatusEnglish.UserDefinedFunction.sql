USE [_connector]
GO
/****** Object:  UserDefinedFunction [dbo].[UserStatusEnglish]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
-- Public Const STATUS_INACTIVE = 1
-- Public Const STATUS_ACTIVE = 2		' Same as Activated
-- Public Const STATUS_DISABLED = 3
-- Public Const STATUS_NOTACTIVATED = 4

CREATE FUNCTION [dbo].[UserStatusEnglish] 
(
	-- Add the parameters for the function here
	@usertype int
)
RETURNS  nVarChar(20)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @StringType nVarChar(20)

	-- Add the T-SQL statements to compute the return value here
	SELECT @StringType = 
		case 
			when @usertype=1 then N'InActive'
			when @usertype=2 then N'Active'
			when @usertype=3 then N'Disabled'	
			when @usertype=4 then N'Not Activated'
			else N'Unknown'
		end
	-- Return the result of the function
	RETURN @stringType

END

GO
