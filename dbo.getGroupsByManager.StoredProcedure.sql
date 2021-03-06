USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getGroupsByManager]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith Sorbo
-- Create date: 7/12/16
-- Description:	Returns a list of group that the teams under this manager have access to.
-- =============================================
CREATE PROCEDURE [dbo].[getGroupsByManager]
	-- Add the parameters for the stored procedure here
	@ManagerID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		select distinct groups.* from teams
		join groupteam on groupteam.teamid=teams.teamid
		join groups on groups.groupid=groupteam.groupid
		join ManagersHierarchy on ManagersHierarchy.HeadCoachID = teams.HeadCoachID
		where ManagersHierarchy.ManagersID = @ManagerID
		order by groups.groupname asc
END

GO
