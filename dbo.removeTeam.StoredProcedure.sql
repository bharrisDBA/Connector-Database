USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[removeTeam]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[removeTeam]
(
	@TeamID int
)
AS
BEGIN
	DELETE FROM TeamAssignment WHERE TeamID = @TeamID;
	DELETE FROM GroupTeam WHERE TeamID = @TeamID;
	DELETE FROM Teams WHERE TeamID = @TeamID;
END

GO
