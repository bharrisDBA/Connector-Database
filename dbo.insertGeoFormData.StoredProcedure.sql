USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[insertGeoFormData]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertGeoFormData]
(
	@UserID int,
	@CountryCode nvarchar(2),
	@CountryName nvarchar(50),
	@RegionCode nvarchar(2),
	@RegionName nvarchar(50),
	@City nvarchar(32),
	@PostalCode nvarchar(20),
	@AreaCode nvarchar(5),
	@DMACode nvarchar(20),
	@Latitude nvarchar(20),
	@Longitude nvarchar(20)
)
AS
DECLARE @Count int
SELECT @Count = 0
/* Only insert GeoData once for this user */
SELECT @Count = COUNT(FormDataID) FROM [dbo].[FormData] WHERE UserID = @UserID AND FormFieldID = 21
IF (@Count = 0)
BEGIN
INSERT INTO [dbo].[FormData] (UserID,FormFieldID,Data) VALUES (@UserID,16,@CountryCode);
INSERT INTO [dbo].[FormData] (UserID,FormFieldID,Data) VALUES (@UserID,19,@CountryName);
INSERT INTO [dbo].[FormData] (UserID,FormFieldID,Data) VALUES (@UserID,32,@RegionCode);
INSERT INTO [dbo].[FormData] (UserID,FormFieldID,Data) VALUES (@UserID,17,@RegionName);
INSERT INTO [dbo].[FormData] (UserID,FormFieldID,Data) VALUES (@UserID,33,@City);
INSERT INTO [dbo].[FormData] (UserID,FormFieldID,Data) VALUES (@UserID,36,@PostalCode);
INSERT INTO [dbo].[FormData] (UserID,FormFieldID,Data) VALUES (@UserID,37,@AreaCode);
INSERT INTO [dbo].[FormData] (UserID,FormFieldID,Data) VALUES (@UserID,38,@DMACode);
INSERT INTO [dbo].[FormData] (UserID,FormFieldID,Data) VALUES (@UserID,34,@Latitude);
INSERT INTO [dbo].[FormData] (UserID,FormFieldID,Data) VALUES (@UserID,35,@Longitude);
END

GO
