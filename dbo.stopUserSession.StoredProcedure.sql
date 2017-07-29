USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[stopUserSession]    Script Date: 7/28/2017 10:17:13 PM ******/
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
