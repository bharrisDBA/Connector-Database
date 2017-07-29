USE [_connector]
GO
/****** Object:  UserDefinedFunction [dbo].[cleanIssueUrl]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[cleanIssueUrl]
(
	-- Add the parameters for the function here
	@URL nvarchar(500)
)
RETURNS nvarchar(500)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @ret nvarchar(500)

	select @url = replace(replace(replace(replace(left(@URL,CHARINDEX('?',@URL)-1),'/index.php',''),'www.',''),'https://',''),'http://','') 

	-- Add the T-SQL statements to compute the return value here
	
	RETURN @url

END

GO
