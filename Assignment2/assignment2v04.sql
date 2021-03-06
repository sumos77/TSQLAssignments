USE [master]
GO
/****** Object:  Database [Assignment2]    Script Date: 2021-04-27 21:44:32 ******/
CREATE DATABASE [Assignment2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Assignment2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Assignment2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Assignment2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Assignment2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Assignment2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assignment2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assignment2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Assignment2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Assignment2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Assignment2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Assignment2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Assignment2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Assignment2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Assignment2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Assignment2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Assignment2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Assignment2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Assignment2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Assignment2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Assignment2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Assignment2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Assignment2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Assignment2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Assignment2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Assignment2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Assignment2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Assignment2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Assignment2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Assignment2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Assignment2] SET  MULTI_USER 
GO
ALTER DATABASE [Assignment2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Assignment2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Assignment2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Assignment2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Assignment2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Assignment2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Assignment2] SET QUERY_STORE = OFF
GO
USE [Assignment2]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 2021-04-27 21:44:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[PersonalIdentityNumber] [date] NOT NULL,
	[MembershipDate] [date] NOT NULL,
	[MembershipLevel] [nchar](10) NOT NULL,
	[FavoriteStoreID] [int] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerDiscountCode]    Script Date: 2021-04-27 21:44:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerDiscountCode](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[DiscountCodeID] [int] NOT NULL,
	[DiscountUsed] [bit] NOT NULL,
 CONSTRAINT [PK_CustomerDiscountCode] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiscountCode]    Script Date: 2021-04-27 21:44:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountCode](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nchar](10) NOT NULL,
	[Percentage] [decimal](5, 2) NOT NULL,
 CONSTRAINT [PK_DiscountCode] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 2021-04-27 21:44:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeSchedule]    Script Date: 2021-04-27 21:44:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeSchedule](
	[EmployeeID] [int] NOT NULL,
	[ScheduleID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[Day] [nchar](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OpeningHours]    Script Date: 2021-04-27 21:44:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OpeningHours](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NOT NULL,
	[Opens] [time](0) NOT NULL,
	[Closes] [time](0) NOT NULL,
	[Day] [nchar](10) NOT NULL,
 CONSTRAINT [PK_OpeningHours_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 2021-04-27 21:44:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[CustomerDiscountCodeID] [int] NOT NULL,
	[CodeExists] [bit] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderRow]    Script Date: 2021-04-27 21:44:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderRow](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderRow] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 2021-04-27 21:44:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [decimal](8, 2) NULL,
	[Manufacturer] [nvarchar](50) NULL,
	[Weight] [decimal](6, 2) NULL,
	[Width] [decimal](6, 2) NULL,
	[Height] [decimal](6, 2) NULL,
	[Length] [decimal](6, 2) NULL,
	[FixedDiscount] [decimal](5, 2) NULL,
	[PercentageDiscount] [decimal](5, 2) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 2021-04-27 21:44:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Start] [time](0) NOT NULL,
	[End] [time](0) NOT NULL,
 CONSTRAINT [PK_Schedule] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 2021-04-27 21:44:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Store]    Script Date: 2021-04-27 21:44:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[PostalNumber] [nchar](10) NOT NULL,
	[StreetName] [nvarchar](50) NOT NULL,
	[StreetNumber] [nchar](10) NOT NULL,
	[Area] [int] NOT NULL,
	[ManagerID] [int] NULL,
 CONSTRAINT [PK_Store] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DiscountCode] ON 

INSERT [dbo].[DiscountCode] ([ID], [Code], [Percentage]) VALUES (1, N'ABC123    ', CAST(25.00 AS Decimal(5, 2)))
INSERT [dbo].[DiscountCode] ([ID], [Code], [Percentage]) VALUES (3, N'BradPitt  ', CAST(100.00 AS Decimal(5, 2)))
INSERT [dbo].[DiscountCode] ([ID], [Code], [Percentage]) VALUES (5, N'Angelina  ', CAST(50.50 AS Decimal(5, 2)))
SET IDENTITY_INSERT [dbo].[DiscountCode] OFF
GO
SET IDENTITY_INSERT [dbo].[OpeningHours] ON 

