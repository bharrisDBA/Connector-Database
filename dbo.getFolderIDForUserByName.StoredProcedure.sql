USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getFolderIDForUserByName]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getFolderIDForUserByName]
(
	@UserID int,
	@FolderName nvarchar(255)
)
AS
DECLARE
	@FolderID int

	SELECT @FolderID = 0

	SELECT @FolderID = FolderID FROM MessagesFolders WHERE FolderName = @FolderName AND UserID = @UserID
IF (@FolderID = 0)
BEGIN
	DECLARE
	@IsPermanent int

	SELECT @IsPermanent = 0

	IF (@FolderName = 'Archives' OR @FolderName = 'Outbox' OR @FolderName = 'Inbox')
	BEGIN
		SELECT @Ispermanent = 1
	END

	/* Insert folder, and output new id */
	INSERT INTO MesssagesFolders
	(
		UserID,
		FolderName,
		Permanent
	) OUTPUT FolderID As ResultCount VALUES
	(
		@UserID,
		@FolderName,
		@IsPermanent
	)
END
ELSE
	SELECT @FolderID As ResultCount
GO
