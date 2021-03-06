USE [_connector]
GO
/****** Object:  UserDefinedFunction [dbo].[parseURL]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE      FUNCTION [dbo].[parseURL]  (@strURL varchar(1000))
RETURNS varchar(1000)
AS
BEGIN
IF CHARINDEX('http://',@strURL) > 0 OR CHARINDEX('https://',@strURL) > 0
-- Ghetto-tastic
SELECT @strURL = REPLACE(@strURL,'https://','')
SELECT @strURL = REPLACE(@strURL,'http://','')
SELECT @strURL = REPLACE(@strURL,'www','')
-- Remove everything after "/" if one exists
IF CHARINDEX('/',@strURL) > 0 (SELECT @strURL = LEFT(@strURL,CHARINDEX('/',@strURL)-1))

-- Optional: Remove subdomains but differentiate between www.google.com and www.google.com.au
IF (LEN(@strURL)-LEN(REPLACE(@strURL,'.','')))/LEN('.') < 3 -- if there are less than 3 periods
SELECT @strURL = PARSENAME(@strURL,2) + '.' + PARSENAME(@strURL,1)
ELSE -- It's likely a google.co.uk, or google.com.au
SELECT @strURL = PARSENAME(@strURL,3) + '.' + PARSENAME(@strURL,2) + '.' + PARSENAME(@strURL,1)
RETURN @strURL
END

GO