INSERT [dbo].[OpeningHours] ([ID], [StoreID], [Opens], [Closes], [Day]) VALUES (2, 1, CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Monday    ')
INSERT [dbo].[OpeningHours] ([ID], [StoreID], [Opens], [Closes], [Day]) VALUES (5, 1, CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Tuesday   ')
INSERT [dbo].[OpeningHours] ([ID], [StoreID], [Opens], [Closes], [Day]) VALUES (8, 1, CAST(N'07:30:00' AS Time), CAST(N'19:00:00' AS Time), N'Wednesday ')
INSERT [dbo].[OpeningHours] ([ID], [StoreID], [Opens], [Closes], [Day]) VALUES (11, 1, CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Thursday  ')
INSERT [dbo].[OpeningHours] ([ID], [StoreID], [Opens], [Closes], [Day]) VALUES (12, 1, CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Friday    ')
INSERT [dbo].[OpeningHours] ([ID], [StoreID], [Opens], [Closes], [Day]) VALUES (13, 1, CAST(N'10:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Saturday  ')
INSERT [dbo].[OpeningHours] ([ID], [StoreID], [Opens], [Closes], [Day]) VALUES (16, 2, CAST(N'08:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Monday    ')
INSERT [dbo].[OpeningHours] ([ID], [StoreID], [Opens], [Closes], [Day]) VALUES (17, 2, CAST(N'08:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Tuesday   ')
INSERT [dbo].[OpeningHours] ([ID], [StoreID], [Opens], [Closes], [Day]) VALUES (18, 2, CAST(N'07:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Wednesday ')
INSERT [dbo].[OpeningHours] ([ID], [StoreID], [Opens], [Closes], [Day]) VALUES (19, 2, CAST(N'07:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Thursday  ')
INSERT [dbo].[OpeningHours] ([ID], [StoreID], [Opens], [Closes], [Day]) VALUES (21, 2, CAST(N'07:00:00' AS Time), CAST(N'19:00:00' AS Time), N'Friday    ')
INSERT [dbo].[OpeningHours] ([ID], [StoreID], [Opens], [Closes], [Day]) VALUES (23, 2, CAST(N'08:30:00' AS Time), CAST(N'18:00:00' AS Time), N'Saturday  ')
INSERT [dbo].[OpeningHours] ([ID], [StoreID], [Opens], [Closes], [Day]) VALUES (25, 2, CAST(N'09:00:00' AS Time), CAST(N'18:00:00' AS Time), N'Sunday    ')
INSERT [dbo].[OpeningHours] ([ID], [StoreID], [Opens], [Closes], [Day]) VALUES (26, 3, CAST(N'09:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Thursday  ')
INSERT [dbo].[OpeningHours] ([ID], [StoreID], [Opens], [Closes], [Day]) VALUES (27, 3, CAST(N'09:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Tuesday   ')
INSERT [dbo].[OpeningHours] ([ID], [StoreID], [Opens], [Closes], [Day]) VALUES (28, 3, CAST(N'09:00:00' AS Time), CAST(N'17:00:00' AS Time), N'Friday    ')
SET IDENTITY_INSERT [dbo].[OpeningHours] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Name], [Description], [Price], [Manufacturer], [Weight], [Width], [Height], [Length], [FixedDiscount], [PercentageDiscount]) VALUES (1, N'Orange', N'Color', CAST(10.00 AS Decimal(8, 2)), NULL, NULL, NULL, NULL, NULL, CAST(10.00 AS Decimal(5, 2)), NULL)
INSERT [dbo].[Product] ([ID], [Name], [Description], [Price], [Manufacturer], [Weight], [Width], [Height], [Length], [FixedDiscount], [PercentageDiscount]) VALUES (2, N'Apple', N'Green', CAST(5.00 AS Decimal(8, 2)), NULL, NULL, NULL, NULL, NULL, CAST(2.00 AS Decimal(5, 2)), NULL)
INSERT [dbo].[Product] ([ID], [Name], [Description], [Price], [Manufacturer], [Weight], [Width], [Height], [Length], [FixedDiscount], [PercentageDiscount]) VALUES (3, N'Hammer', N'Nails things', CAST(100.00 AS Decimal(8, 2)), NULL, NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(5, 2)), NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Store] ON 

INSERT [dbo].[Store] ([ID], [City], [PostalNumber], [StreetName], [StreetNumber], [Area], [ManagerID]) VALUES (1, N'Gävle', N'80433     ', N'Drottninggatan', N'1         ', 300, NULL)
INSERT [dbo].[Store] ([ID], [City], [PostalNumber], [StreetName], [StreetNumber], [Area], [ManagerID]) VALUES (2, N'Stockholm', N'80022     ', N'Kungsgatan', N'2         ', 450, NULL)
INSERT [dbo].[Store] ([ID], [City], [PostalNumber], [StreetName], [StreetNumber], [Area], [ManagerID]) VALUES (3, N'Sandviken', N'80101     ', N'Gävlevägen', N'13        ', 288, NULL)
SET IDENTITY_INSERT [dbo].[Store] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_OpeningHours]    Script Date: 2021-04-27 21:44:32 ******/
ALTER TABLE [dbo].[OpeningHours] ADD  CONSTRAINT [IX_OpeningHours] UNIQUE NONCLUSTERED 
(
	[StoreID] ASC,
	[Day] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CustomerDiscountCode] ADD  CONSTRAINT [DF_CustomerDiscountCode_Used]  DEFAULT ((0)) FOR [DiscountUsed]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_CodeExists]  DEFAULT ((0)) FOR [CodeExists]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Store] FOREIGN KEY([FavoriteStoreID])
REFERENCES [dbo].[Store] ([ID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Store]
GO
ALTER TABLE [dbo].[CustomerDiscountCode]  WITH CHECK ADD  CONSTRAINT [FK_CustomerDiscountCode_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([ID])
GO
ALTER TABLE [dbo].[CustomerDiscountCode] CHECK CONSTRAINT [FK_CustomerDiscountCode_Customer]
GO
ALTER TABLE [dbo].[CustomerDiscountCode]  WITH CHECK ADD  CONSTRAINT [FK_CustomerDiscountCode_DiscountCode] FOREIGN KEY([DiscountCodeID])
REFERENCES [dbo].[DiscountCode] ([ID])
GO
ALTER TABLE [dbo].[CustomerDiscountCode] CHECK CONSTRAINT [FK_CustomerDiscountCode_DiscountCode]
GO
ALTER TABLE [dbo].[EmployeeSchedule]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeSchedule_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([ID])
GO
ALTER TABLE [dbo].[EmployeeSchedule] CHECK CONSTRAINT [FK_EmployeeSchedule_Employee]
GO
ALTER TABLE [dbo].[EmployeeSchedule]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeSchedule_Schedule] FOREIGN KEY([ScheduleID])
REFERENCES [dbo].[Schedule] ([ID])
GO
ALTER TABLE [dbo].[EmployeeSchedule] CHECK CONSTRAINT [FK_EmployeeSchedule_Schedule]
GO
ALTER TABLE [dbo].[EmployeeSchedule]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeSchedule_Store] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store] ([ID])
GO
ALTER TABLE [dbo].[EmployeeSchedule] CHECK CONSTRAINT [FK_EmployeeSchedule_Store]
GO
ALTER TABLE [dbo].[OpeningHours]  WITH CHECK ADD  CONSTRAINT [FK_OpeningHours_Store] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store] ([ID])
GO
ALTER TABLE [dbo].[OpeningHours] CHECK CONSTRAINT [FK_OpeningHours_Store]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_CustomerDiscountCode] FOREIGN KEY([CustomerDiscountCodeID])
REFERENCES [dbo].[CustomerDiscountCode] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_CustomerDiscountCode]
GO
ALTER TABLE [dbo].[OrderRow]  WITH CHECK ADD  CONSTRAINT [FK_OrderRow_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([ID])
GO
ALTER TABLE [dbo].[OrderRow] CHECK CONSTRAINT [FK_OrderRow_Order]
GO
ALTER TABLE [dbo].[OrderRow]  WITH CHECK ADD  CONSTRAINT [FK_OrderRow_Product1] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[OrderRow] CHECK CONSTRAINT [FK_OrderRow_Product1]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_Product]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_Store] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store] ([ID])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_Store]
GO
ALTER TABLE [dbo].[Store]  WITH CHECK ADD  CONSTRAINT [FK_Store_Employee] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[Employee] ([ID])
GO
ALTER TABLE [dbo].[Store] CHECK CONSTRAINT [FK_Store_Employee]
GO
ALTER TABLE [dbo].[DiscountCode]  WITH CHECK ADD  CONSTRAINT [MaximumMinimumPercentage] CHECK  (([Percentage]<=(100) AND [Percentage]>=(0)))
GO
ALTER TABLE [dbo].[DiscountCode] CHECK CONSTRAINT [MaximumMinimumPercentage]
GO
ALTER TABLE [dbo].[DiscountCode]  WITH CHECK ADD  CONSTRAINT [MinimumCodeLength] CHECK  ((len([Code])>=(6)))
GO
ALTER TABLE [dbo].[DiscountCode] CHECK CONSTRAINT [MinimumCodeLength]
GO
ALTER TABLE [dbo].[OpeningHours]  WITH CHECK ADD  CONSTRAINT [OpensBeforeCloses] CHECK  (([Closes]>[Opens]))
GO
ALTER TABLE [dbo].[OpeningHours] CHECK CONSTRAINT [OpensBeforeCloses]
GO
ALTER TABLE [dbo].[OpeningHours]  WITH CHECK ADD  CONSTRAINT [Weekdays] CHECK  (([Day]='Sunday' OR [Day]='Saturday' OR [Day]='Friday' OR [Day]='Thursday' OR [Day]='Wednesday' OR [Day]='Tuesday' OR [Day]='Monday'))
GO
ALTER TABLE [dbo].[OpeningHours] CHECK CONSTRAINT [Weekdays]
GO
USE [master]
GO
ALTER DATABASE [Assignment2] SET  READ_WRITE 
GO
