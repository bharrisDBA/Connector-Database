USE [_connector]
GO
/****** Object:  UserDefinedFunction [dbo].[isAValidEmail]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[isAValidEmail]
(
	-- Add the parameters for the function here
	@Email nvarchar(60)
)
RETURNS varchar(20)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @RetVal int

	-- Add the T-SQL statements to compute the return value here
	select @retVal = count(*) from users where email= @email and (status<>3) and hardbounces=0 and softbounces< 5

	-- Return the result of the function
	RETURN @RetVal

END

GO
