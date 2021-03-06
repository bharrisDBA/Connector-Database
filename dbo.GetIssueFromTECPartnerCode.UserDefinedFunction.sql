USE [_connector]
GO
/****** Object:  UserDefinedFunction [dbo].[GetIssueFromTECPartnerCode]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith
-- Create date: 12/14/16
-- Description:	Translate the partner code codes into an English Issue
-- =============================================
CREATE FUNCTION [dbo].[GetIssueFromTECPartnerCode]
(
	-- Add the parameters for the function here
	@Code nvarchar(40)
)
RETURNS nvarchar(50)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @ret nvarchar(50)

	-- Add the T-SQL statements to compute the return value here
	SELECT @ret = case
		when @code like '%JA-01' then 'Anxiety'
		when @code like '%JA-02' then 'Brokenness'
		when @code like '%JA-03' then 'Death'
		when @code like '%JA-04' then 'Depression'
		when @code like '%JA-05' then 'Emptiness'
		when @code like '%JA-06' then 'Falsehood'
		when @code like '%JA-07' then ' '
		when @code like '%JA-08' then 'Guilt'
		when @code like '%JA-09' then 'Hopelessness'
		when @code like '%JA-10' then 'Illness'
		when @code like '%JA-11' then 'Insignificance'
		when @code like '%JA-12' then 'Shame'
		when @code like '%JA-13' then 'Conditional Love'
		when @code like '%JA-14' then 'How to Know God'
		when @code like '%WJI' then 'WhoJesusIs Site'
	end 


	-- Return the result of the function
	RETURN @ret

END

GO
