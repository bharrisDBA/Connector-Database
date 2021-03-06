USE [_connector]
GO
/****** Object:  UserDefinedFunction [dbo].[cleanupURL]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith
-- Create date: 2/14/17
-- Description:	Returns just the domain (2nd or 3rd, but without www.)
-- =============================================
CREATE FUNCTION [dbo].[cleanupURL]
(
	-- Add the parameters for the function here
	@Domain nvarchar(150)
)
RETURNS nvarchar(150)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @ret nvarchar(150)

	-- Add the T-SQL statements to compute the return value here
	set @ret = replace(replace(replace(@Domain,'http://',''),'/',''),'www.','')

	-- Return the result of the function
	RETURN @ret

END

GO
