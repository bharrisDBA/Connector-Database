USE [_connector]
GO
/****** Object:  UserDefinedFunction [dbo].[TeamsHeadCoached]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith
-- Create date: 12/8/16
-- Description:	Returns a string containing all the teams headcoached by this person
-- =============================================
CREATE FUNCTION [dbo].[TeamsHeadCoached]
(
	-- Add the parameters for the function here
	@UserID int
)
RETURNS varchar(300)
AS
BEGIN
	declare @Teams varchar(1000)
	select @teams = coalesce(@teams,'') + teamname + '; ' from  teams t 
		where t.HeadCoachID= @userid order by t.TeamName;
	return @teams;
	

END

GO
