USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[queueGlobal]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[queueGlobal]
(
	@UserID int,
	@CreateDate datetime = NULL
)
AS
DECLARE
	@QueueDate datetime,
	@count int 
	SELECT @count = 0
	SELECT @count = COUNT(*) FROM GlobalQueue WHERE UserID = @UserID
IF (@count = 0)
BEGIN
	IF (@CreateDate IS NULL)
		SET @QueueDate = getdate()
	ELSE
		SET @QueueDate = @CreateDate
INSERT INTO GlobalQueue
(
	UserID,
	CreateDate
)
VALUES
(
	@UserID,
	@QueueDate
)
END
GO
