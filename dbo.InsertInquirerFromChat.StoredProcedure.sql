USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[InsertInquirerFromChat]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertInquirerFromChat] 
(	
@Status int,	
@UserTypeID int,	
@Email nvarchar(64),	
@NickName nvarchar(32),
@PreferredLanguage nvarchar(5)
) 
AS 
DECLARE 
@count int
SELECT
@count = 0
SELECT @count = COUNT(*) FROM Users WHERE Email = @Email 
IF (@count = 0) 
BEGIN 
INSERT INTO Users (Status,UserTypeID,Email,FirstName,NickName,PreferredLanguage) 
OUTPUT Inserted.UserID
VALUES 
(@Status,@UserTypeID,@Email,@NickName,@NickName,@PreferredLanguage)
END
ELSE
SELECT UserID FROM Users WHERE Email = @Email AND UserTypeID = 1
GO
