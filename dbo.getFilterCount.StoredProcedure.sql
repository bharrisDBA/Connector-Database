USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getFilterCount]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getFilterCount]
AS
BEGIN
SELECT Count(*) As ResultCount FROM Filter
END
GO
