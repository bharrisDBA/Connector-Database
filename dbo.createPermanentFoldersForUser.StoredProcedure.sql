USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[createPermanentFoldersForUser]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[createPermanentFoldersForUser] 
(
	@UserID int
)
AS
DECLARE
	@count int 
	SELECT @count = 0
IF (@count = 0)
BEGIN
	/* Only create new permanent ones where existing doesn't exist */
	/* Mostly used by import scripts, but leaving because it could be used in new system */

	SELECT @count = COUNT(*) FROM MessagesFolders WHERE FolderName = 'Inbox' AND UserID = @UserID
	If (@count = 0)
	INSERT INTO MessagesFolders (FolderName,UserID,Permanent) VALUES ('Inbox',@UserID,1)

	SELECT @count = COUNT(*) FROM MessagesFolders WHERE FolderName = 'Outbox' AND UserID = @UserID
	If (@count = 0)
	INSERT INTO MessagesFolders (FolderName,UserID,Permanent) VALUES ('Outbox',@UserID,1)

	SELECT @count = COUNT(*) FROM MessagesFolders WHERE FolderName = 'Archives' AND UserID = @UserID
	If (@count = 0)
	INSERT INTO MessagesFolders (FolderName,UserID,Permanent) VALUES ('Archives',@UserID,1)
END
GO
