USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[denyUser121Application]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[denyUser121Application] (
@ApplicationID int, 
@UserID int, 
@ProcessorID int, 
@ProcessorComments nvarchar(max)
) AS BEGIN UPDATE User121Application SET
 Status = 3, 
 ProcessorID = @ProcessorID, 
 ProcessorComments = @ProcessorComments, 
 DateProcessed = getdate() 
 WHERE ApplicationID = @ApplicationID; 
 UPDATE Users SET Status = 4,
ConfidentialComments = CONCAT(ConfidentialComments, @ProcessorComments)
WHERE UserID = @UserID END
GO
