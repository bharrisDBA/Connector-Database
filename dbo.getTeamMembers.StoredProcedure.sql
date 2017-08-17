USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getTeamMembers]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[getTeamMembers]
(
	@TeamID int
)
AS SELECT
	Users.UserID,
	UserName,
	Status,
	UserTypeID,
	FirstName,
	LastName,
	Gender,
	DateOfBirth,
	Address,
	City,
	StateProvince,
	Zip,
	CountryCode,
	Email,
	Phone,
	PreferredLanguage,
	DateCreated,
	DateJoined,
	NickName,
	EmailNotification,
	TeamID 
FROM Users,TeamAssignment 
WHERE Users.UserID = TeamAssignment.UserID AND TeamAssignment.TeamID = @TeamID ORDER BY (FirstName + ' ' + LastName) ASC
GO
