USE [_connector]
GO
/****** Object:  UserDefinedFunction [dbo].[AddCommasToInteger]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[AddCommasToInteger]
(
	-- Add the parameters for the function here
	@IntVal int
)
RETURNS varchar(20)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @result varchar(20)
	if @intVal is null 
	  begin 
	    set @result = 0
      end
   else
      begin
		-- Add the T-SQL statements to compute the return value here
		SELECT @result=REPLACE(CONVERT(VARCHAR(20), CAST(@IntVal AS MONEY), 1), '.00', '');

		-- Return the result of the function
		
	end
  return @result
END

GO
