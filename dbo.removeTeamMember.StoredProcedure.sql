USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[removeTeamMember]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[removeTeamMember]
(
	@UserID int,
	@TeamID int
)
AS
BEGIN
	DELETE FROM TeamAssignment WHERE UserID = @UserID AND TeamID = @TeamID
END
GO
