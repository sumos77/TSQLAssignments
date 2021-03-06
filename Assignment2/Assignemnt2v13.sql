USE [master]
GO
/****** Object:  Database [Assignment2]    Script Date: 2021-05-02 16:24:12 ******/
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
/****** Object:  Table [dbo].[Customer]    Script Date: 2021-05-02 16:24:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Birthdate] [date] NOT NULL,
	[LastFour] [nchar](4) NOT NULL,
	[MembershipDate] [date] NOT NULL,
	[MembershipLevel] [nchar](10) NOT NULL,
	[FavoriteStoreID] [int] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiscountCode]    Script Date: 2021-05-02 16:24:12 ******/
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
/****** Object:  Table [dbo].[Employee]    Script Date: 2021-05-02 16:24:12 ******/
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
/****** Object:  Table [dbo].[OpeningHour]    Script Date: 2021-05-02 16:24:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OpeningHour](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NOT NULL,
	[Day] [nchar](10) NOT NULL,
	[Opens] [time](0) NOT NULL,
	[Closes] [time](0) NOT NULL,
 CONSTRAINT [PK_OpeningHours] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 2021-05-02 16:24:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderRow]    Script Date: 2021-05-02 16:24:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderRow](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderRow] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 2021-05-02 16:24:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Price] [decimal](8, 2) NOT NULL,
	[Manufacturer] [nvarchar](50) NOT NULL,
	[Weight] [int] NOT NULL,
	[Width] [int] NOT NULL,
	[Height] [int] NOT NULL,
	[Length] [int] NOT NULL,
	[FixedDiscount] [decimal](8, 2) NOT NULL,
	[PercentageDiscount] [decimal](5, 2) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 2021-05-02 16:24:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EmplyoyeeID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[Day] [nchar](10) NOT NULL,
	[Start] [time](0) NOT NULL,
	[End] [time](0) NOT NULL,
 CONSTRAINT [PK_Schedule] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 2021-05-02 16:24:12 ******/
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
/****** Object:  Table [dbo].[Store]    Script Date: 2021-05-02 16:24:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[PostalNumber] [nchar](5) NOT NULL,
	[StreetName] [nvarchar](50) NOT NULL,
	[StreetNumber] [nchar](5) NOT NULL,
	[Area] [decimal](5, 2) NOT NULL,
	[ManagerID] [int] NOT NULL,
 CONSTRAINT [PK_Store] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsedDiscountCode]    Script Date: 2021-05-02 16:24:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsedDiscountCode](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[DiscountCodeID] [int] NOT NULL,
 CONSTRAINT [PK_CustomerDiscountCode] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Birthdate], [LastFour], [MembershipDate], [MembershipLevel], [FavoriteStoreID]) VALUES (1, N'Berit', N'Olsson', CAST(N'1954-01-01' AS Date), N'5555', CAST(N'2005-10-05' AS Date), N'Gold      ', 1)
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Birthdate], [LastFour], [MembershipDate], [MembershipLevel], [FavoriteStoreID]) VALUES (5, N'Bengt', N'Hansson', CAST(N'1949-02-28' AS Date), N'0123', CAST(N'2006-07-08' AS Date), N'Bronze    ', 2)
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Birthdate], [LastFour], [MembershipDate], [MembershipLevel], [FavoriteStoreID]) VALUES (6, N'Ulla-Britt', N'Olofsson', CAST(N'1960-12-13' AS Date), N'9870', CAST(N'2019-05-06' AS Date), N'Silver    ', 3)
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Birthdate], [LastFour], [MembershipDate], [MembershipLevel], [FavoriteStoreID]) VALUES (9, N'Gunhild', N'Bengtsson', CAST(N'1959-04-04' AS Date), N'4556', CAST(N'2015-11-15' AS Date), N'Gold      ', 2)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[DiscountCode] ON 

INSERT [dbo].[DiscountCode] ([ID], [Code], [Percentage]) VALUES (1, N'ABC123    ', CAST(25.00 AS Decimal(5, 2)))
INSERT [dbo].[DiscountCode] ([ID], [Code], [Percentage]) VALUES (3, N'BCE234    ', CAST(50.00 AS Decimal(5, 2)))
INSERT [dbo].[DiscountCode] ([ID], [Code], [Percentage]) VALUES (5, N'LongerCode', CAST(75.50 AS Decimal(5, 2)))
INSERT [dbo].[DiscountCode] ([ID], [Code], [Percentage]) VALUES (7, N'CheatCode ', CAST(100.00 AS Decimal(5, 2)))
SET IDENTITY_INSERT [dbo].[DiscountCode] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([ID], [FirstName], [LastName]) VALUES (1, N'Brad', N'Pitt')
INSERT [dbo].[Employee] ([ID], [FirstName], [LastName]) VALUES (2, N'Angelina', N'Jolie')
INSERT [dbo].[Employee] ([ID], [FirstName], [LastName]) VALUES (3, N'Will', N'Smith')
INSERT [dbo].[Employee] ([ID], [FirstName], [LastName]) VALUES (4, N'Stephen', N'Spielberg')
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[OpeningHour] ON 

INSERT [dbo].[OpeningHour] ([ID], [StoreID], [Day], [Opens], [Closes]) VALUES (2, 1, N'Monday    ', CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[OpeningHour] ([ID], [StoreID], [Day], [Opens], [Closes]) VALUES (5, 1, N'Tuesday   ', CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[OpeningHour] ([ID], [StoreID], [Day], [Opens], [Closes]) VALUES (8, 1, N'Wednesday ', CAST(N'07:30:00' AS Time), CAST(N'19:00:00' AS Time))
INSERT [dbo].[OpeningHour] ([ID], [StoreID], [Day], [Opens], [Closes]) VALUES (11, 1, N'Thursday  ', CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[OpeningHour] ([ID], [StoreID], [Day], [Opens], [Closes]) VALUES (12, 1, N'Friday    ', CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[OpeningHour] ([ID], [StoreID], [Day], [Opens], [Closes]) VALUES (13, 1, N'Saturday  ', CAST(N'10:00:00' AS Time), CAST(N'17:00:00' AS Time))
INSERT [dbo].[OpeningHour] ([ID], [StoreID], [Day], [Opens], [Closes]) VALUES (16, 2, N'Monday    ', CAST(N'08:00:00' AS Time), CAST(N'19:00:00' AS Time))
INSERT [dbo].[OpeningHour] ([ID], [StoreID], [Day], [Opens], [Closes]) VALUES (17, 2, N'Tuesday   ', CAST(N'08:00:00' AS Time), CAST(N'19:00:00' AS Time))
INSERT [dbo].[OpeningHour] ([ID], [StoreID], [Day], [Opens], [Closes]) VALUES (18, 2, N'Wednesday ', CAST(N'07:00:00' AS Time), CAST(N'20:00:00' AS Time))
INSERT [dbo].[OpeningHour] ([ID], [StoreID], [Day], [Opens], [Closes]) VALUES (19, 2, N'Thursday  ', CAST(N'07:00:00' AS Time), CAST(N'20:00:00' AS Time))
INSERT [dbo].[OpeningHour] ([ID], [StoreID], [Day], [Opens], [Closes]) VALUES (21, 2, N'Friday    ', CAST(N'07:00:00' AS Time), CAST(N'19:00:00' AS Time))
INSERT [dbo].[OpeningHour] ([ID], [StoreID], [Day], [Opens], [Closes]) VALUES (23, 2, N'Saturday  ', CAST(N'08:30:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[OpeningHour] ([ID], [StoreID], [Day], [Opens], [Closes]) VALUES (25, 2, N'Sunday    ', CAST(N'09:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[OpeningHour] ([ID], [StoreID], [Day], [Opens], [Closes]) VALUES (26, 3, N'Thursday  ', CAST(N'09:00:00' AS Time), CAST(N'17:00:00' AS Time))
INSERT [dbo].[OpeningHour] ([ID], [StoreID], [Day], [Opens], [Closes]) VALUES (27, 3, N'Tuesday   ', CAST(N'09:00:00' AS Time), CAST(N'17:00:00' AS Time))
INSERT [dbo].[OpeningHour] ([ID], [StoreID], [Day], [Opens], [Closes]) VALUES (28, 3, N'Friday    ', CAST(N'09:00:00' AS Time), CAST(N'17:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[OpeningHour] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [CustomerID], [Date]) VALUES (1, 1, CAST(N'2020-12-01T12:00:00.000' AS DateTime))
INSERT [dbo].[Order] ([ID], [CustomerID], [Date]) VALUES (4, 5, CAST(N'2021-01-02T15:30:00.000' AS DateTime))
INSERT [dbo].[Order] ([ID], [CustomerID], [Date]) VALUES (5, 1, CAST(N'2019-05-13T20:45:46.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderRow] ON 

INSERT [dbo].[OrderRow] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (1, 1, 7, 10)
INSERT [dbo].[OrderRow] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (2, 1, 8, 1)
INSERT [dbo].[OrderRow] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (8, 4, 1, 10)
INSERT [dbo].[OrderRow] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (9, 4, 2, 11)
INSERT [dbo].[OrderRow] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (10, 4, 3, 2)
INSERT [dbo].[OrderRow] ([ID], [OrderID], [ProductID], [Quantity]) VALUES (11, 5, 3, 2)
SET IDENTITY_INSERT [dbo].[OrderRow] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [ProductName], [Description], [Price], [Manufacturer], [Weight], [Width], [Height], [Length], [FixedDiscount], [PercentageDiscount]) VALUES (1, N'Orange', N'Has a peel', CAST(10.00 AS Decimal(8, 2)), N'Dole', 250, 5, 5, 5, CAST(9.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[Product] ([ID], [ProductName], [Description], [Price], [Manufacturer], [Weight], [Width], [Height], [Length], [FixedDiscount], [PercentageDiscount]) VALUES (2, N'Apple', N'Green', CAST(5.00 AS Decimal(8, 2)), N'Dole', 300, 4, 4, 4, CAST(2.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[Product] ([ID], [ProductName], [Description], [Price], [Manufacturer], [Weight], [Width], [Height], [Length], [FixedDiscount], [PercentageDiscount]) VALUES (3, N'Hammer', N'Nails things', CAST(100.00 AS Decimal(8, 2)), N'Fiskar', 1000, 3, 25, 10, CAST(0.00 AS Decimal(8, 2)), CAST(5.00 AS Decimal(5, 2)))
INSERT [dbo].[Product] ([ID], [ProductName], [Description], [Price], [Manufacturer], [Weight], [Width], [Height], [Length], [FixedDiscount], [PercentageDiscount]) VALUES (7, N'Dowel', N'Use with hammer', CAST(2.50 AS Decimal(8, 2)), N'Fiskar', 10, 1, 4, 1, CAST(0.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[Product] ([ID], [ProductName], [Description], [Price], [Manufacturer], [Weight], [Width], [Height], [Length], [FixedDiscount], [PercentageDiscount]) VALUES (8, N'Laptop', N'Types stuff', CAST(7500.00 AS Decimal(8, 2)), N'Dell', 2500, 35, 3, 24, CAST(1500.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[Product] ([ID], [ProductName], [Description], [Price], [Manufacturer], [Weight], [Width], [Height], [Length], [FixedDiscount], [PercentageDiscount]) VALUES (9, N'Bookshelf', N'Stores books', CAST(900.00 AS Decimal(8, 2)), N'IKEA', 4000, 35, 210, 150, CAST(0.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(5, 2)))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Schedule] ON 

INSERT [dbo].[Schedule] ([ID], [EmplyoyeeID], [StoreID], [Day], [Start], [End]) VALUES (1, 1, 1, N'Monday    ', CAST(N'08:00:00' AS Time), CAST(N'16:00:00' AS Time))
INSERT [dbo].[Schedule] ([ID], [EmplyoyeeID], [StoreID], [Day], [Start], [End]) VALUES (2, 1, 1, N'Tuesday   ', CAST(N'08:00:00' AS Time), CAST(N'16:00:00' AS Time))
INSERT [dbo].[Schedule] ([ID], [EmplyoyeeID], [StoreID], [Day], [Start], [End]) VALUES (5, 1, 1, N'Wednesday ', CAST(N'08:00:00' AS Time), CAST(N'16:00:00' AS Time))
INSERT [dbo].[Schedule] ([ID], [EmplyoyeeID], [StoreID], [Day], [Start], [End]) VALUES (8, 1, 2, N'Thursday  ', CAST(N'10:00:00' AS Time), CAST(N'20:00:00' AS Time))
INSERT [dbo].[Schedule] ([ID], [EmplyoyeeID], [StoreID], [Day], [Start], [End]) VALUES (9, 1, 3, N'Friday    ', CAST(N'08:00:00' AS Time), CAST(N'12:00:00' AS Time))
INSERT [dbo].[Schedule] ([ID], [EmplyoyeeID], [StoreID], [Day], [Start], [End]) VALUES (12, 1, 3, N'Saturday  ', CAST(N'10:00:00' AS Time), CAST(N'14:00:00' AS Time))
INSERT [dbo].[Schedule] ([ID], [EmplyoyeeID], [StoreID], [Day], [Start], [End]) VALUES (13, 1, 3, N'Sunday    ', CAST(N'10:00:00' AS Time), CAST(N'14:00:00' AS Time))
INSERT [dbo].[Schedule] ([ID], [EmplyoyeeID], [StoreID], [Day], [Start], [End]) VALUES (15, 2, 1, N'Monday    ', CAST(N'10:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[Schedule] ([ID], [EmplyoyeeID], [StoreID], [Day], [Start], [End]) VALUES (19, 2, 2, N'Tuesday   ', CAST(N'09:00:00' AS Time), CAST(N'13:00:00' AS Time))
INSERT [dbo].[Schedule] ([ID], [EmplyoyeeID], [StoreID], [Day], [Start], [End]) VALUES (21, 3, 1, N'Thursday  ', CAST(N'10:00:00' AS Time), CAST(N'16:00:00' AS Time))
INSERT [dbo].[Schedule] ([ID], [EmplyoyeeID], [StoreID], [Day], [Start], [End]) VALUES (22, 3, 2, N'Friday    ', CAST(N'10:00:00' AS Time), CAST(N'16:00:00' AS Time))
INSERT [dbo].[Schedule] ([ID], [EmplyoyeeID], [StoreID], [Day], [Start], [End]) VALUES (23, 3, 3, N'Sunday    ', CAST(N'10:00:00' AS Time), CAST(N'16:00:00' AS Time))
INSERT [dbo].[Schedule] ([ID], [EmplyoyeeID], [StoreID], [Day], [Start], [End]) VALUES (24, 4, 2, N'Monday    ', CAST(N'08:00:00' AS Time), CAST(N'16:00:00' AS Time))
INSERT [dbo].[Schedule] ([ID], [EmplyoyeeID], [StoreID], [Day], [Start], [End]) VALUES (27, 4, 2, N'Tuesday   ', CAST(N'08:00:00' AS Time), CAST(N'16:00:00' AS Time))
INSERT [dbo].[Schedule] ([ID], [EmplyoyeeID], [StoreID], [Day], [Start], [End]) VALUES (28, 4, 2, N'Wednesday ', CAST(N'08:00:00' AS Time), CAST(N'16:00:00' AS Time))
INSERT [dbo].[Schedule] ([ID], [EmplyoyeeID], [StoreID], [Day], [Start], [End]) VALUES (29, 4, 2, N'Thursday  ', CAST(N'08:00:00' AS Time), CAST(N'16:00:00' AS Time))
INSERT [dbo].[Schedule] ([ID], [EmplyoyeeID], [StoreID], [Day], [Start], [End]) VALUES (30, 4, 2, N'Friday    ', CAST(N'08:00:00' AS Time), CAST(N'16:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[Schedule] OFF
GO
SET IDENTITY_INSERT [dbo].[Stock] ON 

INSERT [dbo].[Stock] ([ID], [StoreID], [ProductID], [Quantity]) VALUES (1, 1, 1, 5)
INSERT [dbo].[Stock] ([ID], [StoreID], [ProductID], [Quantity]) VALUES (2, 1, 2, 7)
INSERT [dbo].[Stock] ([ID], [StoreID], [ProductID], [Quantity]) VALUES (3, 1, 3, 1)
INSERT [dbo].[Stock] ([ID], [StoreID], [ProductID], [Quantity]) VALUES (6, 1, 7, 0)
INSERT [dbo].[Stock] ([ID], [StoreID], [ProductID], [Quantity]) VALUES (7, 2, 2, 3)
INSERT [dbo].[Stock] ([ID], [StoreID], [ProductID], [Quantity]) VALUES (8, 2, 8, 4)
INSERT [dbo].[Stock] ([ID], [StoreID], [ProductID], [Quantity]) VALUES (9, 3, 8, 1)
INSERT [dbo].[Stock] ([ID], [StoreID], [ProductID], [Quantity]) VALUES (10, 3, 9, 5)
INSERT [dbo].[Stock] ([ID], [StoreID], [ProductID], [Quantity]) VALUES (11, 3, 1, 0)
SET IDENTITY_INSERT [dbo].[Stock] OFF
GO
SET IDENTITY_INSERT [dbo].[Store] ON 

INSERT [dbo].[Store] ([ID], [City], [PostalNumber], [StreetName], [StreetNumber], [Area], [ManagerID]) VALUES (1, N'Gävle', N'80433', N'Drottninggatan', N'1    ', CAST(300.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[Store] ([ID], [City], [PostalNumber], [StreetName], [StreetNumber], [Area], [ManagerID]) VALUES (2, N'Stockholm', N'80022', N'Kungsgatan', N'2    ', CAST(450.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Store] ([ID], [City], [PostalNumber], [StreetName], [StreetNumber], [Area], [ManagerID]) VALUES (3, N'Sandviken', N'80101', N'Gävlevägen', N'13   ', CAST(288.00 AS Decimal(5, 2)), 1)
SET IDENTITY_INSERT [dbo].[Store] OFF
GO
SET IDENTITY_INSERT [dbo].[UsedDiscountCode] ON 

INSERT [dbo].[UsedDiscountCode] ([ID], [OrderID], [CustomerID], [DiscountCodeID]) VALUES (1, 1, 1, 1)
INSERT [dbo].[UsedDiscountCode] ([ID], [OrderID], [CustomerID], [DiscountCodeID]) VALUES (2, 5, 1, 3)
INSERT [dbo].[UsedDiscountCode] ([ID], [OrderID], [CustomerID], [DiscountCodeID]) VALUES (7, 4, 5, 7)
SET IDENTITY_INSERT [dbo].[UsedDiscountCode] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PersonalNumber]    Script Date: 2021-05-02 16:24:12 ******/
CREATE NONCLUSTERED INDEX [PersonalNumber] ON [dbo].[Customer]
(
	[Birthdate] ASC,
	[LastFour] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UniqueCode]    Script Date: 2021-05-02 16:24:12 ******/
