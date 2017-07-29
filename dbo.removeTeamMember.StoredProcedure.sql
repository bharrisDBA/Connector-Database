USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[removeTeamMember]    Script Date: 7/28/2017 10:17:13 PM ******/
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
