USE [_connector]
GO
/****** Object:  UserDefinedFunction [dbo].[UserTeams]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[UserTeams]
(
	-- Add the parameters for the function here
	@UserID int
)
RETURNS varchar(300)
AS
BEGIN
	declare @Teams varchar(1000)
	select @teams = coalesce(@teams,'') + teamname + ';' from TeamAssignment ta
	join teams t on t.teamid=ta.TeamID
	where ta.userid = @userid;
	return @teams;
	

END

GO
