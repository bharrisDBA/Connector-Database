USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getGeoLocationByIPAndLanguage]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith Sorbo
-- Create date: 8/5/16
-- Description:	Returns Geolocation Data when passed a decimal ip and language code (for the country name)
-- =============================================
create PROCEDURE [dbo].[getGeoLocationByIPAndLanguage]
	@IP varchar(15),
	@LanguageCode varchar(2)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Declare @IPLong as bigint

	select @IPLong = dbo.IPAddressToInteger(@IP);
    -- Insert statements for procedure here
	select
		@IP as IP,
		@IPLong as DecimalIp 
		 ,GeoLocations.CountryCode as CountryCode
		 ,Countries.Name as CountryName
		 ,GeoLocations.region as RegionCode
		 ,GeoRegionCodes.RegionName as RegionName
		 ,Geolocations.city as City
		 ,GeoBlocks.Postalcode 
		 ,Geolocations.TimeZone
		 ,GeoBlocks.Latitude as Latitude
		 ,GeoBlocks.Longitude as Longitude
		
		 from GeoBlocks
		left join geolocations on GeoBlocks.LocationNum = GeoLocations.LocationID
		left join GeoRegionCodes on GeoRegionCodes.CountryCode = GeoLocations.CountryCode and GeoRegionCodes.Region = GeoLocations.Region
		left join Countries on countries.Code = GeoLocations.CountryCode and countries.LanguageCode = @LanguageCode
		where @IPLong >= GeoBlocks.StartIPNum and @IPLong <= GeoBlocks.EndIPNumb
end
	
GO
