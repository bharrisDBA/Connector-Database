USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getTempQueueByManager]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith Sorbo
-- Create date: 7/14/16
-- Description:	Returns Inquires from TempQueue assigned to connectors under this manager
-- =============================================
CREATE PROCEDURE [dbo].[getTempQueueByManager]
	-- Add the parameters for the stored procedure here
	 @SupervisorID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select 
		   [DateInserted]
      ,[QueueDate]
      ,[InquirerID]
      ,[Type]
      ,inquirers.FirstName
      ,inquirers.LastName
      ,inquirers.Gender
      ,inquirers.PreferredLanguage
      ,inquirers.UserID
      ,inquirers.CountryCode
	  ,GroupID
	  ,TempQueue.Comments
      ,FirstContactURL
      ,DecisionToday,
    concat(connectors.firstname	,' ',Connectors.LastName) as ConnectorName,
	concat(inquirers.firstname,' ',inquirers.lastname) as InquirerName	 
	from get_temp_queue as TempQueue
	join users as Connectors on Connectors.UserID = TempQueue.ConnectorID
	join users as Inquirers on Inquirers.userid=TempQueue.InquirerID
		where tempQueue.ConnectorID = @SupervisorID OR
		TempQueue.ConnectorID in 
		(select distinct users.userid from TeamAssignment
		join teams on teams.TeamID = TeamAssignment.TeamID
		join users on users.Userid = TeamAssignment.userid
		join ManagersHierarchy on ManagersHierarchy.HeadCoachID = teams.HeadCoachID
		where status = 2 and ManagersHierarchy.ManagersID = @SupervisorID)
		order by connectors.lastname,connectors.firstname
END

GO
