USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[stopUserSession]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[stopUserSession]
(
	@UserID int
)
AS 
BEGIN 
UPDATE UserSessions SET
EndTime = getdate() WHERE
UserID = @UserID AND
UserSessionsID = (SELECT MAX(UserSessionsID) FROM
UserSessions WHERE UserID = @UserID)
END
GO
