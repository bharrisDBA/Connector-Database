USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getGroupQueuePreviewSummary]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* 
Finds users that not only match filters, but match every single force of a particular group
so long as it isn't an exclude
TODO: Optimize
*/
CREATE PROCEDURE [dbo].[getGroupQueuePreviewSummary]
(
	@GroupID int
)
AS
DECLARE @TotalCount int

SELECT @TotalCount =  COUNT(*) FROM GroupFilter WHERE GroupID = @GroupID AND FilterType = 2

SELECT
	UserID,
	UserName,
	FirstName,
	LastName,
	NickName,
	DateCreated,
	ForceCount
FROM  dbo.Users As a
INNER JOIN
(
	SELECT UserID AS uid FROM get_group_queue_preview_summary
    WHERE
	GroupID = @GroupID AND 
	/* Old one that doesn't seem to work
	((',' + FormFieldData + ',') LIKE (',' + Data + ','))*/
	CHARINDEX(',' + Data + ',', ',' + FormFieldData + ',',1) > 0
    GROUP BY UserID HAVING SUM(CONVERT(int,Exclude)) = 0
) As b ON a.UserID = b.uid
INNER JOIN
(
	SELECT UserID as uid2, Count(*) As ForceCount FROM get_group_queue_preview_summary
	WHERE GroupID = @GroupID AND FilterType = 2 AND
	CHARINDEX(',' + Data + ',', ',' + FormFieldData + ',',1) > 0
	GROUP BY UserID
) As c ON b.uid = c.uid2
WHERE ForceCount = @TotalCount
GO
