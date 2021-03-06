USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getFolderIDByNameAndID]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getFolderIDByNameAndID] 
(
	@UserID int,
	@FolderName nvarchar(255)
)
AS
BEGIN
	SELECT 
		FolderID AS ResultCount
	FROM MessagesFolders 
	WHERE FolderName= @FolderName AND UserID = @UserID
END
GO
