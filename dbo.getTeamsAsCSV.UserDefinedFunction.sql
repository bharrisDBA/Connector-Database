USE [_connector]
GO
/****** Object:  UserDefinedFunction [dbo].[getTeamsAsCSV]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[getTeamsAsCSV]
(
	@userid int
)
RETURNS nvarchar(200)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @ret nvarchar(200) = ''

	-- Add the T-SQL statements to compute the return value here
	

	select @ret = coalesce(@ret + ', ','') + teamname from teamassignment ta
	join teams t on t.teamid=ta.teamid
	where userid = @userid
	set @ret = substring(@ret,3,len(@ret))


	-- Return the result of the function
	RETURN @ret

END

GO
