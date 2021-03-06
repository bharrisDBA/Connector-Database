USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[queueGroup]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[queueGroup]
(
	@UserID int,
	@GroupID int,
	@CreateDate datetime = NULL
)
AS
DECLARE
	@QueueDate datetime,
	@count int 
	SELECT @count = 0
	SELECT @count = COUNT(*) FROM GroupQueue WHERE UserID = @UserID

IF (@CreateDate IS NULL)
	SET @QueueDate = getdate()
ELSE
	SET @QueueDate = @CreateDate

IF (@count = 0)
INSERT INTO GroupQueue
(
	UserID,
	GroupID,
	CreateDate
)
VALUES
(
	@UserID,
	@GroupID,
	@QueueDate
)
ELSE
	UPDATE GroupQueue SET GroupID = @GroupID WHERE UserID = @UserID
GO
