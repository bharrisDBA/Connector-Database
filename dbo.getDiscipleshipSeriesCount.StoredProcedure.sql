USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getDiscipleshipSeriesCount]    Script Date: 8/16/2017 8:45:17 PM ******/
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
