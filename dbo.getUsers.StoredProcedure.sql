USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getUsers]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getUsers] AS SELECT UserID,UserName,Status,
UserTypeID,FirstName,LastName,Gender,DateOfBirth,Address,City,StateProvince,Zip,CountryCode,Email,
Phone,PreferredLanguage,DateCreated,DateJoined,NickName,EmailNotification,UserComments FROM Users
order by lastname,firstname
GO
