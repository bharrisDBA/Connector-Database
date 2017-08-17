USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getLastLogin]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getLastLogin]
(
	@UserID int
)
AS 
BEGIN 
SELECT StartTime FROM UserSessions WHERE
UserID = @UserID AND
UserSessionsID = (SELECT MAX(UserSessionsID) FROM
UserSessions WHERE UserID = @UserID)
END
GO
