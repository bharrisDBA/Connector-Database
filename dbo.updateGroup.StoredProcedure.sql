USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[updateGroup]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[updateGroup]
(
	@GroupID int,
	@GroupName nvarchar(32),
  	@GroupDescription nvarchar(255),
  	@ExpirationTime int,
  	@ForwardGroupID int
)
AS 
BEGIN 
UPDATE Groups
	SET 
	GroupName = @GroupName,
  	GroupDescription = @GroupDescription,
  	ExpirationTime = @ExpirationTime,
  	ForwardGroupID = @ForwardGroupID
WHERE GroupID = @GroupID
END
GO
