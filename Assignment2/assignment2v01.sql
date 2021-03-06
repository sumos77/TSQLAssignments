USE [master]
GO
/****** Object:  Database [Assignment2]    Script Date: 2021-04-23 17:07:54 ******/
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
/****** Object:  Table [dbo].[Customer]    Script Date: 2021-04-23 17:07:54 ******/
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
/****** Object:  Table [dbo].[CustomerDiscountCode]    Script Date: 2021-04-23 17:07:54 ******/
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
/****** Object:  Table [dbo].[DiscountCode]    Script Date: 2021-04-23 17:07:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountCode](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nchar](10) NOT NULL,
	[Percentage] [int] NOT NULL,
 CONSTRAINT [PK_DiscountCode] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 2021-04-23 17:07:54 ******/
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
/****** Object:  Table [dbo].[EmployeeSchedule]    Script Date: 2021-04-23 17:07:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeSchedule](
	[EmplyeeID] [int] NOT NULL,
	[ScheduleID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[Day] [tinyint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FixedDiscount]    Script Date: 2021-04-23 17:07:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FixedDiscount](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SEK] [decimal](18, 0) NOT NULL,
	[ProductDiscountID] [int] NOT NULL,
 CONSTRAINT [PK_FixedDiscount] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OpeningHours]    Script Date: 2021-04-23 17:07:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OpeningHours](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NOT NULL,
	[Start] [time](7) NOT NULL,
	[End] [time](7) NOT NULL,
	[Day] [tinyint] NOT NULL,
 CONSTRAINT [PK_OpeningHours] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 2021-04-23 17:07:54 ******/
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
/****** Object:  Table [dbo].[OrderRow]    Script Date: 2021-04-23 17:07:54 ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 2021-04-23 17:07:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[Manufacturer] [nvarchar](50) NOT NULL,
	[Weight] [int] NOT NULL,
	[Width] [int] NOT NULL,
	[Height] [int] NOT NULL,
	[Length] [int] NOT NULL,
	[WebShopID] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductDiscount]    Script Date: 2021-04-23 17:07:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDiscount](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderRowID] [int] NOT NULL,
 CONSTRAINT [PK_ProductDiscount] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPercentage]    Script Date: 2021-04-23 17:07:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPercentage](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Percentage] [decimal](18, 0) NOT NULL,
	[ProductDiscountID] [int] NOT NULL,
 CONSTRAINT [PK_ProductPercentage] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchasedProduct]    Script Date: 2021-04-23 17:07:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchasedProduct](
	[StockID] [int] NOT NULL,
	[FixedDiscountID] [int] NOT NULL,
	[ProductPercentageID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 2021-04-23 17:07:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Start] [time](7) NOT NULL,
	[End] [time](7) NOT NULL,
 CONSTRAINT [PK_Schedule] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 2021-04-23 17:07:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[StoreID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Store]    Script Date: 2021-04-23 17:07:54 ******/
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
	[ManagerID] [int] NOT NULL,
 CONSTRAINT [PK_Store] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebShop]    Script Date: 2021-04-23 17:07:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebShop](
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_WebShop] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
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
ALTER TABLE [dbo].[EmployeeSchedule]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeSchedule_Employee] FOREIGN KEY([EmplyeeID])
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
ALTER TABLE [dbo].[FixedDiscount]  WITH CHECK ADD  CONSTRAINT [FK_FixedDiscount_ProductDiscount] FOREIGN KEY([ProductDiscountID])
REFERENCES [dbo].[ProductDiscount] ([ID])
GO
ALTER TABLE [dbo].[FixedDiscount] CHECK CONSTRAINT [FK_FixedDiscount_ProductDiscount]
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
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_WebShop] FOREIGN KEY([WebShopID])
REFERENCES [dbo].[WebShop] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_WebShop]
GO
ALTER TABLE [dbo].[ProductDiscount]  WITH CHECK ADD  CONSTRAINT [FK_ProductDiscount_OrderRow] FOREIGN KEY([OrderRowID])
REFERENCES [dbo].[OrderRow] ([ID])
GO
ALTER TABLE [dbo].[ProductDiscount] CHECK CONSTRAINT [FK_ProductDiscount_OrderRow]
GO
ALTER TABLE [dbo].[ProductPercentage]  WITH CHECK ADD  CONSTRAINT [FK_ProductPercentage_ProductDiscount] FOREIGN KEY([ProductDiscountID])
REFERENCES [dbo].[ProductDiscount] ([ID])
GO
ALTER TABLE [dbo].[ProductPercentage] CHECK CONSTRAINT [FK_ProductPercentage_ProductDiscount]
GO
ALTER TABLE [dbo].[PurchasedProduct]  WITH CHECK ADD  CONSTRAINT [FK_PurchasedProduct_FixedDiscount] FOREIGN KEY([FixedDiscountID])
REFERENCES [dbo].[FixedDiscount] ([ID])
GO
ALTER TABLE [dbo].[PurchasedProduct] CHECK CONSTRAINT [FK_PurchasedProduct_FixedDiscount]
GO
ALTER TABLE [dbo].[PurchasedProduct]  WITH CHECK ADD  CONSTRAINT [FK_PurchasedProduct_ProductPercentage] FOREIGN KEY([ProductPercentageID])
REFERENCES [dbo].[ProductPercentage] ([ID])
GO
ALTER TABLE [dbo].[PurchasedProduct] CHECK CONSTRAINT [FK_PurchasedProduct_ProductPercentage]
GO
ALTER TABLE [dbo].[PurchasedProduct]  WITH CHECK ADD  CONSTRAINT [FK_PurchasedProduct_Stock] FOREIGN KEY([StockID])
REFERENCES [dbo].[Stock] ([ID])
GO
ALTER TABLE [dbo].[PurchasedProduct] CHECK CONSTRAINT [FK_PurchasedProduct_Stock]
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
USE [master]
GO
ALTER DATABASE [Assignment2] SET  READ_WRITE 
GO
