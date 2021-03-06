USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getGroupFiltersMatchedByUser]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getGroupFiltersMatchedByUser]
(
	@UserID int
)
AS
BEGIN
SELECT
	GroupID,
	GroupFilterID,
	FilterType,
	Exclude
FROM dbo.GroupFilter As a
INNER JOIN
(
	SELECT GroupID AS gid,GroupFilterID AS gfid FROM get_group_filters_by_user_form_data
	WHERE UserID = @UserID AND
	CHARINDEX(',' + Data + ',', ',' + FormFieldData + ',',1) > 0
	/*GROUP BY GroupID,GroupFilterID HAVING SUM(CONVERT(int,Exclude)) = 0*/
	/* TODO: Rewrite to properly exclude any group filter of a group that matched where it is an exclude */
) As b ON a.GroupFilterID = b.gfid
END
GO
