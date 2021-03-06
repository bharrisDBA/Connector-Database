USE [_connector]
GO
/****** Object:  View [dbo].[tmpInquirersWithStoriesMay2017]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[tmpInquirersWithStoriesMay2017]
AS
SELECT        u.UserID, FORMAT(u.DateCreated, 'MMMM d, yyyy', 'en-US') AS InitialDate, dbo.UDF_PROPER_CASE(u.FirstName) AS FirstName, u.LastName, u.Email, u2.FirstName + ' ' + u2.LastName AS connectorname, 
                         u2.Email AS ConnectorEmail, REPLACE(REPLACE(fd1.Data, CHAR(13), ' '), CHAR(10), ' ') AS InitialComments, fd2.Data AS SiteVisited
FROM            dbo.Users AS u INNER JOIN
                         dbo.FormData AS fd1 ON fd1.UserID = u.UserID AND fd1.FormFieldID = 8 INNER JOIN
                         dbo.FormData AS fd2 ON fd2.UserID = u.UserID AND fd2.FormFieldID = 12 LEFT OUTER JOIN
                         dbo.Inquiries AS i ON i.UserID = u.UserID LEFT OUTER JOIN
                         dbo.Users AS u2 ON u2.UserID = i.ProcessorID
WHERE        (u.UserID IN (254538, 256463, 260398, 260736, 262467, 262894, 265069, 269939, 256698, 257071, 257405, 271879))

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "u"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 251
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "fd1"
            Begin Extent = 
               Top = 128
               Left = 321
               Bottom = 258
               Right = 491
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "i"
            Begin Extent = 
               Top = 6
               Left = 497
               Bottom = 136
               Right = 696
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "u2"
            Begin Extent = 
               Top = 6
               Left = 734
               Bottom = 136
               Right = 947
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "fd2"
            Begin Extent = 
               Top = 6
               Left = 985
               Bottom = 136
               Right = 1155
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 11
         Width = 284
         Width = 1500
         Width = 4125
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         A' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'tmpInquirersWithStoriesMay2017'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'lias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'tmpInquirersWithStoriesMay2017'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'tmpInquirersWithStoriesMay2017'
GO
