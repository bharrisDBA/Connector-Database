USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[createPermanentFolder]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[createPermanentFolder] 
(
	@UserID int,
	@FolderName nvarchar(255)
)
AS
BEGIN
	INSERT INTO MessagesFolders 
	(
		FolderName, 
		UserID, 
		Permanent
	) OUTPUT Inserted.FolderID AS ResultCount
	VALUES
	(
		@FolderName,
		@UserID,
		1
	)
END
GO
