USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[assignToSeries]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[assignToSeries]
(
	@UserID int,
	@SeriesID int,
	@UnsubscribeToken nchar(30)
)
AS
DECLARE
	@count int

	SELECT @count = 0
	
	SELECT @count = COUNT(*) FROM DiscipleshipSeriesUserConnection WHERE SeriesID = @SeriesID
	AND UserID = @UserID
IF (@count = 0)
BEGIN
	/* Insert user into series starting now, and last sent is 0 */
	INSERT INTO DiscipleshipSeriesUserConnection
	(
		SeriesID,
		UserID,
		LastSection,
		StartDate,
		UnsubscribeToken
	) OUTPUT Inserted.SeriesUserConnectionID
	VALUES
	(
		@SeriesID,
		@UserID,
		0,
		convert(date, getdate()),
		@UnsubscribeToken
	)
END
GO
