USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getInquirerFromTempQueueHavingSavedDraft]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith Sorbo
-- Create date: 8/1/16
-- Description:	Gets an inquirer from the Temp queue who also has an entry in the emaildraft table
-- =============================================
CREATE PROCEDURE [dbo].[getInquirerFromTempQueueHavingSavedDraft]
	@UserID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	/****** Script for SelectTopNRows command from SSMS  ******/
SELECT  [TempQueueID]
      ,[Type]
      ,tempqueue.[InquirerID]
      ,[QueueDate]
      ,[DateInserted]
      ,[TeamID]
      ,[ConnectorID]
      ,[Comments] as CoachComments
      ,[GroupID]
	  ,ConversationID
	  ,LastTime
	  ,DraftText
  FROM [_connector].[dbo].[TempQueue]
  join emailDrafts on emailDrafts.InquirerID=TempQueue.InquirerID
  where tempqueue.inquirerid=@UserID
END

GO
