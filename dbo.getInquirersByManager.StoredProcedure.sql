USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getInquirersByManager]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith
-- Create date: 8/18/16
-- Description:	Returns a list of inquirers for every connector who is under the supervision of this coach or head coach
-- =============================================
Create PROCEDURE [dbo].[getInquirersByManager]
	-- Add the parameters for the stored procedure here
	@ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	select * from get_inquirers_by_con_ID 
		where ConnectorID in 
    		(	select distinct teamassignment.userid from teams
		join teamassignment on TeamAssignment.TeamID = teams.TeamID
		join ManagersHierarchy on ManagersHierarchy.HeadCoachID = teams.HeadCoachID

		where ManagersHierarchy.ManagersID = @ID)
		
END

GO
