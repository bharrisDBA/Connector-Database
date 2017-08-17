USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[removeGroup]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[removeGroup]
(
	@GroupID int
)
AS
BEGIN
DELETE FROM GroupFilter WHERE GroupID = @GroupID;
DELETE FROM GroupTeam WHERE GroupID = @GroupID;
DELETE FROM Groups WHERE GroupID = @GroupID;
END
GO
