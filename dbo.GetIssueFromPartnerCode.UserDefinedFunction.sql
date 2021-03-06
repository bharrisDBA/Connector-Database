USE [_connector]
GO
/****** Object:  UserDefinedFunction [dbo].[GetIssueFromPartnerCode]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith
-- Create date: 2/2/17
-- Description:	Translate the partner code codes into an English Issue
-- =============================================
CREATE FUNCTION [dbo].[GetIssueFromPartnerCode]
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
		when (@code like '%JA-01') or (@code like '%adwords01%') or (@code like '%baidu01%')  then 'Anxiety'
		when @code like '%JA-02' or @code like '%adwords02%' or @code like '%baidu02%' then 'Brokenness'
		when @code like '%JA-03' or @code like '%adwords03%' or @code like '%baidu03%' then 'Death'
		when @code like '%JA-04' or @code like '%adwords04%' or @code like '%baidu04%' then 'Depression'
		when @code like '%JA-05' or @code like '%adwords05%' or @code like '%baidu05%' then 'Emptiness'
		when @code like '%JA-06' or @code like '%adwords06%' or @code like '%baidu06%' then 'Falsehood'
		when @code like '%JA-07' or @code like '%adwords07%' or @code like '%baidu07%' then ' '
		when @code like '%JA-08' or @code like '%adwords08%' or @code like '%baidu08%' then 'Guilt'
		when @code like '%JA-09' or @code like '%adwords09%' or @code like '%baidu09%' then 'Hopelessness'
		when @code like '%JA-10' or @code like '%adwords10%' or @code like '%baidu10%' then 'Illness'
		when @code like '%JA-11' or @code like '%adwords11%' or @code like '%baidu11%' then 'Insignificance'
		when @code like '%JA-12' or @code like '%adwords12%' or @code like '%baidu12%' then 'Shame'
		when @code like '%JA-13'or @code like '%adwords13%' or @code like '%baidu13%' then 'Conditional Love'
		when @code like '%JA-14' or @code like '%adwords14%' or @code like '%baidu14%' then 'How to Know God'
		when  @code like '%baidu15%' then 'Prayer'
		when @code like '%baiduWJI' then 'Who Jesus Is'
		when @code like '%BaiduWJIB' then 'Bible Overview'
		when @code like '%BaiduWJIC' then 'Story Film'
		else @code
	end 


	-- Return the result of the function
	RETURN @ret
END

GO
