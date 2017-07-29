USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getFolderInformation]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getFolderInformation] 
(
	@FolderID int
)
AS
BEGIN
	SELECT 
		FolderID, 
		FolderName, 
		UserID 
	FROM MessagesFolders WHERE FolderID = @FolderID
END
GO
