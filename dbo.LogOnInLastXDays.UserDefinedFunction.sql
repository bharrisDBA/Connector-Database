USE [_connector]
GO
/****** Object:  UserDefinedFunction [dbo].[LogOnInLastXDays]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[LogOnInLastXDays]
(
	-- Add the parameters for the function here
	@userid int,
	@days int
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @TimesLogged  int

	-- Add the T-SQL statements to compute the return value here
	SELECT @timesLogged = count(*)  from usersessions where userid = @userid and datediff(day,starttime,getdate()) <= @days

	-- Return the result of the function
	RETURN @timesLogged

END

GO
