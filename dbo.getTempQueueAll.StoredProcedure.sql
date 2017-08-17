USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getTempQueueAll]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getTempQueueAll]
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
      ,FirstContactURL
	  ,TempQueue.Comments
	  ,GroupID
      ,DecisionToday,
    concat(connectors.firstname	,' ',Connectors.LastName) as ConnectorName,
	concat(inquirers.firstname,' ',inquirers.lastname) as InquirerName	 
	from get_Temp_Queue as TempQueue
	join users as Connectors on Connectors.UserID = TempQueue.ConnectorID
	join users as Inquirers on Inquirers.userid=TempQueue.InquirerID
END

GO
