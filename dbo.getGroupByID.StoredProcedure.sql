USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getGroupByID]    Script Date: 7/28/2017 10:17:13 PM ******/
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
