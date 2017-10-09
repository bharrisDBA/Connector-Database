USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[assignToSeries]    Script Date: 8/16/2017 8:45:17 PM ******/
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

MERGE DiscipleshipSeriesUserConnection as [Target]
USING  (select @UserID as UserId, @SeriesID as SeriesId) as [Source]
	(UserID, SeriesID) on [Target].UserId =[Source].UserId AND [Target].SeriesID = [Source].SeriesID
WHEN NOT MATCHED THEN
    INSERT (SeriesID,UserID,LastSection,StartDate,UnsubscribeToken)
	VALUES (@SeriesID,@UserID,0,convert(date, getdate()),@UnsubscribeToken);


GO
