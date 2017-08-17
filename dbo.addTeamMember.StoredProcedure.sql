USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[addTeamMember]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[addTeamMember]
(
	@UserID int,
	@TeamID int
)
AS
BEGIN
	INSERT INTO TeamAssignment (UserID, TeamID) VALUES (@UserID,@TeamID)
END
GO
