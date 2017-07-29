USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[insertTestimonyOrPrayerNeed]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertTestimonyOrPrayerNeed] 
(
	@UserID int,
	@Comment nvarchar(255),
	@CommentType int,
	@DateATime dateTime
) 
AS
DECLARE
	@Language nvarchar(5) 
	SELECT @Language = NULL
	SELECT @Language = PreferredLanguage FROM Users WHERE UserID = @UserID
BEGIN 
INSERT INTO TestimoniesOrPrayerNeeds 
(
	UserID,
	Comment,
	commentType,
	dateATime,
	Language
) VALUES 
(
	@UserID,
	@Comment,
	@CommentType,
	@DateATime,
	@Language
)
END
GO
