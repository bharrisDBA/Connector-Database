USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getGroupCount]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getGroupCount]
AS
BEGIN
SELECT Count(*) As ResultCount FROM Groups
END
GO
