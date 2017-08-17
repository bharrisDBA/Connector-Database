USE [_connector]
GO
/****** Object:  View [dbo].[REP_Teams_and_Members]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[REP_Teams_and_Members]
AS
SELECT        TOP (100) PERCENT t.TeamName AS [Team Name], u3.FirstName + ' ' + u3.LastName AS [Head Coach], u2.FirstName + ' ' + u2.LastName AS Coach, u.FirstName + ' ' + u.LastName AS [Connector Name], u.Email, 
                         dbo.UserTypes.TypeName AS [Level], login.LastLogIn
FROM            dbo.Teams AS t INNER JOIN
                         dbo.TeamAssignment AS ta ON ta.TeamID = t.TeamID INNER JOIN
                         dbo.Users AS u ON u.UserID = ta.UserID INNER JOIN
                         dbo.UserTypes ON u.UserTypeID = dbo.UserTypes.TypeID INNER JOIN
                         dbo.Users AS u2 ON t.TeamCoachID = u2.UserID INNER JOIN
                         dbo.Users AS u3 ON t.HeadCoachID = u3.UserID LEFT OUTER JOIN
                             (SELECT        UserID, MAX(StartTime) AS LastLogIn
                               FROM            dbo.UserSessions
                               GROUP BY UserID) AS login ON login.UserID = u.UserID
WHERE        (ta.UserID > 20) AND (u.UserTypeID >= 200)
ORDER BY [Team Name], u.LastName, u.FirstName

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[48] 4[14] 2[20] 3) )"
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
         Begin Table = "t"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 230
               Right = 217
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ta"
            Begin Extent = 
               Top = 6
               Left = 255
               Bottom = 209
               Right = 425
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "u"
            Begin Extent = 
               Top = 15
               Left = 455
               Bottom = 236
               Right = 668
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "UserTypes"
            Begin Extent = 
               Top = 6
               Left = 714
               Bottom = 219
               Right = 884
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "u2"
            Begin Extent = 
               Top = 6
               Left = 922
               Bottom = 136
               Right = 1135
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "u3"
            Begin Extent = 
               Top = 138
               Left = 922
               Bottom = 268
               Right = 1135
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "login"
            Begin Extent = 
               Top = 210
               Left = 255
               Bottom = 306
               Right = 425
            End
            DisplayFlags = 280
            TopColumn = 0
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'REP_Teams_and_Members'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
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
         Column = 4740
         Alias = 2655
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'REP_Teams_and_Members'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'REP_Teams_and_Members'
GO
