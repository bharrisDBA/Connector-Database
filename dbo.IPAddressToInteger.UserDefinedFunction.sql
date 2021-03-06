USE [_connector]
GO
/****** Object:  UserDefinedFunction [dbo].[IPAddressToInteger]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith from http://blogs.lessthandot.com/index.php/datamgmt/datadesign/how-to-convert-ip-addresses-between-bigi/
-- Create date: <Create Date, ,>
-- Description:	Converts IP address to decimal
-- =============================================
CREATE FUNCTION [dbo].[IPAddressToInteger] (@IP AS varchar(15))
RETURNS bigint
AS
BEGIN
 RETURN (CONVERT(bigint, PARSENAME(@IP,1)) +
         CONVERT(bigint, PARSENAME(@IP,2)) * 256 +
         CONVERT(bigint, PARSENAME(@IP,3)) * 65536 +
         CONVERT(bigint, PARSENAME(@IP,4)) * 16777216)
 
END

GO
