USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[InsertInquiry]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertInquiry] 
(
	@UserID int, 
	@Comments text, 
	@DecisionToday int = NULL, 
	@FirstContactURL nvarchar(100), 
	@IpAddress nvarchar(64)
) 
AS 
DECLARE 
	@count int 
	SELECT @count = 0 
	SELECT @count = COUNT(*) FROM Inquiries WHERE UserID = @UserID 
IF (@count = 0) 
BEGIN 
	INSERT INTO Inquiries 
	(
		UserID,
		Comments,
		DecisionToday,
		FirstContactURL,
		IpAddress
	) VALUES (
		@UserID,
		@Comments,
		@DecisionToday,
		@FirstContactURL,
		@IpAddress
	) 
END
GO
