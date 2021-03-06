USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getActiveConnectors]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getActiveConnectors]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select distinct users.* from TeamAssignment
	join teams on teams.TeamID = TeamAssignment.TeamID
	join users on users.Userid = TeamAssignment.userid
	where status = 2
	order by lastname,firstname
END

GO
