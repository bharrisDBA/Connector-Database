USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getUserInfoCount]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getUserInfoCount]
AS
BEGIN
SELECT Count(*) As ResultCount FROM get_user_info
END
GO
