USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getQueueDetailsByUser]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[getQueueDetailsByUser]
(
	@UserID int
)
AS
SELECT 
	CreateDate,
	GroupID 
FROM 
(
	SELECT 
		UserID,
		CreateDate,
		GroupID 
	FROM GroupQueue UNION ALL 
	SELECT 
		UserID,
		CreateDate,
		0 As GroupID 
	FROM GlobalQueue
) As t WHERE t.UserID = @UserID
GO
