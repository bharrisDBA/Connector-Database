USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getGroupsByHeadCoach]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith Sorbo
-- Create date: 7/12/16
-- Description:	Return a list of groups which can be seen by teams under this head coach
-- =============================================
CREATE PROCEDURE [dbo].[getGroupsByHeadCoach]
	-- Add the parameters for the stored procedure here
	@HeadCoach int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select distinct groups.groupid,groups.Groupname,groups.groupdescription from teams
		join groupteam on groupteam.teamid=teams.teamid
		join groups on groups.groupid=groupteam.groupid
		where teams.headcoachID = @HeadCoach
		order by groups.groupname asc
END

GO