ALTER TABLE [dbo].[DiscountCode] ADD  CONSTRAINT [UniqueCode] UNIQUE NONCLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [OpenOncePerDay]    Script Date: 2021-05-02 16:24:12 ******/
ALTER TABLE [dbo].[OpeningHour] ADD  CONSTRAINT [OpenOncePerDay] UNIQUE NONCLUSTERED 
(
	[StoreID] ASC,
	[Day] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [WorkOncePerDay]    Script Date: 2021-05-02 16:24:12 ******/
ALTER TABLE [dbo].[Schedule] ADD  CONSTRAINT [WorkOncePerDay] UNIQUE NONCLUSTERED 
(
	[EmplyoyeeID] ASC,
	[Day] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [OneUsedCodePerCustomer]    Script Date: 2021-05-02 16:24:12 ******/
ALTER TABLE [dbo].[UsedDiscountCode] ADD  CONSTRAINT [OneUsedCodePerCustomer] UNIQUE NONCLUSTERED 
(
	[CustomerID] ASC,
	[DiscountCodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [OnlyOneOrderID]    Script Date: 2021-05-02 16:24:12 ******/
ALTER TABLE [dbo].[UsedDiscountCode] ADD  CONSTRAINT [OnlyOneOrderID] UNIQUE NONCLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Store] FOREIGN KEY([FavoriteStoreID])
REFERENCES [dbo].[Store] ([ID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Store]
GO
ALTER TABLE [dbo].[OpeningHour]  WITH CHECK ADD  CONSTRAINT [FK_OpeningHours_Store] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store] ([ID])
GO
ALTER TABLE [dbo].[OpeningHour] CHECK CONSTRAINT [FK_OpeningHours_Store]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
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
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Employee] FOREIGN KEY([EmplyoyeeID])
REFERENCES [dbo].[Employee] ([ID])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Employee]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Store] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store] ([ID])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Store]
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
ALTER TABLE [dbo].[UsedDiscountCode]  WITH CHECK ADD  CONSTRAINT [FK_ValidDiscountCode_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([ID])
GO
ALTER TABLE [dbo].[UsedDiscountCode] CHECK CONSTRAINT [FK_ValidDiscountCode_Customer]
GO
ALTER TABLE [dbo].[UsedDiscountCode]  WITH CHECK ADD  CONSTRAINT [FK_ValidDiscountCode_DiscountCode] FOREIGN KEY([DiscountCodeID])
REFERENCES [dbo].[DiscountCode] ([ID])
GO
ALTER TABLE [dbo].[UsedDiscountCode] CHECK CONSTRAINT [FK_ValidDiscountCode_DiscountCode]
GO
ALTER TABLE [dbo].[UsedDiscountCode]  WITH CHECK ADD  CONSTRAINT [FK_ValidDiscountCode_Order1] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([ID])
GO
ALTER TABLE [dbo].[UsedDiscountCode] CHECK CONSTRAINT [FK_ValidDiscountCode_Order1]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [ValidLastFour] CHECK  (([LastFour] like '[0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [ValidLastFour]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [ValidMembershipLevel] CHECK  (([MembershipLevel]='Bronze' OR [MembershipLevel]='Silver' OR [MembershipLevel]='Gold'))
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [ValidMembershipLevel]
GO
ALTER TABLE [dbo].[DiscountCode]  WITH CHECK ADD  CONSTRAINT [MaximumMinimumPercentage] CHECK  (([Percentage]<=(100) AND [Percentage]>=(0)))
GO
ALTER TABLE [dbo].[DiscountCode] CHECK CONSTRAINT [MaximumMinimumPercentage]
GO
ALTER TABLE [dbo].[DiscountCode]  WITH CHECK ADD  CONSTRAINT [MinimumCodeLength] CHECK  ((len([Code])>=(6)))
GO
ALTER TABLE [dbo].[DiscountCode] CHECK CONSTRAINT [MinimumCodeLength]
GO
ALTER TABLE [dbo].[OpeningHour]  WITH CHECK ADD  CONSTRAINT [OpensBeforeCloses] CHECK  (([Closes]>[Opens]))
GO
ALTER TABLE [dbo].[OpeningHour] CHECK CONSTRAINT [OpensBeforeCloses]
GO
ALTER TABLE [dbo].[OpeningHour]  WITH CHECK ADD  CONSTRAINT [WeekdayOpeningHours] CHECK  (([Day]='Sunday' OR [Day]='Saturday' OR [Day]='Friday' OR [Day]='Thursday' OR [Day]='Wednesday' OR [Day]='Tuesday' OR [Day]='Monday'))
GO
ALTER TABLE [dbo].[OpeningHour] CHECK CONSTRAINT [WeekdayOpeningHours]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [NotAboveHundredPercent] CHECK  (([PercentageDiscount]<=(100)))
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [NotAboveHundredPercent]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [OneValidDiscount] CHECK  ((NOT ([FixedDiscount]<>(0) AND [PercentageDiscount]<>(0)) AND [FixedDiscount]>=(0) AND [PercentageDiscount]>=(0)))
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [OneValidDiscount]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [PriceOneAboveDiscount] CHECK  (([Price]>=([FixedDiscount]+(1))))
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [PriceOneAboveDiscount]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [StartBeforeEnd] CHECK  (([End]>[Start]))
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [StartBeforeEnd]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [WeekdaySchedule] CHECK  (([Day]='Sunday' OR [Day]='Saturday' OR [Day]='Friday' OR [Day]='Thursday' OR [Day]='Wednesday' OR [Day]='Tuesday' OR [Day]='Monday'))
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [WeekdaySchedule]
GO
USE [master]
GO
ALTER DATABASE [Assignment2] SET  READ_WRITE 
GO
