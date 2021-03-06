USE [_connector]
GO
/****** Object:  UserDefinedFunction [dbo].[usp_ClearHTMLTags]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
    /**************************************************************************** 
    Name of Author  :   Vishal Jharwade 
    Purpose         :   The Purpose of this function is to clean the html tags from the data. 
    ***************************************************************************************/ 
    CREATE FUNCTION [dbo].[usp_ClearHTMLTags] 
    (@String NVARCHAR(MAX)) 
     
    RETURNS NVARCHAR(MAX) 
    AS 
    BEGIN 
        DECLARE @Start INT, 
                @End INT, 
                @Length INT 
         
        WHILE CHARINDEX('<', @String) > 0 AND CHARINDEX('>', @String, CHARINDEX('<', @String)) > 0 
        BEGIN 
            SELECT  @Start  = CHARINDEX('<', @String),  
                    @End    = CHARINDEX('>', @String, CHARINDEX('<', @String)) 
            SELECT @Length = (@End - @Start) + 1 
             
            IF @Length > 0 
            BEGIN 
                SELECT @String = STUFF(@String, @Start, @Length, '') 
             END 
         END 
         
        RETURN @String 
    END 
GO
