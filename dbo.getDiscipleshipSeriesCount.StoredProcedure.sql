USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getDiscipleshipSeriesCount]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getDiscipleshipSeriesCount]
AS
BEGIN
SELECT Count(*) As ResultCount FROM DiscipleshipSeries
END
GO
