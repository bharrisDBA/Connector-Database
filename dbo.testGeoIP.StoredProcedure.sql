USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[testGeoIP]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[testGeoIP]
	-- Add the parameters for the stored procedure here
	@DecimalIP bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select
   GeoBlocks.StartIPNum
		,@DecimalIP as DecimalIp 
		 --,GeoLocations.CountryCode as CountryCode
		 --,Countries.Name as CountryName
		 --,GeoLocations.region as RegionCode
		 --,GeoRegionCodes.RegionName as Regioname
		 --,Geolocations.city as City
		 ,GeoBlocks.Postalcode 
		 --,Geolocations.TimeZone
		 ,GeoBlocks.Latitude as Latitude
		 ,GeoBlocks.Longitude as Longitude
		
		 from GeoBlocks
		--left join geolocations on GeoBlocks.LocationNum = GeoLocations.LocationID
	--	left join GeoRegionCodes on GeoRegionCodes.CountryCode = GeoLocations.CountryCode and GeoRegionCodes.Region = GeoLocations.Region
		-- left join Countries on countries.Code = GeoLocations.CountryCode and countries.LanguageCode = @LanguageCode
		where @DecimalIP between GeoBlocks.StartIPNum  	 and GeoBlocks.EndIPNumb
END

GO
