USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getGroupByID]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getGroupByID]
(
	@GroupID int
)
AS
BEGIN
  SELECT
  	GroupID,
  	GroupName,
  	GroupDescription,
  	ExpirationTime,
  	ForwardGroupID,
  	CreateDate
  FROM Groups
  WHERE GroupID = @GroupID
END
GO
