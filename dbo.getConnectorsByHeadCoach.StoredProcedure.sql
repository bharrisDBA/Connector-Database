USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getConnectorsByHeadCoach]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith Sorbo
-- Create date: 7/12/16
-- Description:	Returns a list of all connectors on teams supervised by this headcoach
-- =============================================
CREATE PROCEDURE [dbo].[getConnectorsByHeadCoach]
	-- Add the parameters for the stored procedure here
	@HeadCoachID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select distinct users.* from teams
		join teamassignment on TeamAssignment.TeamID = teams.TeamID
		join users on users.UserID = TeamAssignment.UserID
		where headcoachid = @HeadCoachID
		order by users.lastname
END

GO
