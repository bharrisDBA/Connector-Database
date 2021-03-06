USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getInquireFromTempQueue]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith Sorbo
-- Create date: 8/1/16
-- Description:	gets inquirer info from temp quuee
-- =============================================
CREATE PROCEDURE [dbo].[getInquireFromTempQueue]
	@UserID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT  [TempQueueID]
      ,[Type]
      ,[InquirerID]
      ,[QueueDate]
      ,[DateInserted]
      ,[TeamID]
      ,[ConnectorID]
      ,[Comments]
      ,[GroupID]
  FROM [_connector].[dbo].[TempQueue]
  where inquirerid= @UserID
END

GO
