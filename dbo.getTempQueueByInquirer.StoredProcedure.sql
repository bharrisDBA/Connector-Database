USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getTempQueueByInquirer]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getTempQueueByInquirer] ( @InquirerID int ) AS BEGIN SELECT TempQueueID, Type, InquirerID, QueueDate, DateInserted, InquirerID, TeamID, GroupID, ConnectorID, Comments FROM TempQueue Where InquirerID = @InquirerID END
GO
