USE [_connector]
GO
/****** Object:  UserDefinedFunction [dbo].[getFluentLanguagesInEnglish]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ketih
-- Create date: 12/7/16
-- Description:	returns a csv string of fluent languages. 
--   depends on the existence of dbo.splitstrings_moden table function
-- =============================================
CREATE FUNCTION [dbo].[getFluentLanguagesInEnglish]
(
	-- Add the parameters for the function here
	@k varchar(20)
)
RETURNS nVarChar(250)
AS
BEGIN
		-- Declare the return variable here
	declare @ret nvarchar(250) = ''

		-- Add the T-SQL statements to compute the return value here

	if (Left(@k,1) = ',')
		begin
			set @k = substring(@k,2,len(@k))
		end
	if (right(@k,1) = ',')
	   begin
		   set @k = substring(@k,1,len(@k)-1) 
	   end

	select @ret = coalesce(@ret + ',','') + l_lang from l_codes where l_id in (select * from dbo.splitstrings_moden(@k,','))

	if (Left(@ret,1) = ',')
		begin
			set @ret = substring(@ret,2,len(@ret))
		end

return @ret

END

GO
