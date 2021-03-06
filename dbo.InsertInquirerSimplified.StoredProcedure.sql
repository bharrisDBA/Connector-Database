USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[InsertInquirerSimplified]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertInquirerSimplified] 
(	
@Status int,	
@UserTypeID int,	
@Email nvarchar(64),	
@FullName nvarchar(32),
@PreferredLanguage nvarchar(5),
@Gender int
) 
AS 
DECLARE 
@count int
SELECT
@count = 0
SELECT @count = COUNT(*) FROM Users WHERE Email = @Email 
IF (@count = 0) 
BEGIN 
INSERT INTO Users (Status,UserTypeID,Email,FirstName,PreferredLanguage,Gender) 
OUTPUT Inserted.UserID
VALUES 
(@Status,@UserTypeID,@Email,@FullName,@PreferredLanguage,@Gender)
END
ELSE
SELECT UserID FROM Users WHERE Email = @Email AND UserTypeID = 1
GO
