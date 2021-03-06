USE [_connector]
GO
/****** Object:  UserDefinedFunction [dbo].[UDF_PROPER_CASE]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Function [dbo].[UDF_PROPER_CASE]
(
      @String VARCHAR(MAX)  -- Variable for string
)
RETURNS varchar(MAX)
BEGIN
     Declare @Xml XML
     Declare @ProperCase Varchar(Max)
     Declare @delimiter Varchar(5)
     Set @delimiter=' '
     SET @Xml = cast(('<A>'+replace(@String,@delimiter,'</A><A>')+'</A>') AS XML)
 
     ;With CTE AS (SELECT A.value('.', 'varchar(max)') as [Column]
      FROM @Xml.nodes('A') AS FN(A) )
      Select @ProperCase =Stuff((Select ' ' + UPPER(LEFT([Column],1))
      + LOWER(SUBSTRING([Column], 2 ,LEN([Column]))) from CTE
      for xml path('') ),1,1,'')
 
RETURN (@ProperCase)
END
GO
