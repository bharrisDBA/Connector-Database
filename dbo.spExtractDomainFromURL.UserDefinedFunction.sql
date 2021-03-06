USE [_connector]
GO
/****** Object:  UserDefinedFunction [dbo].[spExtractDomainFromURL]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  FUNCTION [dbo].[spExtractDomainFromURL] ( @strURL NVARCHAR(1000) )
RETURNS NVARCHAR(100)
--Posted at http://stackoverflow.com/a/20808097/391101
AS
BEGIN
--Strip Protocol
select @strURL = replace(@strURL,'http://http://','http://')
SELECT @strURL = SUBSTRING(@strURL, CHARINDEX('://', @strURL) + 3, 999)

-- Strip www subdomain
IF LEFT(@strURL, 4) = 'www.'
SELECT @strURL = SUBSTRING(@strURL, 5, 999)

-- Strip Path
IF CHARINDEX('/', @strURL) > 0
SELECT @strURL = LEFT(@strURL, CHARINDEX('/', @strURL) - 1)

--Unless you iterate through a list of TLDs, you can't differentiate between subdomain.example.com and example.com.au
--I decided against this because it's slower, and the TLD list requires maintenance

RETURN lower(@strURL)
END
GO
