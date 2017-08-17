USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getUserInfo]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getUserInfo]
AS
BEGIN
  SELECT
  	UserID,
  	UserType,
  	Username,
  	FirstName,
  	LastName,
  	UserName,
	LastLogon,
	DateRegistered,
	NumConversations,
	TeamMembership
  FROM get_user_info
  ORDER BY UserID DESC
END
GO
