USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[dequeueGroup]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dequeueGroup]
(
	@UserID int
)
AS
BEGIN
DELETE FROM GroupQueue WHERE UserID = @UserID
END
GO
