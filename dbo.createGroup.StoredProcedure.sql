USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[createGroup]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[createGroup]
(
	@GroupName nvarchar(32),
  	@GroupDescription nvarchar(255),
  	@ExpirationTime int,
  	@ForwardGroupID int
)
AS 
BEGIN 
INSERT INTO Groups
(
	GroupName,
  	GroupDescription,
  	ExpirationTime,
  	ForwardGroupID
)
VALUES
(
 	@GroupName,
  	@GroupDescription,
  	@ExpirationTime,
  	@ForwardGroupID
)
END
GO
