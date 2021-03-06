USE [_connector]
GO
/****** Object:  UserDefinedFunction [dbo].[get_Minutes_Since_Last_Response]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[get_Minutes_Since_Last_Response]
(
	-- Add the parameters for the function here
	@IPAddress varchar(20)
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @minutes int

	-- Add the T-SQL statements to compute the return value here
SELECT TOP 1 @minutes = datediff(minute,vistime,getdate())
      
  FROM [_connector].[dbo].[EvangelismResponseRecording] 
  where ipaddress = @IPAddress
  --where ipaddress = '186.101.196.8'
    order by vistime desc 

	if @minutes is null
	  set @minutes = 0


	-- Return the result of the function
	RETURN @minutes

END

GO
