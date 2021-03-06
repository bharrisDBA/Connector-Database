USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[Pagination_Test_1]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Pagination_Test_1] -- ORDER BY CustomerID
  @PageNumber INT = 1,
  @PageSize   INT = 100,
  @SortField varchar(30),
  @sortOrder varchar(5)
AS
BEGIN
  SET NOCOUNT ON;
 
 SELECT InquiryID,UserID,Comments,DecisionToday,DateSubmitted,FirstContactURL,IpAddress,ProcessorID,ConnectorID,FirstName,LastName
    FROM get_inquirers_by_con_ID
	ORDER BY
	case when @sortOrder = 'ASC' and @SortField='datesubmitted'
		then datesubmitted end asc,
	case when @sortOrder = 'DESC' and @SortField='datesubmitted'
		then datesubmitted end desc,
   	case when @sortOrder = 'ASC' and @SortField='firstname'
		then firstname end asc,
	case when @sortOrder = 'DESC' and @SortField='firstname'
		then firstname end desc,
	case when @sortOrder = 'ASC' and @SortField='decisiontoday'
		then decisiontoday end asc,
	case when @sortOrder = 'DESC' and @SortField='decisiontoday'
		then decisiontoday end desc
    -- ORDER BY datesubmitted @SortOrder
    OFFSET @PageSize * (@PageNumber - 1) ROWS
    FETCH NEXT @PageSize ROWS ONLY OPTION (RECOMPILE);
END


GO
