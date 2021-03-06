USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getGroups]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[getGroups]
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
  ORDER BY GroupName ASC
END
GO
