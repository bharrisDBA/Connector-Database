USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getInquirersInGroupsByConnectorAndHoursOnQueue]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith Sorbo
-- Create date: 7/17/16
-- Description:	Returns the list of Inquirers available to a Connector with number of Hours on the queue
-- =============================================
CREATE PROCEDURE [dbo].[getInquirersInGroupsByConnectorAndHoursOnQueue]
	-- Add the parameters for the stored procedure here
	@ConnectorID int,
	@HoursOld int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select distinct GroupQueue.UserID as InquirerID,connectors.usertypeid,connectors.email,Inquirers.Gender as InquirerGender,
		Connectors.Gender as ConnectorGender,
		CreateDate,
		TeamAssignment.userid as ConnectorID,
		datediff(hour,CreateDate,getdate()) as HoursInQueue
		from groupQueue
		join GroupTeam on GroupTeam.groupid=groupQueue.GroupID
		join TeamAssignment on TeamAssignment.TeamID = GroupTeam.TeamID
		join users as Connectors on Connectors.userid = teamassignment.userid
		join users as Inquirers on Inquirers.userid = groupqueue.userid
		where teamassignment.userid=@ConnectorID and 
		datediff(hour,CreateDate,getdate()) > @HoursOld
		and (connectors.usertypeid>250 or (connectors.usertypeid <= 250 and inquirers.gender = connectors.gender))

END

GO
