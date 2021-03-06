USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[InsertInquirer]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertInquirer] (	
	@Status int,	
	@UserTypeID int,	
	@Email nvarchar(64),	
	@FirstName nvarchar(32),	
	@LastName nvarchar(32),	
	@PreferredLanguage nvarchar(5),	
	@Gender bit,	
	@City nvarchar(64),	
	@StateProvince nvarchar(64),	
	@CountryCode nvarchar(2), 
	@TimeZone nvarChar(50))
	AS 
	DECLARE @count int 
	SELECT @count = 0 SELECT @count = COUNT(*) FROM Users WHERE Email = @Email 
	IF (@count = 0) 
		BEGIN 
			INSERT INTO Users (Status,UserTypeID,Email,FirstName,LastName,PreferredLanguage,Gender,City,StateProvince,CountryCode,LocalTimeZone) 
			   VALUES (@Status,@UserTypeID,@Email,@FirstName,@LastName,@PreferredLanguage,@Gender,@City,@StateProvince,@CountryCode,@TimeZone) 
        END
GO
