USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getGlobalQueue]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getGlobalQueue]
AS
BEGIN
  SELECT
  	GlobalQueueID, UserID, CreateDate
  FROM get_global_queue
END
GO
