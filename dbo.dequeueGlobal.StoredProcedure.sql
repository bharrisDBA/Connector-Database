USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[dequeueGlobal]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dequeueGlobal]
(
	@UserID int
)
AS
BEGIN
DELETE FROM GlobalQueue WHERE UserID = @UserID
END
GO
