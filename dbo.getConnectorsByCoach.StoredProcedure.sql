USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getConnectorsByCoach]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith Sorbo
-- Create date: 7/12/16
-- Description:	Returns all connectors under this coach
-- =============================================
CREATE PROCEDURE [dbo].[getConnectorsByCoach]
	-- Add the parameters for the stored procedure here
	@CoachID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select distinct users.* from teams
	join TeamAssignment on TeamAssignment.TeamID = teams.TeamID
	join users on users.userid = TeamAssignment.userid
	where users.status = 2 and teamcoachid = @CoachID
	order by lastname,firstname
END

GO
