USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getUsersSummary]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[getUsersSummary]
(
	@UserType int = NULL,
	@ExcludeType int = NULL,
	@Status int = NULL
)
AS 
SELECT *
FROM Users
WHERE UserTypeID = ISNULL(@UserType,UserTypeID) AND Status = ISNULL(@Status,Status) AND UserTYPEID <> @ExcludeType
order by lastname,firstname
GO
