USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getConnectorsbyManager]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith Sorbo
-- Create date: 7/12/16
-- Description:	Returns a list of team members/connectors 
--     who are on teams supervised by headcoaches under this manager
-- =============================================
CREATE PROCEDURE [dbo].[getConnectorsbyManager]
	-- Add the parameters for the stored procedure here
	@ManagerID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		select distinct users.* from teams
		join teamassignment on TeamAssignment.TeamID = teams.TeamID
		join ManagersHierarchy on ManagersHierarchy.HeadCoachID = teams.HeadCoachID
		join users on users.UserID = TeamAssignment.UserID
		where ManagersHierarchy.ManagersID = @ManagerID
		order by users.lastname
END

GO
