USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getTags]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getTags]
AS
BEGIN
SELECT l_tid,l_tag FROM l_tags
END
GO
