USE [_connector]
GO
/****** Object:  UserDefinedFunction [dbo].[DecisionTypeToEnglish]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith Sorbo
-- Create date: 10/28/16
-- Description:	Takes a decision type number and returns English string
-- =============================================
CREATE FUNCTION [dbo].[DecisionTypeToEnglish]
(
	-- Add the parameters for the function here
	@DecisionType  int
)
RETURNS varchar(50)
AS
BEGIN
	Declare @DecisionString as varchar(50)
	select @DecisionString = 
	case 
		when @DecisionType=0 then 'Salvation'
		when @DecisionType=1 then 'Recommitment'
		when @DecisionType=2 then 'Question'
		when @DecisionType=3 then 'Prayer'
		when @DecisionType=4 then 'Contact'
		when @DecisionType=5 then 'Subscription'
		else  'unknown'
	 end

	RETURN @DecisionString

END

GO
