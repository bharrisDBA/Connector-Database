USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[removeGroup]    Script Date: 7/28/2017 10:17:13 PM ******/
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
