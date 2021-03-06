USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getGeoDataByIPLong]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getGeoDataByIPLong]
(
	@IPLong bigint
)
AS
BEGIN
SELECT
	CountryCode,
	CountryName,
	Region,
	RegionName,
	City,
	PostalCode,
	AreaCode,
	DmaCode,
	Latitude,
	Longitude
FROM get_geodata WHERE @IPLong >= StartIPNum And @IpLong <= EndIPNum
END
GO
