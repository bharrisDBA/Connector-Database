USE [_connector]
GO
/****** Object:  View [dbo].[zzzTestQueues]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[zzzTestQueues]
AS
SELECT        dbo.GroupQueue.GroupID, dbo.GroupQueue.GroupQueueID, dbo.GroupQueue.UserID, dbo.GroupQueue.CreateDate, dbo.Users.UserName, dbo.Users.Password, dbo.Users.Status, dbo.Users.UserTypeID, 
                         dbo.Users.FirstName, dbo.Users.LastName, dbo.Users.DateOfBirth, dbo.Users.Address, dbo.Users.City, dbo.Users.StateProvince, dbo.Users.Zip, dbo.Users.CountryCode, dbo.Users.Email, dbo.Users.Phone, 
                         dbo.Users.DateCreated, dbo.Users.DateJoined, dbo.Users.NickName, dbo.Users.EmailNotification, dbo.Users.PreferredLanguage, dbo.Users.UserID AS Expr1, dbo.Users.FluentLanguages, dbo.Users.ChatActive, 
                         dbo.Users.Active, dbo.Users.SoftBounces, dbo.Users.UserComments, dbo.Users.ConfidentialComments, dbo.GroupTeam.GroupTeamID, dbo.GroupTeam.GroupID AS Expr2, dbo.GroupTeam.TeamID, 
                         dbo.Countries.CountryID, dbo.Countries.Code, dbo.Countries.Name, dbo.Inquiries.UserID AS Expr3, dbo.Inquiries.DecisionToday, dbo.Inquiries.DateSubmitted, dbo.Inquiries.FirstContactURL, 
                         dbo.Inquiries.IpAddress, dbo.Inquiries.ProcessorID, dbo.Inquiries.InquiryID, dbo.Inquiries.Comments, dbo.Inquiries.ProcessorComments, dbo.Inquiries.DateProcessed, dbo.Users.Gender
FROM            dbo.Users INNER JOIN
                         dbo.Inquiries ON dbo.Users.UserID = dbo.Inquiries.UserID INNER JOIN
                         dbo.GroupQueue ON dbo.Users.UserID = dbo.GroupQueue.UserID INNER JOIN
                         dbo.GroupTeam ON dbo.GroupQueue.GroupID = dbo.GroupTeam.GroupID INNER JOIN
                         dbo.Countries ON dbo.Users.CountryCode = dbo.Countries.Code

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
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
         Begin Table = "GroupTeam"
            Begin Extent = 
               Top = 202
               Left = 293
               Bottom = 335
               Right = 463
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Users"
            Begin Extent = 
               Top = 12
               Left = 279
               Bottom = 169
               Right = 492
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "Countries"
            Begin Extent = 
               Top = 173
               Left = 610
               Bottom = 286
               Right = 780
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Inquiries"
            Begin Extent = 
               Top = 6
               Left = 738
               Bottom = 136
               Right = 937
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "GroupQueue"
            Begin Extent = 
               Top = 40
               Left = 23
               Bottom = 257
               Right = 193
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
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
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
         ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'zzzTestQueues'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'zzzTestQueues'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'zzzTestQueues'
GO
