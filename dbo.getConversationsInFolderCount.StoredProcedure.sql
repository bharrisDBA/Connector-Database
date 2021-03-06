USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getConversationsInFolderCount]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getConversationsInFolderCount] 
(
	@FolderID int
)
AS
BEGIN
	SELECT COUNT(FolderAssignmentsID) As ResultCount 
	FROM FolderAssignments WHERE FolderID = @FolderID
END
GO
