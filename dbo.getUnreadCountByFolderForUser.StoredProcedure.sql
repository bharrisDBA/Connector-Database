USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getUnreadCountByFolderForUser]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith
-- Create date: 10/31/16
-- Description:	returns a dataset of foldernames and unread messages in each folder
-- =============================================
CREATE PROCEDURE [dbo].[getUnreadCountByFolderForUser]
	-- Add the parameters for the stored procedure here
	@UserID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	/****** Script for SelectTopNRows command from SSMS  ******/
SELECT mf.foldername,count(*) as unread
  FROM [_connector].[dbo].[Messages] m
  join FolderAssignments fa on fa.ConversationID = m.ConversationID
  join MessagesFolders mf on mf.FolderID = fa.FolderID
  where touserid = @userID and messageread = 0
  group by mf.FolderName
END

GO
