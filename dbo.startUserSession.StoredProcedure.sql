USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[startUserSession]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[startUserSession]
(
	@UserID int
)
AS 
BEGIN 
INSERT INTO UserSessions
(
	UserID
)
VALUES
(
 	@UserID
)
END
GO
