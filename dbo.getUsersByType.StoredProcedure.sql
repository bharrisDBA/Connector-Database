USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getUsersByType]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[getUsersByType]
(
	@UserType int
)
AS 
SELECT 	
	UserID,
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
	UserComments
FROM Users
WHERE UserTypeID = @UserType
GO
