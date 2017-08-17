USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[GetInquirerExtensionByID]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetInquirerExtensionByID] (@UserID int) AS SELECT ExtensionID,UserID,ConnectorID,GroupID,TeamID,DateAssigned FROM InquirerExtension WHERE UserID = @UserID
GO
