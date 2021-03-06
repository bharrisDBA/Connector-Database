USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[InsertConnector]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertConnector] 
(@Status int, @UserTypeID int, @Email nvarchar(64), @FirstName nvarchar(32), @LastName nvarchar(32), @NickName nvarchar(32), @Gender bit, 
@Address nvarchar(64), @City nvarchar(64), @StateProvince nvarchar(64), @CountryCode nvarchar(2), @Zip nvarchar(64), 
@Phone nvarchar(64), @DateOfBirth date, @FluentLanguages varchar(255),@PreferredLanguage nvarchar(2)
) AS DECLARE @count int 
SELECT @count = 0 SELECT @count = COUNT(*) FROM Users WHERE Email = @Email IF (@count = 0) 
BEGIN 
INSERT INTO Users (Status,UserTypeID,Email,FirstName,LastName,NickName,Gender,Address,City,StateProvince,CountryCode,Zip,Phone,DateOfBirth,FluentLanguages,PreferredLanguage) 
VALUES (@Status,@UserTypeID,@Email,@FirstName,@LastName,@NickName,@Gender,@Address,@City,@StateProvince,@CountryCode,@Zip,@Phone,@DateOfBirth,',' + @FluentLanguages + ',',@PreferredLanguage) END
GO
