USE [_connector]
GO
/****** Object:  UserDefinedFunction [dbo].[TeamsCoached]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith
-- Create date: 12/8/16
-- Description:	Returns a string containing all the teams coached by this person
-- =============================================
CREATE FUNCTION [dbo].[TeamsCoached]
(
	-- Add the parameters for the function here
	@UserID int
)
RETURNS varchar(300)
AS
BEGIN
	declare @Teams varchar(1000)
	select @teams = coalesce(@teams,'') + teamname + '; ' from  teams t 
		where t.TeamCoachID = @userid order by t.TeamName;
	return @teams;
	

END

GO
