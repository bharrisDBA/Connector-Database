USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[startUserSession]    Script Date: 8/16/2017 8:45:18 PM ******/
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
