USE [master]
GO
/****** Object:  Database [Fat4Fun]    Script Date: 2024/10/8 上午 09:00:49 ******/
CREATE DATABASE [Fat4Fun]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'0909test', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\0909test.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'0909test_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\0909test_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Fat4Fun] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Fat4Fun].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Fat4Fun] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Fat4Fun] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Fat4Fun] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Fat4Fun] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Fat4Fun] SET ARITHABORT OFF 
GO
ALTER DATABASE [Fat4Fun] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Fat4Fun] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Fat4Fun] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Fat4Fun] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Fat4Fun] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Fat4Fun] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Fat4Fun] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Fat4Fun] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Fat4Fun] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Fat4Fun] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Fat4Fun] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Fat4Fun] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Fat4Fun] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Fat4Fun] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Fat4Fun] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Fat4Fun] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Fat4Fun] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Fat4Fun] SET RECOVERY FULL 
GO
ALTER DATABASE [Fat4Fun] SET  MULTI_USER 
GO
ALTER DATABASE [Fat4Fun] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Fat4Fun] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Fat4Fun] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Fat4Fun] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Fat4Fun] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Fat4Fun] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Fat4Fun', N'ON'
GO
ALTER DATABASE [Fat4Fun] SET QUERY_STORE = ON
GO
ALTER DATABASE [Fat4Fun] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Fat4Fun]
GO
/****** Object:  User [sa5]    Script Date: 2024/10/8 上午 09:00:50 ******/
CREATE USER [sa5] FOR LOGIN [sa5] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [sa5]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 2024/10/8 上午 09:00:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 2024/10/8 上午 09:00:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[ProductSkuId] [int] NOT NULL,
	[SkuItemId] [int] NULL,
	[Qty] [int] NOT NULL,
 CONSTRAINT [PK_Carts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 2024/10/8 上午 09:00:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Path] [nvarchar](max) NOT NULL,
	[Sort] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberFollowLists]    Script Date: 2024/10/8 上午 09:00:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberFollowLists](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_MemberFollowLists] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 2024/10/8 上午 09:00:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductSkuId] [int] NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[SkuItemId] [int] NULL,
	[SkuItemName] [nvarchar](50) NULL,
	[Price] [int] NOT NULL,
	[Qty] [int] NOT NULL,
	[SubTotal] [int] NOT NULL,
 CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2024/10/8 上午 09:00:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[No] [varchar](50) NOT NULL,
	[PaymentMethod] [int] NOT NULL,
	[TotalAmount] [int] NOT NULL,
	[ShippingMethod] [int] NOT NULL,
	[RecipientName] [nvarchar](50) NOT NULL,
	[ShippingAddress] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](10) NOT NULL,
	[Status] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ModifyDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 2024/10/8 上午 09:00:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_ProductCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2024/10/8 上午 09:00:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BrandId] [int] NOT NULL,
	[ProductCategoryId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Status] [bit] NOT NULL,
	[Look] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ModifyDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSkus]    Script Date: 2024/10/8 上午 09:00:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSkus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Price] [int] NOT NULL,
	[Sale] [int] NOT NULL,
 CONSTRAINT [PK_ProductSkus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 2024/10/8 上午 09:00:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Role] [int] NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolesString]    Script Date: 2024/10/8 上午 09:00:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolesString](
	[Id] [int] IDENTITY(0,1) NOT NULL,
	[Roles] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_RolesString] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SkuItems]    Script Date: 2024/10/8 上午 09:00:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SkuItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductSkuId] [int] NOT NULL,
	[key] [nvarchar](50) NOT NULL,
	[value] [nvarchar](50) NOT NULL,
	[Price] [int] NULL,
 CONSTRAINT [PK_SkuItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2024/10/8 上午 09:00:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Gender] [bit] NOT NULL,
	[Account] [varchar](50) NOT NULL,
	[Password] [nvarchar](64) NOT NULL,
	[Phone] [varchar](20) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Address] [nvarchar](150) NOT NULL,
	[Status] [bit] NOT NULL,
	[IsConfirmed] [bit] NULL,
	[ConfirmCode] [varchar](70) NULL,
	[CreateDate] [datetime] NOT NULL,
	[ModifyDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Members] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([Id], [Name], [DisplayOrder], [Status]) VALUES (15, N'華碩', 1, 1)
INSERT [dbo].[Brands] ([Id], [Name], [DisplayOrder], [Status]) VALUES (16, N'羅技', 1, 1)
INSERT [dbo].[Brands] ([Id], [Name], [DisplayOrder], [Status]) VALUES (17, N'技嘉', 1, 1)
INSERT [dbo].[Brands] ([Id], [Name], [DisplayOrder], [Status]) VALUES (18, N'微星', 1, 1)
INSERT [dbo].[Brands] ([Id], [Name], [DisplayOrder], [Status]) VALUES (19, N'宏碁', 1, 1)
INSERT [dbo].[Brands] ([Id], [Name], [DisplayOrder], [Status]) VALUES (20, N'海盜船', 1, 1)
INSERT [dbo].[Brands] ([Id], [Name], [DisplayOrder], [Status]) VALUES (21, N'雷蛇', 1, 1)
INSERT [dbo].[Brands] ([Id], [Name], [DisplayOrder], [Status]) VALUES (22, N'INTEL', 1, 1)
INSERT [dbo].[Brands] ([Id], [Name], [DisplayOrder], [Status]) VALUES (23, N'AMD', 1, 1)
INSERT [dbo].[Brands] ([Id], [Name], [DisplayOrder], [Status]) VALUES (24, N'金士頓', 1, 1)
INSERT [dbo].[Brands] ([Id], [Name], [DisplayOrder], [Status]) VALUES (25, N'美光', 1, 1)
SET IDENTITY_INSERT [dbo].[Brands] OFF
GO
SET IDENTITY_INSERT [dbo].[Carts] ON 

INSERT [dbo].[Carts] ([Id], [UserId], [ProductSkuId], [SkuItemId], [Qty]) VALUES (184, 50, 9, NULL, 1)
INSERT [dbo].[Carts] ([Id], [UserId], [ProductSkuId], [SkuItemId], [Qty]) VALUES (189, 64, 32, NULL, 1)
INSERT [dbo].[Carts] ([Id], [UserId], [ProductSkuId], [SkuItemId], [Qty]) VALUES (193, 64, 34, NULL, 1)
INSERT [dbo].[Carts] ([Id], [UserId], [ProductSkuId], [SkuItemId], [Qty]) VALUES (197, 71, 22, NULL, 1)
SET IDENTITY_INSERT [dbo].[Carts] OFF
GO
SET IDENTITY_INSERT [dbo].[Images] ON 

INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (1, 15, N'/Images/27f51c63-9951-4670-be1a-50313eb90630.jpg', 0, CAST(N'2024-10-04T13:56:00.473' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (2, 16, N'/Images/df8508c4-4a3e-4659-b9a7-d9359b3ec77e.jpg', 0, CAST(N'2024-10-04T12:43:02.930' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (3, 17, N'/Images/b9dc63ad-06dd-45ed-8c1a-12ca720f5149.jpg', 0, CAST(N'2024-10-04T12:35:43.230' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (4, 18, N'/Images/a74b95dc-1fb4-42a5-96aa-c92ae4f9108d.jpg', 0, CAST(N'2024-10-04T12:39:55.263' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (5, 19, N'/Images/26ccd030-d115-4063-b791-448b3493621b.jpg', 0, CAST(N'2024-10-04T12:47:08.580' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (6, 20, N'/Images/ac4ddd52-53f5-4e08-9626-60d568af20af.jpg', 0, CAST(N'2024-10-04T12:50:17.877' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (7, 21, N'/Images/02bc568a-77e5-4e9c-bc75-11fc8d59ca72.jpg', 0, CAST(N'2024-10-04T12:45:48.717' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (8, 22, N'/Images/29e4b4f2-c1b9-4540-9620-03fc706400c0.jpg', 0, CAST(N'2024-10-04T12:32:47.253' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (9, 23, N'/Images/be940cdc-1517-4562-b513-dbbfb6fa1cd3.jpg', 0, CAST(N'2024-10-04T12:44:18.133' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (10, 24, N'/Images/c33d5d9b-ef91-4e43-a399-b197fff007e8.jpg', 0, CAST(N'2024-10-04T12:37:42.030' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (11, 25, N'/Images/1e73e3c6-f2e9-4c76-af48-a8acb848627f.jpg', 0, CAST(N'2024-10-04T12:28:35.170' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (12, 26, N'/Images/4b10cd36-930d-42d8-9b3b-c3e31e1e85ae.jpg', 0, CAST(N'2024-10-04T12:48:29.753' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (13, 27, N'/Images/f2f8379b-b7f2-43b6-b68b-a1bb724bdc1d.jpg', 0, CAST(N'2024-10-04T13:52:08.500' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (14, 28, N'image/a1.jpg', 0, CAST(N'2024-09-22T00:23:48.043' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (15, 29, N'/Images/monkeylogo.jpg', 0, CAST(N'2024-09-30T12:42:51.003' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (16, 30, N'/Images/cc0d59dc-8cbf-48ac-b0ef-60ef8ae22f25.jpg', 0, CAST(N'2024-10-04T13:54:42.087' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (17, 31, N'/Images/22eb62e9-314b-42c6-972c-920bc1e3750a.jpg', 0, CAST(N'2024-10-04T13:55:27.767' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (18, 32, N'/Images/266a9e74-8d9f-46f6-b815-3e053614ca75.jpg', 0, CAST(N'2024-10-04T13:54:00.330' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (19, 33, N'/Images/1b84b497-faa4-47cf-b3f2-8c9b43a0018e.jpg', 0, CAST(N'2024-10-04T13:53:36.100' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (20, 34, N'/Images/01b6bbf6-2c7d-4b11-9959-cee7e8481d13.jpg', 0, CAST(N'2024-10-04T13:54:22.473' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (21, 35, N'/Images/a79376f4-6d1a-451f-bd45-a68fcad72521.jpg', 0, CAST(N'2024-10-04T13:51:11.677' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (22, 36, N'/Images/b331ed60-2b70-4eed-9961-d9566ebd1784.jpg', 0, CAST(N'2024-10-04T13:50:29.803' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (23, 37, N'/Images/8a5fdaf8-fd74-450e-adc6-d98ebd3171da.jpg', 0, CAST(N'2024-10-04T13:52:52.293' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (24, 38, N'/Images/fff86126-14cc-4a78-a707-a73e29afa3c5.jpg', 0, CAST(N'2024-10-04T13:50:48.367' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (25, 39, N'/Images/3a575f02-6727-4f3d-a6ae-e23afb2a2d8b.jpg', 0, CAST(N'2024-10-04T13:52:27.113' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (26, 40, N'/Images/63799b85-d99f-40f6-af5b-96d28df9f6d2.jpg', 0, CAST(N'2024-10-04T13:58:19.437' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (27, 41, N'/Images/7c4973ed-5011-4ba9-86d0-c5f2d8063b78.jpg', 0, CAST(N'2024-10-04T13:58:38.990' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (28, 42, N'/Images/9f226e62-c9f6-4f6c-ae89-93e681f5945f.jpg', 0, CAST(N'2024-10-04T13:57:52.690' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (29, 43, N'/Images/26d3d20f-bb3c-4510-bcc7-67621604daeb.jpg', 0, CAST(N'2024-10-04T13:57:09.427' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (30, 44, N'/Images/f9fb3742-2c58-4672-a61f-c422cb83ef84.jpg', 0, CAST(N'2024-10-04T13:56:22.497' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (31, 45, N'/Images/5ede45e6-aea0-464f-b6df-f5dbc56320ea.jpg', 0, CAST(N'2024-10-04T13:47:47.677' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (32, 46, N'/Images/fbc5c1b0-0ae4-4c10-a506-73ee9df5a3c0.jpg', 0, CAST(N'2024-10-04T13:48:38.450' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (33, 47, N'/Images/606fff4d-bbfd-4f69-b1e8-369b13b61ba0.jpg', 0, CAST(N'2024-10-07T21:06:56.967' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (34, 48, N'/Images/1c4dd349-981a-4520-abe8-9ebba2449dee.jpg', 0, CAST(N'2024-10-04T13:48:15.900' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (35, 49, N'/Images/cf40de7a-1a23-423a-9161-6e0438c3fbc0.jpg', 0, CAST(N'2024-10-04T13:49:07.753' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (36, 15, N'/Images/b9235d29-4398-463a-a58b-d5b80486c121.jpg', 1, CAST(N'2024-10-04T13:56:05.210' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (37, 16, N'/Images/019f6e7b-b878-4838-9c42-a39eaa3daa12.jpg', 1, CAST(N'2024-10-04T12:43:12.317' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (38, 17, N'/Images/08e30496-6451-4d2c-a335-d5fe31383484.jpg', 1, CAST(N'2024-10-04T12:35:54.327' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (39, 18, N'/Images/b345e520-4b55-4d51-9d54-d32473fb46be.jpg', 1, CAST(N'2024-10-04T12:40:06.763' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (40, 19, N'/Images/c0dab4a1-8ddc-42c9-97a8-c5d70de76f7a.jpg', 1, CAST(N'2024-10-04T12:47:17.037' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (41, 20, N'/Images/79ece5e8-c6ba-40de-b8c4-242d7f810486.jpg', 1, CAST(N'2024-10-04T12:50:25.577' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (42, 21, N'/Images/8be504a4-0bfa-44f2-92d0-59d92e47cd4b.jpg', 1, CAST(N'2024-10-04T12:45:55.877' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (43, 22, N'/Images/8838bb69-7b47-4ada-8a5f-a40f047f9b2d.jpg', 1, CAST(N'2024-10-04T12:33:08.720' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (44, 23, N'/Images/64767d62-18f6-43d3-bdfc-d77b36d36435.jpg', 1, CAST(N'2024-10-04T12:44:28.923' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (45, 24, N'/Images/3d84ccd6-f434-4c75-bf4a-d20c5440cbc8.jpg', 1, CAST(N'2024-10-04T12:37:50.543' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (46, 25, N'/Images/7d801540-6354-4ccb-83e1-6eba6a8d5d66.jpg', 1, CAST(N'2024-10-04T12:28:57.803' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (47, 26, N'/Images/063647bc-e46f-4422-8375-0f230921e41b.jpg', 1, CAST(N'2024-10-04T12:48:37.587' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (48, 27, N'/Images/bae6c011-9558-4ba0-9f8d-62bfc83c68ad.jpg', 1, CAST(N'2024-10-04T13:51:52.360' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (49, 28, N'image/a2.jpg', 1, CAST(N'2024-09-22T00:44:03.237' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (50, 29, N'image/a2.jpg', 1, CAST(N'2024-09-22T00:44:03.237' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (51, 30, N'/Images/e1a3872e-e979-48e8-ba03-613c61e7b1f2.jpg', 1, CAST(N'2024-10-04T13:54:48.443' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (52, 31, N'/Images/a9ef7d9c-1b0a-4a9d-80f7-ee909a056fe8.jpg', 1, CAST(N'2024-10-04T13:55:34.290' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (53, 32, N'/Images/7c5fe554-8f1d-4ad9-8d34-5a06b81318b9.jpg', 1, CAST(N'2024-10-04T13:54:06.230' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (54, 33, N'/Images/135315f5-10f7-4cd0-8482-bb2e19bd97a8.jpg', 1, CAST(N'2024-10-04T13:53:43.933' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (55, 34, N'/Images/ef2dc352-1865-480e-ba10-207ae1adc3b4.jpg', 1, CAST(N'2024-10-04T13:54:27.813' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (56, 35, N'/Images/3f58261b-62d8-4036-a2f3-dc45e9d29905.jpg', 1, CAST(N'2024-10-04T13:51:16.807' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (57, 36, N'/Images/0fa0337c-aeb9-4bc7-9157-4193e73e025f.jpg', 1, CAST(N'2024-10-04T13:50:35.077' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (58, 37, N'/Images/43f08906-95c1-42a6-806f-015a2baaa329.jpg', 1, CAST(N'2024-10-04T13:52:59.077' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (59, 38, N'/Images/59327afa-1506-478b-a464-3b2aff06ea1d.jpg', 1, CAST(N'2024-10-04T13:50:54.277' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (60, 39, N'/Images/438274ad-b8a5-4879-8359-0840ac5e89cd.jpg', 1, CAST(N'2024-10-04T13:52:36.523' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (61, 40, N'/Images/e18ec3f5-abd9-4107-9591-5f32c6a6e7b2.jpg', 1, CAST(N'2024-10-04T13:58:25.153' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (62, 41, N'/Images/1e620103-65ed-4e3b-93d0-229cce9a6fb9.jpg', 1, CAST(N'2024-10-04T13:58:44.010' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (63, 42, N'/Images/b3c26c03-156b-4e2d-a752-2c53e9a320b0.jpg', 1, CAST(N'2024-10-04T13:57:57.877' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (64, 43, N'/Images/871a519a-a2c5-4aa1-b0b2-df67fdf844ef.jpg', 1, CAST(N'2024-10-04T13:57:17.580' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (65, 44, N'/Images/7f16612d-a7d1-4444-acf3-a579d7644f22.jpg', 1, CAST(N'2024-10-04T13:56:27.977' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (66, 45, N'/Images/ee57124c-e836-4641-a836-c465cf04fd3e.jpg', 1, CAST(N'2024-10-04T13:47:57.407' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (67, 46, N'/Images/be5c7177-b934-4bc5-8346-004d4ec2bddc.jpg', 1, CAST(N'2024-10-04T13:48:44.567' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (68, 47, N'/Images/25d0b4ed-f3e8-49af-98a6-b02c0ae7bd66.jpg', 1, CAST(N'2024-10-04T13:47:31.470' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (69, 48, N'/Images/67d9ae58-ba83-4a19-86a2-373765aafc9c.jpg', 1, CAST(N'2024-10-04T13:48:22.247' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (70, 49, N'/Images/6ccc7fcf-0d0c-41f0-a891-a982c918f6bd.jpg', 1, CAST(N'2024-10-04T13:49:13.390' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (71, 15, N'/Images/78f8ccd9-eb8a-4977-8bf5-e8137fbd8cd2.jpg', 2, CAST(N'2024-10-04T13:56:10.147' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (72, 16, N'/Images/31c2148d-3a75-40e4-bc4b-66c1a0912916.jpg', 2, CAST(N'2024-10-04T12:43:21.087' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (73, 17, N'/Images/a2f90786-3338-41ab-bb79-42de9ad846b3.jpg', 2, CAST(N'2024-10-04T12:36:06.847' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (74, 18, N'/Images/978fb5ba-cdea-4230-ba7f-7b2a260bcba6.jpg', 2, CAST(N'2024-10-04T12:40:31.147' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (75, 19, N'/Images/bad31fde-e543-4615-b749-7f7f5c64e70c.jpg', 2, CAST(N'2024-10-04T12:47:23.973' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (76, 20, N'/Images/de4b5d04-28ec-41f8-847a-37295871ddc1.jpg', 2, CAST(N'2024-10-04T12:50:48.850' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (77, 21, N'/Images/9191e2a1-2b4c-4c2c-98ba-fa759a78e681.jpg', 2, CAST(N'2024-10-04T12:46:02.593' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (78, 22, N'/Images/628ae80d-b355-4b59-aa8a-d05bb950184a.jpg', 2, CAST(N'2024-10-04T12:33:18.683' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (79, 23, N'/Images/88d1a7aa-0e7b-4bee-a5e0-b6be6552cf88.jpg', 2, CAST(N'2024-10-04T12:44:35.977' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (80, 24, N'/Images/dfde12ae-bec9-4922-ab67-4f3605cafada.jpg', 2, CAST(N'2024-10-04T12:38:01.810' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (81, 25, N'/Images/534d654d-6fdf-422c-a596-08cd0bb3b7ba.jpg', 2, CAST(N'2024-10-05T09:29:41.690' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (82, 26, N'/Images/6629693b-7480-4461-a3f7-640b201bf3ed.jpg', 2, CAST(N'2024-10-04T12:48:45.977' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (83, 27, N'/Images/bc6d5a46-965c-4fc8-87de-0ac1e16456cd.jpg', 2, CAST(N'2024-10-04T13:52:00.233' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (84, 28, N'image/a3.jpg', 2, CAST(N'2024-09-22T00:44:16.767' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (85, 29, N'image/a3.jpg', 2, CAST(N'2024-09-22T00:44:16.767' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (86, 30, N'/Images/a03537ad-0a08-44b5-b81e-0a04e3d2f4af.jpg', 2, CAST(N'2024-10-04T13:55:14.750' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (87, 31, N'/Images/17ca2a3d-8926-41a2-a183-a1d9cf215d67.jpg', 2, CAST(N'2024-10-04T13:55:40.113' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (88, 32, N'/Images/23580748-ddca-463d-9bee-21afb21b212c.jpg', 2, CAST(N'2024-10-04T13:54:11.733' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (89, 33, N'/Images/af6db3e7-7394-4adc-b83a-fa45a42e59c7.jpg', 2, CAST(N'2024-10-04T13:53:49.943' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (90, 34, N'/Images/bb8c8cff-d8ad-4b15-b9cf-838219bdd666.jpg', 2, CAST(N'2024-10-04T13:54:32.830' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (91, 35, N'/Images/210e78ca-064d-46d3-8b17-bcbb00e845de.jpg', 2, CAST(N'2024-10-04T13:51:22.567' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (92, 36, N'/Images/5a2ab779-35fe-4fdd-9069-9f0446b37605.jpg', 2, CAST(N'2024-10-04T13:50:40.647' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (93, 37, N'/Images/9adeeb03-8960-4cea-8d83-1d311ed131b5.jpg', 2, CAST(N'2024-10-04T13:53:04.493' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (94, 38, N'/Images/4fc8c8e8-402d-4b90-9792-a40be7880ea2.jpg', 2, CAST(N'2024-10-04T13:51:00.990' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (95, 39, N'/Images/b8da6c7c-4fc1-4cb5-8183-a83406f00e5a.jpg', 2, CAST(N'2024-10-04T13:52:42.577' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (96, 40, N'/Images/52969ad5-7985-4b8c-bcdc-01d484529454.jpg', 2, CAST(N'2024-10-04T13:58:29.933' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (97, 41, N'/Images/cf6f5714-127e-4e69-a48e-6e1cca1c6ff7.jpg', 2, CAST(N'2024-10-04T13:58:48.830' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (98, 42, N'/Images/18d6dfb5-250f-4383-b57e-5532ac118530.jpg', 2, CAST(N'2024-10-04T14:22:50.230' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (99, 43, N'/Images/f30060e1-c238-4bf9-9995-5ff4bbf0a4fd.jpg', 2, CAST(N'2024-10-04T13:57:26.773' AS DateTime))
GO
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (100, 44, N'/Images/3046f049-79e2-4a18-9cfe-1698c04b034b.jpg', 2, CAST(N'2024-10-04T13:56:51.507' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (101, 45, N'/Images/e4a48da0-3b6b-48e6-8bc1-e218bf07036b.jpg', 2, CAST(N'2024-10-04T13:48:04.803' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (102, 46, N'/Images/0f41ef49-fa60-4b0f-a16a-83ae5847abd8.jpg', 2, CAST(N'2024-10-04T13:48:51.307' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (103, 47, N'/Images/0d039274-c48b-419b-9cf3-5af05a57a728.jpg', 2, CAST(N'2024-10-04T13:47:36.700' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (104, 48, N'/Images/5cacaedf-4701-4306-9bc3-68edc3453e47.jpg', 2, CAST(N'2024-10-04T13:48:27.800' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (105, 49, N'/Images/3c66650b-9791-44d5-9bf9-0100383164e7.jpg', 2, CAST(N'2024-10-04T13:49:18.600' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (109, 68, N'/Images/772abc1d-51a0-49a2-a47b-6bcc8b46aeb5.jpg', 0, CAST(N'2024-10-04T12:53:11.873' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (110, 68, N'/Images/6437851b-9ac9-44d2-aca3-adfbbd133eb7.jpg', 1, CAST(N'2024-10-04T12:53:20.610' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (111, 68, N'/Images/7764210c-f6d6-49ae-9c06-5636ce8c97e6.jpg', 2, CAST(N'2024-10-04T12:53:32.683' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (112, 74, N'/Images/f02135cc-8844-4ba2-af3a-050b7d79e46d.jpg', 0, CAST(N'2024-10-04T12:53:48.440' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (113, 74, N'/Images/177191a0-6200-4574-a60d-2891611b7f42.jpg', 1, CAST(N'2024-10-04T12:53:59.603' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (114, 74, N'/Images/3798cba0-115f-4e00-b04f-55824110f816.jpg', 2, CAST(N'2024-10-04T12:54:08.883' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (115, 73, N'/Images/0c3c1b0d-2fae-4f99-b710-f5704e488eba.jpg', 0, CAST(N'2024-10-04T12:54:21.400' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (116, 73, N'/Images/13eda9e4-0e9b-4d33-be6f-3b89f6bfb176.jpg', 1, CAST(N'2024-10-04T12:54:30.167' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (117, 73, N'/Images/3c89f9ec-d9b2-463b-82c3-6d8a1f397069.jpg', 2, CAST(N'2024-10-04T12:54:38.103' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (118, 75, N'/Images/b8370a8b-da71-4349-88d8-f85603c4c751.jpg', 0, CAST(N'2024-10-04T14:55:18.290' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (119, 75, N'/Images/b3f6d101-b066-40b9-a7b8-0c7a1e261ac2.jpg', 1, CAST(N'2024-10-04T14:55:40.300' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (120, 75, N'/Images/fc19b85f-c8ad-48df-a96f-5e09a5746ff7.jpg', 2, CAST(N'2024-10-04T14:55:51.533' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (121, 76, N'/Images/d41ef33a-23ac-44b4-89c6-07c05d3281c6.jpg', 0, CAST(N'2024-10-04T15:40:13.090' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (122, 76, N'/Images/56764033-6e78-46c1-a9b0-d596989492f0.jpg', 1, CAST(N'2024-10-04T15:40:25.630' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (123, 76, N'/Images/20e31841-0759-4b14-baaf-afe1a4e157f2.jpg', 2, CAST(N'2024-10-04T15:40:34.503' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (124, 77, N'/Images/e23644d2-7df1-4395-b626-a2da3cc9513d.jpg', 0, CAST(N'2024-10-04T21:35:28.063' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (125, 77, N'/Images/94a6a552-9927-4a77-b6d3-2dc6723f2386.jpg', 1, CAST(N'2024-10-04T21:36:19.883' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (126, 77, N'/Images/04f69608-247d-46bf-8387-71647bfa7a86.jpg', 2, CAST(N'2024-10-04T21:35:59.330' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (127, 78, N'/Images/313e3059-12f1-4874-b0cf-3ef0bb5dbfc0.jpg', 0, CAST(N'2024-10-05T13:13:38.023' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (128, 78, N'/Images/e48c1208-b9ed-4eb3-a7fc-bfdf0264528e.jpg', 1, CAST(N'2024-10-05T13:13:52.100' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (129, 78, N'/Images/0aa130fa-0902-4d48-83b2-dee22a8d931e.jpg', 2, CAST(N'2024-10-05T13:14:02.560' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (130, 79, N'/Images/99792891-d2ea-4cee-989c-67eaa97232fd.jpg', 0, CAST(N'2024-10-07T15:08:25.403' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (131, 79, N'/Images/66efab50-0a1a-4c08-8642-4b6dda35e179.jpg', 1, CAST(N'2024-10-07T15:08:34.453' AS DateTime))
INSERT [dbo].[Images] ([Id], [ProductId], [Path], [Sort], [CreateDate]) VALUES (132, 79, N'/Images/b46953cf-9e32-465f-ba51-22f86fc8a588.jpg', 2, CAST(N'2024-10-07T15:08:45.370' AS DateTime))
SET IDENTITY_INSERT [dbo].[Images] OFF
GO
SET IDENTITY_INSERT [dbo].[MemberFollowLists] ON 

INSERT [dbo].[MemberFollowLists] ([Id], [UserId], [ProductId], [Name], [CreateDate]) VALUES (29, 49, 48, N'宏碁Predator Orion 3000', CAST(N'2024-10-02T19:46:33.067' AS DateTime))
INSERT [dbo].[MemberFollowLists] ([Id], [UserId], [ProductId], [Name], [CreateDate]) VALUES (30, 50, 32, N'華碩ROG Strix Scar 15', CAST(N'2024-10-02T20:09:17.143' AS DateTime))
INSERT [dbo].[MemberFollowLists] ([Id], [UserId], [ProductId], [Name], [CreateDate]) VALUES (31, 50, 15, N'華碩敗家之眼12', CAST(N'2024-10-05T16:17:50.470' AS DateTime))
INSERT [dbo].[MemberFollowLists] ([Id], [UserId], [ProductId], [Name], [CreateDate]) VALUES (32, 50, 17, N'Intel i7-12700K', CAST(N'2024-10-05T16:19:17.800' AS DateTime))
INSERT [dbo].[MemberFollowLists] ([Id], [UserId], [ProductId], [Name], [CreateDate]) VALUES (33, 50, 25, N'AMD RX 6900 XT', CAST(N'2024-10-06T04:06:14.183' AS DateTime))
INSERT [dbo].[MemberFollowLists] ([Id], [UserId], [ProductId], [Name], [CreateDate]) VALUES (34, 69, 79, N'ASUS ROG Zephyrus G14 ', CAST(N'2024-10-07T15:09:13.247' AS DateTime))
INSERT [dbo].[MemberFollowLists] ([Id], [UserId], [ProductId], [Name], [CreateDate]) VALUES (39, 71, 45, N'宏碁Predator Helios 300', CAST(N'2024-10-07T16:37:29.253' AS DateTime))
SET IDENTITY_INSERT [dbo].[MemberFollowLists] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItems] ON 

INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (12, 5, 34, N'宏碁 I5-13600K/512G/16G/RTX4060', NULL, N'No Spec', 38000, 2, 76000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (13, 5, 32, N'宏碁Predator Helios 300', NULL, N'No Spec', 48000, 1, 48000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (14, 6, 19, N'華碩 I9-13900K/1T/32G/RTX4090', 66, N'I9-13900K/2T/64G/RTX4090', 76000, 1, 76000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (15, 7, 16, N'宏碁I7-14600/500G/32G/RTX4060', NULL, N'No Spec', 38000, 1, 38000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (113, 31, 16, N'宏碁I7-14600/500G/32G/RTX4060', NULL, N'基本款', 38000, 1, 38000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (114, 31, 34, N'宏碁 I5-13600K/512G/16G/RTX4060', NULL, N'基本款', 38000, 1, 38000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (115, 31, 32, N'宏碁Predator Helios 300', 91, N'I7-13700H/512G/32G/RTX4070', 58000, 1, 58000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (116, 31, 32, N'宏碁Predator Helios 300', 92, N'I7-13700H/1T/64G/RTX4070', 63000, 1, 63000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (117, 32, 14, N'技嘉I7-14700/1T/16G/RTX4060', NULL, N'基本款', 43000, 2, 86000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (118, 32, 3, N'羅技電競滑鼠 ', NULL, N'基本款', 1800, 1, 1800)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (119, 32, 22, N'技嘉 I7-12700K/1T/32G/RTX4080', NULL, N'基本款', 50000, 1, 50000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (120, 33, 9, N'Corsair K70 RGB版', NULL, N'基本款', 4800, 1, 4800)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (121, 33, 11, N'Intel i9-13900K 旗艦版', NULL, N'基本款', 13000, 1, 13000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (122, 33, 16, N'宏碁I7-14600/500G/32G/RTX4060', 57, N'I7-14500/1T/32G/RTX3070', 45500, 1, 45500)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (123, 34, 34, N'宏碁 I5-13600K/512G/16G/RTX4060', NULL, N'基本款', 38000, 1, 38000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (124, 34, 11, N'Intel i9-13900K 旗艦版', NULL, N'基本款', 13000, 1, 13000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (125, 34, 8, N'宏碁 DDR4 16GB 記憶體條', NULL, N'基本款', 1300, 1, 1300)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (126, 34, 10, N'Razer DeathAdder 專業版', NULL, N'基本款', 2200, 1, 2200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (127, 35, 14, N'技嘉I7-14700/1T/16G/RTX4060', NULL, N'基本款', 43000, 1, 43000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (128, 35, 33, N'宏碁 R5-7600H/1T/16G/RTX4070', NULL, N'基本款', 53000, 1, 53000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (129, 35, 25, N'技嘉 I9-13900K/1T/32G/RTX4090', 78, N'I9-13900K/2T/64G/RTX4090', 71000, 4, 284000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (130, 36, 36, N'宏碁 R7-7730U/512G/16G/RTX4060', NULL, N'基本款', 60000, 2, 120000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (131, 36, 33, N'宏碁 R5-7600H/1T/16G/RTX4070', NULL, N'基本款', 53000, 1, 53000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (132, 37, 23, N'技嘉 R5-7600X/1T/16G/RTX4070', NULL, N'基本款', 45000, 1, 45000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (133, 37, 23, N'技嘉 R5-7600X/1T/16G/RTX4070', 73, N'R5-7600X/512G/16G/RTX4070', 54000, 1, 54000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (134, 37, 23, N'技嘉 R5-7600X/1T/16G/RTX4070', 74, N'R5-7600X/1T/32G/RTX4070', 58000, 1, 58000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (135, 38, 9, N'Corsair K70 RGB版', NULL, N'基本款', 4800, 1, 4800)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (136, 38, 35, N'宏碁 I9-13900K/1T/32G/RTX4090', NULL, N'基本款', 58000, 5, 290000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (137, 39, 34, N'宏碁 I5-13600K/512G/16G/RTX4060', NULL, N'基本款', 38000, 1, 38000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (138, 39, 32, N'宏碁Predator Helios 300', NULL, N'基本款', 48000, 1, 48000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (139, 39, 35, N'宏碁 I9-13900K/1T/32G/RTX4090', NULL, N'基本款', 58000, 1, 58000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (140, 39, 23, N'技嘉 R5-7600X/1T/16G/RTX4070', NULL, N'基本款', 45000, 1, 45000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (141, 39, 3, N'羅技電競滑鼠 ', NULL, N'基本款', 1800, 1, 1800)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (142, 39, 10, N'Razer DeathAdder 專業版', NULL, N'基本款', 2200, 1, 2200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (143, 40, 34, N'宏碁 I5-13600K/512G/16G/RTX4060', NULL, N'基本款', 38000, 1, 38000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (144, 40, 4, N'Intel i7-12700K 標準版', NULL, N'基本款', 11000, 1, 11000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (145, 40, 10, N'Razer DeathAdder 專業版', NULL, N'基本款', 2200, 1, 2200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (146, 40, 36, N'宏碁 R7-7730U/512G/16G/RTX4060', NULL, N'基本款', 60000, 1, 60000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (147, 40, 33, N'宏碁 R5-7600H/1T/16G/RTX4070', NULL, N'基本款', 53000, 2, 106000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (148, 41, 16, N'宏碁I7-14600/500G/32G/RTX4060', NULL, N'基本款', 38000, 1, 38000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (149, 41, 34, N'宏碁 I5-13600K/512G/16G/RTX4060', NULL, N'基本款', 38000, 5, 190000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (150, 42, 36, N'宏碁 R7-7730U/512G/16G/RTX4060', NULL, N'基本款', 60000, 1, 60000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (151, 43, 36, N'宏碁 R7-7730U/512G/16G/RTX4060', NULL, N'基本款', 60000, 3, 180000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (152, 43, 4, N'Intel i7-12700K 標準版', NULL, N'基本款', 11000, 1, 11000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (153, 44, 14, N'技嘉I7-14700/1T/16G/RTX4060', NULL, N'基本款', 43000, 1, 43000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (154, 44, 3, N'羅技電競滑鼠 ', NULL, N'基本款', 1800, 1, 1800)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (155, 45, 34, N'宏碁 I5-13600K/512G/16G/RTX4060', NULL, N'基本款', 38000, 1, 38000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (156, 45, 32, N'宏碁Predator Helios 300', NULL, N'基本款', 48000, 1, 48000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (157, 46, 16, N'宏碁I7-14600/500G/32G/RTX4060', NULL, N'基本款', 38000, 1, 38000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (158, 46, 34, N'宏碁 I5-13600K/512G/16G/RTX4060', NULL, N'基本款', 38000, 1, 38000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (159, 46, 32, N'宏碁Predator Helios 300', NULL, N'基本款', 48000, 1, 48000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (160, 47, 14, N'技嘉I7-14700/1T/16G/RTX4060', NULL, N'基本款', 43000, 1, 43000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (161, 47, 4, N'Intel i7-12700K 標準版', NULL, N'基本款', 11000, 1, 11000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (162, 47, 11, N'Intel i9-13900K 旗艦版', NULL, N'基本款', 13000, 1, 13000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (163, 47, 32, N'宏碁Predator Helios 300', 92, N'I7-13700H/1T/64G/RTX4070', 63000, 2, 126000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (164, 48, 16, N'宏碁I7-14600/500G/32G/RTX4060', NULL, N'基本款', 38000, 1, 38000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (165, 48, 34, N'宏碁 I5-13600K/512G/16G/RTX4060', NULL, N'基本款', 38000, 1, 38000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (166, 48, 32, N'宏碁Predator Helios 300', NULL, N'基本款', 48000, 1, 48000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (167, 48, 23, N'技嘉 R5-7600X/1T/16G/RTX4070', NULL, N'基本款', 45000, 1, 45000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (168, 48, 23, N'技嘉 R5-7600X/1T/16G/RTX4070', 74, N'R5-7600X/1T/32G/RTX4070', 58000, 1, 58000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (169, 49, 34, N'宏碁 I5-13600K/512G/16G/RTX4060', NULL, N'基本款', 38000, 1, 38000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (170, 50, 34, N'宏碁 I5-13600K/512G/16G/RTX4060', NULL, N'基本款', 38000, 1, 38000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (171, 50, 23, N'技嘉 R5-7600X/1T/16G/RTX4070', NULL, N'基本款', 45000, 3, 135000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (172, 50, 14, N'技嘉I7-14700/1T/16G/RTX4060', NULL, N'基本款', 43000, 2, 86000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (173, 51, 10, N'Razer DeathAdder 專業版', NULL, N'基本款', 2200, 1, 2200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (174, 51, 8, N'宏碁 DDR4 16GB 記憶體條', NULL, N'基本款', 1300, 1, 1300)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (175, 51, 5, N'Logitech G Pro X 鍵盤特別版', NULL, N'基本款', 3200, 1, 3200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (176, 52, 36, N'宏碁 R7-7730U/512G/16G/RTX4060', NULL, N'基本款', 60000, 1, 60000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (177, 52, 23, N'技嘉 R5-7600X/1T/16G/RTX4070', NULL, N'基本款', 45000, 1, 45000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (178, 52, 25, N'技嘉 I9-13900K/1T/32G/RTX4090', NULL, N'基本款', 53000, 1, 53000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (179, 52, 35, N'宏碁 I9-13900K/1T/32G/RTX4090', NULL, N'基本款', 58000, 1, 58000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (180, 53, 12, N'AMD RX 6900 XT 超頻版', NULL, N'基本款', 21000, 1, 21000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (181, 54, 34, N'宏碁 I5-13600K/512G/16G/RTX4060', NULL, N'基本款', 38000, 1, 38000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (182, 54, 32, N'宏碁Predator Helios 300', NULL, N'基本款', 48000, 5, 240000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (183, 54, 35, N'宏碁 I9-13900K/1T/32G/RTX4090', NULL, N'基本款', 58000, 1, 58000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (184, 54, 23, N'技嘉 R5-7600X/1T/16G/RTX4070', NULL, N'基本款', 45000, 1, 45000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (185, 54, 25, N'技嘉 I9-13900K/1T/32G/RTX4090', NULL, N'基本款', 53000, 1, 53000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (186, 55, 14, N'技嘉I7-14700/1T/16G/RTX4060', NULL, N'基本款', 43000, 4, 172000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (187, 55, 22, N'技嘉 I7-12700K/1T/32G/RTX4080', NULL, N'基本款', 50000, 1, 50000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (188, 55, 33, N'宏碁 R5-7600H/1T/16G/RTX4070', NULL, N'基本款', 53000, 1, 53000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (189, 56, 32, N'宏碁Predator Helios 300', NULL, N'基本款', 48000, 1, 48000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (190, 56, 35, N'宏碁 I9-13900K/1T/32G/RTX4090', NULL, N'基本款', 58000, 5, 290000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (191, 57, 12, N'AMD RX 6900 XT 超頻版', NULL, N'基本款', 21000, 1, 21000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (192, 58, 32, N'宏碁Predator Helios 300', NULL, N'基本款', 48000, 1, 48000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (193, 59, 2, N'華碩敗家之眼12', NULL, N'基本款', 32000, 1, 32000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (194, 60, 35, N'宏碁 I9-13900K/1T/32G/RTX4090', NULL, N'基本款', 58000, 1, 58000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (195, 61, 32, N'宏碁Predator Helios 300', NULL, N'基本款', 48000, 1, 48000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductSkuId], [ProductName], [SkuItemId], [SkuItemName], [Price], [Qty], [SubTotal]) VALUES (196, 62, 32, N'宏碁Predator Helios 300', 92, N'I7-13700H/1T/64G/RTX4070', 63000, 1, 63000)
SET IDENTITY_INSERT [dbo].[OrderItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [UserId], [No], [PaymentMethod], [TotalAmount], [ShippingMethod], [RecipientName], [ShippingAddress], [Phone], [Status], [CreateDate], [ModifyDate]) VALUES (5, 49, N'20241002049001', 1, 124000, 1, N'111', N'111', N'111', 2, CAST(N'2024-10-02T20:06:55.857' AS DateTime), CAST(N'2024-10-02T20:06:55.857' AS DateTime))
INSERT [dbo].[Orders] ([Id], [UserId], [No], [PaymentMethod], [TotalAmount], [ShippingMethod], [RecipientName], [ShippingAddress], [Phone], [Status], [CreateDate], [ModifyDate]) VALUES (6, 50, N'20241002050001', 1, 76000, 1, N'2222', N'222', N'22', 3, CAST(N'2024-10-02T20:11:51.783' AS DateTime), CAST(N'2024-10-02T20:11:51.783' AS DateTime))
INSERT [dbo].[Orders] ([Id], [UserId], [No], [PaymentMethod], [TotalAmount], [ShippingMethod], [RecipientName], [ShippingAddress], [Phone], [Status], [CreateDate], [ModifyDate]) VALUES (7, 49, N'20241002049002', 1, 38000, 1, N'11', N'11', N'111', 4, CAST(N'2024-10-02T20:17:33.190' AS DateTime), CAST(N'2024-10-02T20:17:33.190' AS DateTime))
INSERT [dbo].[Orders] ([Id], [UserId], [No], [PaymentMethod], [TotalAmount], [ShippingMethod], [RecipientName], [ShippingAddress], [Phone], [Status], [CreateDate], [ModifyDate]) VALUES (31, 62, N'20241001069001', 1, 197000, 1, N'王大明', N'台北市信義區忠孝東路100號', N'0910123456', 1, CAST(N'2024-10-01T13:23:34.370' AS DateTime), CAST(N'2024-10-05T13:23:34.370' AS DateTime))
INSERT [dbo].[Orders] ([Id], [UserId], [No], [PaymentMethod], [TotalAmount], [ShippingMethod], [RecipientName], [ShippingAddress], [Phone], [Status], [CreateDate], [ModifyDate]) VALUES (32, 62, N'20241001069002', 1, 137800, 1, N'林小美', N'台中市西屯區文心路300號', N'0910123456', 2, CAST(N'2024-10-01T13:24:14.410' AS DateTime), CAST(N'2024-10-05T13:24:14.410' AS DateTime))
INSERT [dbo].[Orders] ([Id], [UserId], [No], [PaymentMethod], [TotalAmount], [ShippingMethod], [RecipientName], [ShippingAddress], [Phone], [Status], [CreateDate], [ModifyDate]) VALUES (33, 62, N'20241001069003', 1, 63300, 1, N'張三', N'高雄市前鎮區中山路200號', N'0910765432', 3, CAST(N'2024-10-01T13:24:58.047' AS DateTime), CAST(N'2024-10-05T13:24:58.047' AS DateTime))
INSERT [dbo].[Orders] ([Id], [UserId], [No], [PaymentMethod], [TotalAmount], [ShippingMethod], [RecipientName], [ShippingAddress], [Phone], [Status], [CreateDate], [ModifyDate]) VALUES (34, 62, N'20241001069004', 1, 54500, 1, N'李四', N'台南市東區中正路400號', N'0910234567', 1, CAST(N'2024-10-01T13:25:39.643' AS DateTime), CAST(N'2024-10-05T16:35:59.683' AS DateTime))
INSERT [dbo].[Orders] ([Id], [UserId], [No], [PaymentMethod], [TotalAmount], [ShippingMethod], [RecipientName], [ShippingAddress], [Phone], [Status], [CreateDate], [ModifyDate]) VALUES (35, 62, N'20240810069005', 1, 380000, 1, N'王五', N'基隆市仁愛區愛三路500號', N'0910456789', 3, CAST(N'2024-08-10T13:26:37.417' AS DateTime), CAST(N'2024-08-13T13:26:37.417' AS DateTime))
INSERT [dbo].[Orders] ([Id], [UserId], [No], [PaymentMethod], [TotalAmount], [ShippingMethod], [RecipientName], [ShippingAddress], [Phone], [Status], [CreateDate], [ModifyDate]) VALUES (36, 62, N'20240211069006', 1, 173000, 1, N'趙六', N'花蓮市仁愛區國聯一路600號', N'0910567890', 3, CAST(N'2024-02-11T13:27:59.927' AS DateTime), CAST(N'2024-02-15T13:27:59.927' AS DateTime))
INSERT [dbo].[Orders] ([Id], [UserId], [No], [PaymentMethod], [TotalAmount], [ShippingMethod], [RecipientName], [ShippingAddress], [Phone], [Status], [CreateDate], [ModifyDate]) VALUES (37, 62, N'20240314069007', 1, 157000, 1, N'周八', N'台北市松山區民生東路700號', N'0910789123', 3, CAST(N'2024-03-14T13:28:39.363' AS DateTime), CAST(N'2024-03-16T13:28:39.363' AS DateTime))
INSERT [dbo].[Orders] ([Id], [UserId], [No], [PaymentMethod], [TotalAmount], [ShippingMethod], [RecipientName], [ShippingAddress], [Phone], [Status], [CreateDate], [ModifyDate]) VALUES (38, 62, N'20240426069008', 1, 294800, 1, N'周八', N'台中市西屯區西安路800號', N'0910908765', 3, CAST(N'2024-04-26T13:29:14.720' AS DateTime), CAST(N'2024-04-30T13:29:14.720' AS DateTime))
INSERT [dbo].[Orders] ([Id], [UserId], [No], [PaymentMethod], [TotalAmount], [ShippingMethod], [RecipientName], [ShippingAddress], [Phone], [Status], [CreateDate], [ModifyDate]) VALUES (39, 63, N'20240501070001', 1, 193000, 1, N'吳九', N'高雄市前鎮區民族路900號', N'0910102030', 3, CAST(N'2024-05-01T13:36:02.123' AS DateTime), CAST(N'2024-05-05T13:36:02.123' AS DateTime))
INSERT [dbo].[Orders] ([Id], [UserId], [No], [PaymentMethod], [TotalAmount], [ShippingMethod], [RecipientName], [ShippingAddress], [Phone], [Status], [CreateDate], [ModifyDate]) VALUES (40, 63, N'20240601070002', 1, 217200, 1, N'王大明', N'台北市信義區忠孝東路100號', N'0910123456', 3, CAST(N'2024-06-01T13:40:30.523' AS DateTime), CAST(N'2024-06-05T13:40:30.523' AS DateTime))
INSERT [dbo].[Orders] ([Id], [UserId], [No], [PaymentMethod], [TotalAmount], [ShippingMethod], [RecipientName], [ShippingAddress], [Phone], [Status], [CreateDate], [ModifyDate]) VALUES (41, 63, N'20240701070003', 1, 228000, 1, N'李四', N'台南市東區中正路400號', N'0910234567', 3, CAST(N'2024-07-01T13:40:59.373' AS DateTime), CAST(N'2024-07-05T13:40:59.373' AS DateTime))
INSERT [dbo].[Orders] ([Id], [UserId], [No], [PaymentMethod], [TotalAmount], [ShippingMethod], [RecipientName], [ShippingAddress], [Phone], [Status], [CreateDate], [ModifyDate]) VALUES (42, 63, N'20240801070004', 1, 60000, 1, N'吳九', N'高雄市前鎮區民族路900號', N'0910102030', 3, CAST(N'2024-08-01T13:41:25.160' AS DateTime), CAST(N'2024-08-05T13:41:25.160' AS DateTime))
INSERT [dbo].[Orders] ([Id], [UserId], [No], [PaymentMethod], [TotalAmount], [ShippingMethod], [RecipientName], [ShippingAddress], [Phone], [Status], [CreateDate], [ModifyDate]) VALUES (43, 63, N'20240901070005', 1, 191000, 1, N'李小華', N'新北市板橋區三民路5號', N'0910123456', 3, CAST(N'2024-09-01T13:50:06.120' AS DateTime), CAST(N'2024-09-05T13:50:06.120' AS DateTime))
INSERT [dbo].[Orders] ([Id], [UserId], [No], [PaymentMethod], [TotalAmount], [ShippingMethod], [RecipientName], [ShippingAddress], [Phone], [Status], [CreateDate], [ModifyDate]) VALUES (44, 63, N'20241005070001', 1, 44800, 1, N'王五', N'基隆市仁愛區愛三路500號', N'0910456789', 1, CAST(N'2024-10-05T13:52:16.387' AS DateTime), CAST(N'2024-10-05T14:12:57.683' AS DateTime))
INSERT [dbo].[Orders] ([Id], [UserId], [No], [PaymentMethod], [TotalAmount], [ShippingMethod], [RecipientName], [ShippingAddress], [Phone], [Status], [CreateDate], [ModifyDate]) VALUES (45, 63, N'20241002070002', 1, 86000, 1, N'李四', N'台南市東區中正路400號', N'0910456789', 2, CAST(N'2024-10-02T13:52:48.043' AS DateTime), CAST(N'2024-10-04T13:52:48.043' AS DateTime))
INSERT [dbo].[Orders] ([Id], [UserId], [No], [PaymentMethod], [TotalAmount], [ShippingMethod], [RecipientName], [ShippingAddress], [Phone], [Status], [CreateDate], [ModifyDate]) VALUES (46, 63, N'20241001070002', 1, 124000, 1, N'李四', N'高雄市前鎮區中山路200號', N'0910765432', 3, CAST(N'2024-10-01T13:54:04.743' AS DateTime), CAST(N'2024-10-05T13:54:04.743' AS DateTime))
INSERT [dbo].[Orders] ([Id], [UserId], [No], [PaymentMethod], [TotalAmount], [ShippingMethod], [RecipientName], [ShippingAddress], [Phone], [Status], [CreateDate], [ModifyDate]) VALUES (47, 64, N'20240101071001', 1, 193000, 1, N'王大明', N'台南市東區中正路400號', N'0910234567', 3, CAST(N'2024-01-01T13:56:22.417' AS DateTime), CAST(N'2024-01-06T13:56:22.417' AS DateTime))
INSERT [dbo].[Orders] ([Id], [UserId], [No], [PaymentMethod], [TotalAmount], [ShippingMethod], [RecipientName], [ShippingAddress], [Phone], [Status], [CreateDate], [ModifyDate]) VALUES (48, 64, N'20241001071002', 1, 227000, 1, N'趙六', N'基隆市仁愛區愛三路500號', N'0910789123', 4, CAST(N'2024-10-01T13:56:53.047' AS DateTime), CAST(N'2024-10-07T15:13:01.930' AS DateTime))
INSERT [dbo].[Orders] ([Id], [UserId], [No], [PaymentMethod], [TotalAmount], [ShippingMethod], [RecipientName], [ShippingAddress], [Phone], [Status], [CreateDate], [ModifyDate]) VALUES (49, 64, N'20240920071003', 1, 38000, 1, N'王大明', N'基隆市仁愛區愛三路500號', N'0910123456', 1, CAST(N'2024-09-20T13:57:04.397' AS DateTime), CAST(N'2024-09-23T13:57:04.397' AS DateTime))
INSERT [dbo].[Orders] ([Id], [UserId], [No], [PaymentMethod], [TotalAmount], [ShippingMethod], [RecipientName], [ShippingAddress], [Phone], [Status], [CreateDate], [ModifyDate]) VALUES (50, 64, N'20241003071004', 1, 259000, 1, N'趙六', N'台南市東區中正路400號', N'0910234567', 6, CAST(N'2024-10-03T13:57:20.387' AS DateTime), CAST(N'2024-10-07T16:24:46.360' AS DateTime))
INSERT [dbo].[Orders] ([Id], [UserId], [No], [PaymentMethod], [TotalAmount], [ShippingMethod], [RecipientName], [ShippingAddress], [Phone], [Status], [CreateDate], [ModifyDate]) VALUES (51, 64, N'20241004071005', 1, 6700, 1, N'李小華', N'新北市板橋區三民路5號', N'0910102030', 4, CAST(N'2024-10-04T13:57:42.470' AS DateTime), CAST(N'2024-10-04T13:57:42.470' AS DateTime))
INSERT [dbo].[Orders] ([Id], [UserId], [No], [PaymentMethod], [TotalAmount], [ShippingMethod], [RecipientName], [ShippingAddress], [Phone], [Status], [CreateDate], [ModifyDate]) VALUES (52, 64, N'20241005071006', 1, 216000, 1, N'吳九', N'高雄市前鎮區民族路900號', N'0910102030', 6, CAST(N'2024-10-04T13:58:06.593' AS DateTime), CAST(N'2024-10-07T15:12:39.733' AS DateTime))
INSERT [dbo].[Orders] ([Id], [UserId], [No], [PaymentMethod], [TotalAmount], [ShippingMethod], [RecipientName], [ShippingAddress], [Phone], [Status], [CreateDate], [ModifyDate]) VALUES (53, 64, N'20241005071007', 1, 21000, 1, N'王大明', N'台南市東區中正路400號', N'0910123456', 2, CAST(N'2024-10-04T13:58:31.030' AS DateTime), CAST(N'2024-10-04T13:58:31.030' AS DateTime))
INSERT [dbo].[Orders] ([Id], [UserId], [No], [PaymentMethod], [TotalAmount], [ShippingMethod], [RecipientName], [ShippingAddress], [Phone], [Status], [CreateDate], [ModifyDate]) VALUES (54, 65, N'20240905072001', 3, 434000, 1, N'王大明', N'台北市信義區忠孝東路100號', N'0910123456', 3, CAST(N'2024-09-05T14:32:39.077' AS DateTime), CAST(N'2024-09-30T14:32:39.077' AS DateTime))
INSERT [dbo].[Orders] ([Id], [UserId], [No], [PaymentMethod], [TotalAmount], [ShippingMethod], [RecipientName], [ShippingAddress], [Phone], [Status], [CreateDate], [ModifyDate]) VALUES (55, 65, N'20240301072002', 3, 275000, 1, N'林小美', N'台中市西屯區文心路300號', N'0910987654', 3, CAST(N'2024-03-01T14:33:03.060' AS DateTime), CAST(N'2024-03-04T14:33:03.060' AS DateTime))
INSERT [dbo].[Orders] ([Id], [UserId], [No], [PaymentMethod], [TotalAmount], [ShippingMethod], [RecipientName], [ShippingAddress], [Phone], [Status], [CreateDate], [ModifyDate]) VALUES (56, 65, N'20240601072003', 3, 338000, 1, N'孫七', N'台北市松山區民生東路700號', N'0910789123', 3, CAST(N'2024-06-01T14:33:24.710' AS DateTime), CAST(N'2024-06-04T14:33:24.710' AS DateTime))
INSERT [dbo].[Orders] ([Id], [UserId], [No], [PaymentMethod], [TotalAmount], [ShippingMethod], [RecipientName], [ShippingAddress], [Phone], [Status], [CreateDate], [ModifyDate]) VALUES (57, 50, N'20241005050001', 1, 21000, 1, N'廖宏銘', N'新北市新店區安泰路60巷55弄54號', N'0919077083', 1, CAST(N'2024-10-05T16:22:45.533' AS DateTime), CAST(N'2024-10-05T16:35:52.610' AS DateTime))
INSERT [dbo].[Orders] ([Id], [UserId], [No], [PaymentMethod], [TotalAmount], [ShippingMethod], [RecipientName], [ShippingAddress], [Phone], [Status], [CreateDate], [ModifyDate]) VALUES (58, 50, N'20241005050002', 1, 48000, 1, N'廖宏銘', N'新北市新店區安泰路60巷55弄54號', N'0919077083', 2, CAST(N'2024-10-05T16:23:29.597' AS DateTime), CAST(N'2024-10-05T16:31:46.600' AS DateTime))
INSERT [dbo].[Orders] ([Id], [UserId], [No], [PaymentMethod], [TotalAmount], [ShippingMethod], [RecipientName], [ShippingAddress], [Phone], [Status], [CreateDate], [ModifyDate]) VALUES (59, 50, N'20241005050003', 1, 32000, 1, N'廖宏銘', N'新北市新店區安泰路60巷55弄54號', N'0919077083', 6, CAST(N'2024-10-05T16:30:11.833' AS DateTime), CAST(N'2024-10-06T04:08:36.070' AS DateTime))
INSERT [dbo].[Orders] ([Id], [UserId], [No], [PaymentMethod], [TotalAmount], [ShippingMethod], [RecipientName], [ShippingAddress], [Phone], [Status], [CreateDate], [ModifyDate]) VALUES (60, 69, N'20241007069001', 1, 58000, 1, N'廖宏銘出', N'新北市板橋區安泰路60巷55弄54號', N'0919077083', 2, CAST(N'2024-10-07T15:11:57.530' AS DateTime), CAST(N'2024-10-07T15:14:19.970' AS DateTime))
INSERT [dbo].[Orders] ([Id], [UserId], [No], [PaymentMethod], [TotalAmount], [ShippingMethod], [RecipientName], [ShippingAddress], [Phone], [Status], [CreateDate], [ModifyDate]) VALUES (61, 71, N'20241007071001', 1, 48000, 1, N'廖宏', N'新北市板橋區安泰路60巷55弄54號', N'0919077083', 2, CAST(N'2024-10-07T16:24:10.273' AS DateTime), CAST(N'2024-10-07T16:39:37.923' AS DateTime))
INSERT [dbo].[Orders] ([Id], [UserId], [No], [PaymentMethod], [TotalAmount], [ShippingMethod], [RecipientName], [ShippingAddress], [Phone], [Status], [CreateDate], [ModifyDate]) VALUES (62, 71, N'20241007071002', 1, 63000, 1, N'廖宏銘', N'[ 新北市板橋區本安泰路60巷55弄54號', N'0919077083', 6, CAST(N'2024-10-07T16:38:30.377' AS DateTime), CAST(N'2024-10-07T16:38:47.957' AS DateTime))
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductCategories] ON 

INSERT [dbo].[ProductCategories] ([Id], [CategoryName], [DisplayOrder], [Status]) VALUES (1, N'處理器', 0, 1)
INSERT [dbo].[ProductCategories] ([Id], [CategoryName], [DisplayOrder], [Status]) VALUES (2, N'顯示卡', 0, 1)
INSERT [dbo].[ProductCategories] ([Id], [CategoryName], [DisplayOrder], [Status]) VALUES (3, N'硬碟', 0, 1)
INSERT [dbo].[ProductCategories] ([Id], [CategoryName], [DisplayOrder], [Status]) VALUES (4, N'記憶體', 0, 1)
INSERT [dbo].[ProductCategories] ([Id], [CategoryName], [DisplayOrder], [Status]) VALUES (5, N'PC', 0, 1)
INSERT [dbo].[ProductCategories] ([Id], [CategoryName], [DisplayOrder], [Status]) VALUES (9, N'鍵盤', 0, 1)
INSERT [dbo].[ProductCategories] ([Id], [CategoryName], [DisplayOrder], [Status]) VALUES (12, N'滑鼠', 0, 1)
INSERT [dbo].[ProductCategories] ([Id], [CategoryName], [DisplayOrder], [Status]) VALUES (15, N'方向盤', 0, 1)
INSERT [dbo].[ProductCategories] ([Id], [CategoryName], [DisplayOrder], [Status]) VALUES (16, N'鍵盤4', 0, 1)
SET IDENTITY_INSERT [dbo].[ProductCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [BrandId], [ProductCategoryId], [Name], [Description], [Status], [Look], [CreateDate], [ModifyDate]) VALUES (15, 15, 5, N'華碩敗家之眼12', N'電競電腦12', 0, 34, CAST(N'2024-09-11T11:26:25.780' AS DateTime), CAST(N'2024-10-05T16:27:48.217' AS DateTime))
INSERT [dbo].[Products] ([Id], [BrandId], [ProductCategoryId], [Name], [Description], [Status], [Look], [CreateDate], [ModifyDate]) VALUES (16, 16, 12, N'Logitech G102', N'電競滑鼠', 1, 14, CAST(N'2024-09-11T11:26:25.780' AS DateTime), CAST(N'2024-10-07T14:17:46.723' AS DateTime))
INSERT [dbo].[Products] ([Id], [BrandId], [ProductCategoryId], [Name], [Description], [Status], [Look], [CreateDate], [ModifyDate]) VALUES (17, 15, 1, N'Intel i7-12700K', N'第12代Intel Core處理器，適用於高效能電腦', 1, 8, CAST(N'2024-09-13T12:32:49.090' AS DateTime), CAST(N'2024-09-13T12:32:49.090' AS DateTime))
INSERT [dbo].[Products] ([Id], [BrandId], [ProductCategoryId], [Name], [Description], [Status], [Look], [CreateDate], [ModifyDate]) VALUES (18, 16, 9, N'Logitech G Pro X', N'Logitech高性能機械鍵盤，適合遊戲和打字', 1, 3, CAST(N'2024-09-13T12:32:49.090' AS DateTime), CAST(N'2024-09-13T12:32:49.090' AS DateTime))
INSERT [dbo].[Products] ([Id], [BrandId], [ProductCategoryId], [Name], [Description], [Status], [Look], [CreateDate], [ModifyDate]) VALUES (19, 17, 2, N'技嘉 RTX 3080', N'NVIDIA GeForce RTX 3080顯示卡，適合高端遊戲和渲染', 1, 4, CAST(N'2024-09-13T12:32:49.090' AS DateTime), CAST(N'2024-09-13T12:32:49.090' AS DateTime))
INSERT [dbo].[Products] ([Id], [BrandId], [ProductCategoryId], [Name], [Description], [Status], [Look], [CreateDate], [ModifyDate]) VALUES (20, 18, 3, N'微星 SSD 1TB', N'微星1TB固態硬碟，超快讀寫速度', 1, 2, CAST(N'2024-09-13T12:32:49.090' AS DateTime), CAST(N'2024-09-13T12:32:49.090' AS DateTime))
INSERT [dbo].[Products] ([Id], [BrandId], [ProductCategoryId], [Name], [Description], [Status], [Look], [CreateDate], [ModifyDate]) VALUES (21, 19, 4, N'宏碁 DDR4 16GB', N'宏碁16GB DDR4記憶體，穩定高效', 1, 2, CAST(N'2024-09-13T12:32:49.090' AS DateTime), CAST(N'2024-09-13T12:32:49.090' AS DateTime))
INSERT [dbo].[Products] ([Id], [BrandId], [ProductCategoryId], [Name], [Description], [Status], [Look], [CreateDate], [ModifyDate]) VALUES (22, 20, 9, N'Corsair K70', N'海盜船K70機械鍵盤，具備RGB背光', 1, 19, CAST(N'2024-09-13T12:32:49.090' AS DateTime), CAST(N'2024-09-13T12:32:49.090' AS DateTime))
INSERT [dbo].[Products] ([Id], [BrandId], [ProductCategoryId], [Name], [Description], [Status], [Look], [CreateDate], [ModifyDate]) VALUES (23, 21, 12, N'Razer DeathAdder', N'雷蛇DeathAdder遊戲滑鼠，具備高靈敏度與快速響應', 1, 3, CAST(N'2024-09-13T12:32:49.090' AS DateTime), CAST(N'2024-09-13T12:32:49.090' AS DateTime))
INSERT [dbo].[Products] ([Id], [BrandId], [ProductCategoryId], [Name], [Description], [Status], [Look], [CreateDate], [ModifyDate]) VALUES (24, 22, 1, N'Intel i9-13900K', N'第13代Intel Core i9處理器，超高效能', 1, 4, CAST(N'2024-09-13T12:32:49.090' AS DateTime), CAST(N'2024-09-13T12:32:49.090' AS DateTime))
INSERT [dbo].[Products] ([Id], [BrandId], [ProductCategoryId], [Name], [Description], [Status], [Look], [CreateDate], [ModifyDate]) VALUES (25, 23, 2, N'AMD RX 6900 XT', N'AMD Radeon RX 6900 XT顯示卡，適合4K遊戲體驗', 1, 20, CAST(N'2024-09-13T12:32:49.090' AS DateTime), CAST(N'2024-09-13T12:32:49.090' AS DateTime))
INSERT [dbo].[Products] ([Id], [BrandId], [ProductCategoryId], [Name], [Description], [Status], [Look], [CreateDate], [ModifyDate]) VALUES (26, 24, 4, N'金士頓 DDR5 32GB', N'金士頓32GB DDR5記憶體，超高速運行', 1, 3, CAST(N'2024-09-13T12:32:49.090' AS DateTime), CAST(N'2024-09-13T12:32:49.090' AS DateTime))
INSERT [dbo].[Products] ([Id], [BrandId], [ProductCategoryId], [Name], [Description], [Status], [Look], [CreateDate], [ModifyDate]) VALUES (27, 17, 5, N'技嘉AROUS', N'超級猛的電競電腦', 1, 14, CAST(N'2024-09-17T22:41:47.790' AS DateTime), CAST(N'2024-09-17T22:41:47.790' AS DateTime))
INSERT [dbo].[Products] ([Id], [BrandId], [ProductCategoryId], [Name], [Description], [Status], [Look], [CreateDate], [ModifyDate]) VALUES (28, 17, 5, N'微星MSI', N'超超級猛的電競電腦', 0, 16, CAST(N'2024-09-17T22:41:47.790' AS DateTime), CAST(N'2024-10-04T13:44:11.307' AS DateTime))
INSERT [dbo].[Products] ([Id], [BrandId], [ProductCategoryId], [Name], [Description], [Status], [Look], [CreateDate], [ModifyDate]) VALUES (29, 17, 5, N'宏碁ACER', N'超超超級猛的電競電腦', 0, 101, CAST(N'2024-09-17T22:41:47.790' AS DateTime), CAST(N'2024-10-04T13:44:23.193' AS DateTime))
INSERT [dbo].[Products] ([Id], [BrandId], [ProductCategoryId], [Name], [Description], [Status], [Look], [CreateDate], [ModifyDate]) VALUES (30, 15, 5, N'華碩ROG敗家之眼', N'電競電腦，擁有強大的性能和出色的散熱系統，適合高端玩家。', 1, 5, CAST(N'2024-09-19T11:33:44.940' AS DateTime), CAST(N'2024-09-19T11:33:44.940' AS DateTime))
INSERT [dbo].[Products] ([Id], [BrandId], [ProductCategoryId], [Name], [Description], [Status], [Look], [CreateDate], [ModifyDate]) VALUES (31, 15, 5, N'華碩TUF Gaming A15', N'耐用的電競電腦，配備高效能顯示卡和處理器，適合長時間遊戲。', 1, 2, CAST(N'2024-09-19T11:33:44.940' AS DateTime), CAST(N'2024-09-19T11:33:44.940' AS DateTime))
INSERT [dbo].[Products] ([Id], [BrandId], [ProductCategoryId], [Name], [Description], [Status], [Look], [CreateDate], [ModifyDate]) VALUES (32, 15, 5, N'華碩ROG Strix Scar 15', N'專為遊戲設計的筆記型電腦，具有高刷新率顯示屏和強勁的性能。', 1, 3, CAST(N'2024-09-19T11:33:44.940' AS DateTime), CAST(N'2024-09-19T11:33:44.940' AS DateTime))
INSERT [dbo].[Products] ([Id], [BrandId], [ProductCategoryId], [Name], [Description], [Status], [Look], [CreateDate], [ModifyDate]) VALUES (33, 15, 5, N'華碩ROG Flow X13', N'便攜式電競筆電，擁有強大的性能和便於攜帶的設計。', 1, 3, CAST(N'2024-09-19T11:33:44.940' AS DateTime), CAST(N'2024-09-19T11:33:44.940' AS DateTime))
INSERT [dbo].[Products] ([Id], [BrandId], [ProductCategoryId], [Name], [Description], [Status], [Look], [CreateDate], [ModifyDate]) VALUES (34, 15, 5, N'華碩ROG Zephyrus G14', N'高效能電競筆記型電腦，擁有強大的處理能力和輕薄設計。', 1, 3, CAST(N'2024-09-19T11:33:44.940' AS DateTime), CAST(N'2024-09-19T11:33:44.940' AS DateTime))
INSERT [dbo].[Products] ([Id], [BrandId], [ProductCategoryId], [Name], [Description], [Status], [Look], [CreateDate], [ModifyDate]) VALUES (35, 17, 5, N'技嘉AORUS猛禽', N'高效能電競電腦，配備最新的顯示卡和處理器，適合大型遊戲和專業工作。', 1, 5, CAST(N'2024-09-19T11:33:44.943' AS DateTime), CAST(N'2024-09-19T11:33:44.943' AS DateTime))
INSERT [dbo].[Products] ([Id], [BrandId], [ProductCategoryId], [Name], [Description], [Status], [Look], [CreateDate], [ModifyDate]) VALUES (36, 17, 5, N'技嘉AORUS 15G', N'強大的電競筆記型電腦，適合高要求遊戲和多任務處理。', 1, 5, CAST(N'2024-09-19T11:33:44.943' AS DateTime), CAST(N'2024-09-19T11:33:44.943' AS DateTime))
INSERT [dbo].[Products] ([Id], [BrandId], [ProductCategoryId], [Name], [Description], [Status], [Look], [CreateDate], [ModifyDate]) VALUES (37, 17, 5, N'技嘉G5 KF', N'高性能電競電腦，具有優異的散熱系統和顯示性能。', 1, 1, CAST(N'2024-09-19T11:33:44.943' AS DateTime), CAST(N'2024-09-19T11:33:44.943' AS DateTime))
INSERT [dbo].[Products] ([Id], [BrandId], [ProductCategoryId], [Name], [Description], [Status], [Look], [CreateDate], [ModifyDate]) VALUES (38, 17, 5, N'技嘉AORUS 17G', N'大屏幕電競筆記型電腦，擁有卓越的遊戲性能和視覺效果。', 1, 3, CAST(N'2024-09-19T11:33:44.943' AS DateTime), CAST(N'2024-09-19T11:33:44.943' AS DateTime))
INSERT [dbo].[Products] ([Id], [BrandId], [ProductCategoryId], [Name], [Description], [Status], [Look], [CreateDate], [ModifyDate]) VALUES (39, 17, 5, N'技嘉G34WQC', N'曲面顯示器，提供超寬視野和卓越的顯示效果。', 0, 3, CAST(N'2024-09-19T11:33:44.943' AS DateTime), CAST(N'2024-10-05T13:18:59.360' AS DateTime))
INSERT [dbo].[Products] ([Id], [BrandId], [ProductCategoryId], [Name], [Description], [Status], [Look], [CreateDate], [ModifyDate]) VALUES (40, 18, 5, N'微星GE76雷霆', N'極致性能電競筆電，擁有超高刷新率屏幕和強大散熱系統，適合遊戲和高負荷工作。', 1, 2, CAST(N'2024-09-19T11:33:44.943' AS DateTime), CAST(N'2024-09-19T11:33:44.943' AS DateTime))
INSERT [dbo].[Products] ([Id], [BrandId], [ProductCategoryId], [Name], [Description], [Status], [Look], [CreateDate], [ModifyDate]) VALUES (41, 18, 5, N'微星GS66 Stealth', N'薄型電競筆電，配備強大的顯示卡和高效能處理器。', 1, 4, CAST(N'2024-09-19T11:33:44.943' AS DateTime), CAST(N'2024-09-19T11:33:44.943' AS DateTime))
INSERT [dbo].[Products] ([Id], [BrandId], [ProductCategoryId], [Name], [Description], [Status], [Look], [CreateDate], [ModifyDate]) VALUES (42, 18, 5, N'微星GE66 Raider', N'高性能電競電腦，具有靈活的RGB燈效和強大的遊戲性能。', 1, 2, CAST(N'2024-09-19T11:33:44.943' AS DateTime), CAST(N'2024-09-19T11:33:44.943' AS DateTime))
INSERT [dbo].[Products] ([Id], [BrandId], [ProductCategoryId], [Name], [Description], [Status], [Look], [CreateDate], [ModifyDate]) VALUES (43, 18, 5, N'微星Creator 17', N'專為創作者設計的筆記型電腦，擁有高解析度顯示屏和強大處理能力。', 1, 2, CAST(N'2024-09-19T11:33:44.943' AS DateTime), CAST(N'2024-09-19T11:33:44.943' AS DateTime))
INSERT [dbo].[Products] ([Id], [BrandId], [ProductCategoryId], [Name], [Description], [Status], [Look], [CreateDate], [ModifyDate]) VALUES (44, 18, 5, N'微星Alpha 15', N'高效能電競筆電，具有優秀的性能和競爭力價格。', 1, 3, CAST(N'2024-09-19T11:33:44.943' AS DateTime), CAST(N'2024-09-19T11:33:44.943' AS DateTime))
INSERT [dbo].[Products] ([Id], [BrandId], [ProductCategoryId], [Name], [Description], [Status], [Look], [CreateDate], [ModifyDate]) VALUES (45, 19, 5, N'宏碁Predator Helios 300', N'高性能電競電腦，具備強大的處理能力和流暢的遊戲體驗，適合所有遊戲類型。', 1, 25, CAST(N'2024-09-19T11:33:44.943' AS DateTime), CAST(N'2024-09-29T21:49:49.130' AS DateTime))
INSERT [dbo].[Products] ([Id], [BrandId], [ProductCategoryId], [Name], [Description], [Status], [Look], [CreateDate], [ModifyDate]) VALUES (46, 19, 5, N'宏碁Predator Triton 500', N'輕薄型電競筆電，擁有強大的性能和高效散熱系統。', 1, 6, CAST(N'2024-09-19T11:33:44.943' AS DateTime), CAST(N'2024-09-19T11:33:44.943' AS DateTime))
INSERT [dbo].[Products] ([Id], [BrandId], [ProductCategoryId], [Name], [Description], [Status], [Look], [CreateDate], [ModifyDate]) VALUES (47, 19, 5, N'宏碁Nitro 5', N'具高性價比的電競電腦，適合中高端遊戲需求。', 1, 18, CAST(N'2024-09-19T11:33:44.943' AS DateTime), CAST(N'2024-09-19T11:33:44.943' AS DateTime))
INSERT [dbo].[Products] ([Id], [BrandId], [ProductCategoryId], [Name], [Description], [Status], [Look], [CreateDate], [ModifyDate]) VALUES (48, 19, 5, N'宏碁Predator Orion 3000', N'高性能桌上型電腦，適合大型遊戲和專業應用。', 1, 8, CAST(N'2024-09-19T11:33:44.943' AS DateTime), CAST(N'2024-09-19T11:33:44.943' AS DateTime))
INSERT [dbo].[Products] ([Id], [BrandId], [ProductCategoryId], [Name], [Description], [Status], [Look], [CreateDate], [ModifyDate]) VALUES (49, 19, 5, N'宏碁Predator X34', N'超寬曲面顯示器，提供卓越的視覺效果和遊戲體驗。', 0, 2, CAST(N'2024-09-19T11:33:44.943' AS DateTime), CAST(N'2024-10-05T13:18:40.243' AS DateTime))
INSERT [dbo].[Products] ([Id], [BrandId], [ProductCategoryId], [Name], [Description], [Status], [Look], [CreateDate], [ModifyDate]) VALUES (68, 16, 15, N'羅技方向盤', N'操控有如特斯拉輕巧', 1, 3, CAST(N'2024-09-26T09:31:25.437' AS DateTime), CAST(N'2024-09-26T23:25:46.150' AS DateTime))
INSERT [dbo].[Products] ([Id], [BrandId], [ProductCategoryId], [Name], [Description], [Status], [Look], [CreateDate], [ModifyDate]) VALUES (73, 16, 15, N'羅技方向盤1', N'操控有如特斯拉輕巧1', 0, 0, CAST(N'2024-09-27T12:26:26.287' AS DateTime), CAST(N'2024-10-01T10:10:18.570' AS DateTime))
INSERT [dbo].[Products] ([Id], [BrandId], [ProductCategoryId], [Name], [Description], [Status], [Look], [CreateDate], [ModifyDate]) VALUES (74, 16, 1, N'羅技方向盤', N'操控有如特斯拉輕巧', 0, 2, CAST(N'2024-10-01T13:05:25.513' AS DateTime), CAST(N'2024-10-04T13:03:41.827' AS DateTime))
INSERT [dbo].[Products] ([Id], [BrandId], [ProductCategoryId], [Name], [Description], [Status], [Look], [CreateDate], [ModifyDate]) VALUES (75, 21, 9, N'Razer Huntsman V3 Pro TKL', N'電競鍵盤:類比光學開關 - Razer Snap Tap - 快速觸發 - 可調式驅動 - 媒體按鍵和撥號 - 雙鏡頭PBT 鍵帽 - 護腕 - 黑色', 1, 1, CAST(N'2024-10-04T14:52:01.943' AS DateTime), CAST(N'2024-10-04T14:52:01.943' AS DateTime))
INSERT [dbo].[Products] ([Id], [BrandId], [ProductCategoryId], [Name], [Description], [Status], [Look], [CreateDate], [ModifyDate]) VALUES (76, 23, 1, N'AMD Ryzen™ 9 9900X', N'12 核心 24 線程解鎖桌上型處理器', 1, 0, CAST(N'2024-10-04T15:07:20.857' AS DateTime), CAST(N'2024-10-04T15:07:20.857' AS DateTime))
INSERT [dbo].[Products] ([Id], [BrandId], [ProductCategoryId], [Name], [Description], [Status], [Look], [CreateDate], [ModifyDate]) VALUES (77, 25, 3, N'美光BX500', N'超快速SSD', 1, 0, CAST(N'2024-10-04T21:22:07.730' AS DateTime), CAST(N'2024-10-04T21:22:07.730' AS DateTime))
INSERT [dbo].[Products] ([Id], [BrandId], [ProductCategoryId], [Name], [Description], [Status], [Look], [CreateDate], [ModifyDate]) VALUES (78, 25, 4, N'美光 Crucial Ballistix ', N'炫光RGB D4 3200/64G', 1, 1, CAST(N'2024-10-05T13:11:50.700' AS DateTime), CAST(N'2024-10-05T13:11:50.700' AS DateTime))
INSERT [dbo].[Products] ([Id], [BrandId], [ProductCategoryId], [Name], [Description], [Status], [Look], [CreateDate], [ModifyDate]) VALUES (79, 15, 5, N'ASUS ROG Zephyrus G14 ', N'使用全機金屬並做到全球最輕薄效能電競', 1, 3, CAST(N'2024-10-07T15:07:24.023' AS DateTime), CAST(N'2024-10-07T15:07:24.023' AS DateTime))
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductSkus] ON 

INSERT [dbo].[ProductSkus] ([Id], [ProductId], [Name], [Price], [Sale]) VALUES (2, 15, N'華碩敗家之眼12', 35000, 32000)
INSERT [dbo].[ProductSkus] ([Id], [ProductId], [Name], [Price], [Sale]) VALUES (3, 16, N'Logitech G102', 2000, 1800)
INSERT [dbo].[ProductSkus] ([Id], [ProductId], [Name], [Price], [Sale]) VALUES (4, 17, N'Intel i7-12700K 標準版', 12000, 11000)
INSERT [dbo].[ProductSkus] ([Id], [ProductId], [Name], [Price], [Sale]) VALUES (5, 18, N'Logitech G Pro X 鍵盤特別版', 3500, 3200)
INSERT [dbo].[ProductSkus] ([Id], [ProductId], [Name], [Price], [Sale]) VALUES (6, 19, N'技嘉 RTX 3080 超頻版', 25000, 23000)
INSERT [dbo].[ProductSkus] ([Id], [ProductId], [Name], [Price], [Sale]) VALUES (7, 20, N'微星 SSD 1TB 高速版', 3000, 2800)
INSERT [dbo].[ProductSkus] ([Id], [ProductId], [Name], [Price], [Sale]) VALUES (8, 21, N'宏碁 DDR4 16GB 記憶體條', 1500, 1300)
INSERT [dbo].[ProductSkus] ([Id], [ProductId], [Name], [Price], [Sale]) VALUES (9, 22, N'Corsair K70 RGB版', 5000, 4800)
INSERT [dbo].[ProductSkus] ([Id], [ProductId], [Name], [Price], [Sale]) VALUES (10, 23, N'Razer DeathAdder 專業版', 2500, 2200)
INSERT [dbo].[ProductSkus] ([Id], [ProductId], [Name], [Price], [Sale]) VALUES (11, 24, N'Intel i9-13900K 旗艦版', 15000, 13000)
INSERT [dbo].[ProductSkus] ([Id], [ProductId], [Name], [Price], [Sale]) VALUES (12, 25, N'AMD RX 6900 XT 超頻版', 23000, 21000)
INSERT [dbo].[ProductSkus] ([Id], [ProductId], [Name], [Price], [Sale]) VALUES (13, 26, N'金士頓 DDR5 32GB 高速版', 3500, 3200)
INSERT [dbo].[ProductSkus] ([Id], [ProductId], [Name], [Price], [Sale]) VALUES (14, 27, N'技嘉I7-14700/1T/16G/RTX4060', 45000, 43000)
INSERT [dbo].[ProductSkus] ([Id], [ProductId], [Name], [Price], [Sale]) VALUES (16, 29, N'宏碁ACER', 40000, 38000)
INSERT [dbo].[ProductSkus] ([Id], [ProductId], [Name], [Price], [Sale]) VALUES (17, 30, N'華碩 I7-13700K/1T/32G/RTX4080', 50000, 48000)
INSERT [dbo].[ProductSkus] ([Id], [ProductId], [Name], [Price], [Sale]) VALUES (18, 31, N'華碩 R5-7600H/512G/16G/RTX4060', 40000, 38000)
INSERT [dbo].[ProductSkus] ([Id], [ProductId], [Name], [Price], [Sale]) VALUES (19, 32, N'華碩 I9-13900K/1T/32G/RTX4090', 60000, 58000)
INSERT [dbo].[ProductSkus] ([Id], [ProductId], [Name], [Price], [Sale]) VALUES (20, 33, N'華碩 R7-7730U/1T/16G/RTX4050', 45000, 43000)
INSERT [dbo].[ProductSkus] ([Id], [ProductId], [Name], [Price], [Sale]) VALUES (21, 34, N'華碩 I7-13700H/1T/16G/RTX4070', 55000, 53000)
INSERT [dbo].[ProductSkus] ([Id], [ProductId], [Name], [Price], [Sale]) VALUES (22, 35, N'技嘉 I7-12700K/1T/32G/RTX4080', 52000, 50000)
INSERT [dbo].[ProductSkus] ([Id], [ProductId], [Name], [Price], [Sale]) VALUES (23, 36, N'技嘉 R5-7600X/1T/16G/RTX4070', 47000, 45000)
INSERT [dbo].[ProductSkus] ([Id], [ProductId], [Name], [Price], [Sale]) VALUES (24, 37, N'技嘉 I5-13600K/512G/16G/RTX4060', 43000, 41000)
INSERT [dbo].[ProductSkus] ([Id], [ProductId], [Name], [Price], [Sale]) VALUES (25, 38, N'技嘉 I9-13900K/1T/32G/RTX4090', 55000, 53000)
INSERT [dbo].[ProductSkus] ([Id], [ProductId], [Name], [Price], [Sale]) VALUES (26, 39, N'技嘉G34WQC', 60000, 58000)
INSERT [dbo].[ProductSkus] ([Id], [ProductId], [Name], [Price], [Sale]) VALUES (27, 40, N'微星 I9-13900HX/1T/32G/RTX4080', 65000, 63000)
INSERT [dbo].[ProductSkus] ([Id], [ProductId], [Name], [Price], [Sale]) VALUES (28, 41, N'微星 R7-7730U/1T/16G/RTX4050', 48000, 46000)
INSERT [dbo].[ProductSkus] ([Id], [ProductId], [Name], [Price], [Sale]) VALUES (29, 42, N'微星 I7-13700H/512G/16G/RTX4070', 55000, 53000)
INSERT [dbo].[ProductSkus] ([Id], [ProductId], [Name], [Price], [Sale]) VALUES (30, 43, N'微星 I9-13900K/1T/32G/RTX4090', 57000, 55000)
INSERT [dbo].[ProductSkus] ([Id], [ProductId], [Name], [Price], [Sale]) VALUES (31, 44, N'微星 R5-7600H/512G/16G/RTX4060', 43000, 41000)
INSERT [dbo].[ProductSkus] ([Id], [ProductId], [Name], [Price], [Sale]) VALUES (32, 45, N'宏碁Predator Helios 300', 50000, 48000)
INSERT [dbo].[ProductSkus] ([Id], [ProductId], [Name], [Price], [Sale]) VALUES (33, 46, N'宏碁 R5-7600H/1T/16G/RTX4070', 55000, 53000)
INSERT [dbo].[ProductSkus] ([Id], [ProductId], [Name], [Price], [Sale]) VALUES (34, 47, N'宏碁 I5-13600K/512G/16G/RTX4060', 40000, 38000)
INSERT [dbo].[ProductSkus] ([Id], [ProductId], [Name], [Price], [Sale]) VALUES (35, 48, N'宏碁 I9-13900K/1T/32G/RTX4090', 60000, 58000)
INSERT [dbo].[ProductSkus] ([Id], [ProductId], [Name], [Price], [Sale]) VALUES (36, 49, N'宏碁Predator X34', 62000, 60000)
INSERT [dbo].[ProductSkus] ([Id], [ProductId], [Name], [Price], [Sale]) VALUES (42, 68, N'羅技方向盤', 12000, 10000)
INSERT [dbo].[ProductSkus] ([Id], [ProductId], [Name], [Price], [Sale]) VALUES (52, 28, N'微星MSI', 38000, 35000)
INSERT [dbo].[ProductSkus] ([Id], [ProductId], [Name], [Price], [Sale]) VALUES (53, 73, N'羅技方向盤1', 140001, 120001)
INSERT [dbo].[ProductSkus] ([Id], [ProductId], [Name], [Price], [Sale]) VALUES (54, 74, N'羅技方向盤', 0, 0)
INSERT [dbo].[ProductSkus] ([Id], [ProductId], [Name], [Price], [Sale]) VALUES (55, 75, N'Razer Huntsman V3 Pro TKL', 7500, 7000)
INSERT [dbo].[ProductSkus] ([Id], [ProductId], [Name], [Price], [Sale]) VALUES (56, 76, N'AMD Ryzen™ 9 9900X', 14500, 14000)
INSERT [dbo].[ProductSkus] ([Id], [ProductId], [Name], [Price], [Sale]) VALUES (57, 77, N'美光BX500', 2000, 1500)
INSERT [dbo].[ProductSkus] ([Id], [ProductId], [Name], [Price], [Sale]) VALUES (58, 78, N'美光 Crucial Ballistix ', 3000, 2500)
INSERT [dbo].[ProductSkus] ([Id], [ProductId], [Name], [Price], [Sale]) VALUES (59, 79, N'ASUS ROG Zephyrus G14 ', 59999, 50000)
SET IDENTITY_INSERT [dbo].[ProductSkus] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [UserId], [Role]) VALUES (6, 31, 1)
INSERT [dbo].[Roles] ([Id], [UserId], [Role]) VALUES (8, 35, 3)
INSERT [dbo].[Roles] ([Id], [UserId], [Role]) VALUES (9, 36, 3)
INSERT [dbo].[Roles] ([Id], [UserId], [Role]) VALUES (10, 37, 4)
INSERT [dbo].[Roles] ([Id], [UserId], [Role]) VALUES (43, 38, 0)
INSERT [dbo].[Roles] ([Id], [UserId], [Role]) VALUES (44, 55, 5)
INSERT [dbo].[Roles] ([Id], [UserId], [Role]) VALUES (45, 56, 5)
INSERT [dbo].[Roles] ([Id], [UserId], [Role]) VALUES (47, 62, 5)
INSERT [dbo].[Roles] ([Id], [UserId], [Role]) VALUES (48, 63, 5)
INSERT [dbo].[Roles] ([Id], [UserId], [Role]) VALUES (49, 64, 5)
INSERT [dbo].[Roles] ([Id], [UserId], [Role]) VALUES (51, 65, 5)
INSERT [dbo].[Roles] ([Id], [UserId], [Role]) VALUES (52, 66, 5)
INSERT [dbo].[Roles] ([Id], [UserId], [Role]) VALUES (54, 49, 5)
INSERT [dbo].[Roles] ([Id], [UserId], [Role]) VALUES (56, 50, 5)
INSERT [dbo].[Roles] ([Id], [UserId], [Role]) VALUES (57, 51, 5)
INSERT [dbo].[Roles] ([Id], [UserId], [Role]) VALUES (58, 30, 0)
INSERT [dbo].[Roles] ([Id], [UserId], [Role]) VALUES (59, 32, 1)
INSERT [dbo].[Roles] ([Id], [UserId], [Role]) VALUES (60, 33, 2)
INSERT [dbo].[Roles] ([Id], [UserId], [Role]) VALUES (61, 34, 2)
INSERT [dbo].[Roles] ([Id], [UserId], [Role]) VALUES (64, 69, 5)
INSERT [dbo].[Roles] ([Id], [UserId], [Role]) VALUES (65, 70, 2)
INSERT [dbo].[Roles] ([Id], [UserId], [Role]) VALUES (66, 71, 5)
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[RolesString] ON 

INSERT [dbo].[RolesString] ([Id], [Roles]) VALUES (0, N'admin')
INSERT [dbo].[RolesString] ([Id], [Roles]) VALUES (1, N'Manager')
INSERT [dbo].[RolesString] ([Id], [Roles]) VALUES (2, N'Designer')
INSERT [dbo].[RolesString] ([Id], [Roles]) VALUES (3, N'Sales')
INSERT [dbo].[RolesString] ([Id], [Roles]) VALUES (4, N'Human Resources')
INSERT [dbo].[RolesString] ([Id], [Roles]) VALUES (5, N'Members')
SET IDENTITY_INSERT [dbo].[RolesString] OFF
GO
SET IDENTITY_INSERT [dbo].[SkuItems] ON 

INSERT [dbo].[SkuItems] ([Id], [ProductSkuId], [key], [value], [Price]) VALUES (13, 2, N'cpu/harddrive/memory/gpu', N'I7-14600/1T/32G/RTX3070', 5000)
INSERT [dbo].[SkuItems] ([Id], [ProductSkuId], [key], [value], [Price]) VALUES (39, 2, N'cpu/harddrive/memory/gpu', N'I7-14700/2T/64G/RTX3080', 20000)
INSERT [dbo].[SkuItems] ([Id], [ProductSkuId], [key], [value], [Price]) VALUES (52, 14, N'cpu/harddrive/memory/gpu', N'I7-14500/2T/32G,RTX3060', 2000)
INSERT [dbo].[SkuItems] ([Id], [ProductSkuId], [key], [value], [Price]) VALUES (53, 14, N'cpu/harddrive/memory/gpu', N'I7-14700/2T/32G,RTX3070', 7000)
INSERT [dbo].[SkuItems] ([Id], [ProductSkuId], [key], [value], [Price]) VALUES (56, 16, N'cpu/harddrive/memory/gpu', N'I7-14500/1T/16G/RTX3060', 3000)
INSERT [dbo].[SkuItems] ([Id], [ProductSkuId], [key], [value], [Price]) VALUES (57, 16, N'cpu/harddrive/memory/gpu', N'I7-14500/1T/32G/RTX3070', 7500)
INSERT [dbo].[SkuItems] ([Id], [ProductSkuId], [key], [value], [Price]) VALUES (61, 17, N'cpu/harddrive/memory/gpu', N'I7-13700K/1T/32G/RTX4080', 10000)
INSERT [dbo].[SkuItems] ([Id], [ProductSkuId], [key], [value], [Price]) VALUES (62, 17, N'cpu/harddrive/memory/gpu', N'I7-13700K/2T/64G/RTX4080', 15000)
INSERT [dbo].[SkuItems] ([Id], [ProductSkuId], [key], [value], [Price]) VALUES (63, 18, N'cpu/harddrive/memory/gpu', N'R5-7600H/512G/16G/RTX4060', 8000)
INSERT [dbo].[SkuItems] ([Id], [ProductSkuId], [key], [value], [Price]) VALUES (64, 18, N'cpu/harddrive/memory/gpu', N'R5-7600H/1T/32G/RTX4060', 12000)
INSERT [dbo].[SkuItems] ([Id], [ProductSkuId], [key], [value], [Price]) VALUES (65, 19, N'cpu/harddrive/memory/gpu', N'I9-13900K/1T/32G/RTX4090', 12000)
INSERT [dbo].[SkuItems] ([Id], [ProductSkuId], [key], [value], [Price]) VALUES (66, 19, N'cpu/harddrive/memory/gpu', N'I9-13900K/2T/64G/RTX4090', 18000)
INSERT [dbo].[SkuItems] ([Id], [ProductSkuId], [key], [value], [Price]) VALUES (67, 20, N'cpu/harddrive/memory/gpu', N'R7-7730U/512G/16G/RTX4050', 9000)
INSERT [dbo].[SkuItems] ([Id], [ProductSkuId], [key], [value], [Price]) VALUES (68, 20, N'cpu/harddrive/memory/gpu', N'R7-7730U/1T/32G/RTX4050', 14000)
INSERT [dbo].[SkuItems] ([Id], [ProductSkuId], [key], [value], [Price]) VALUES (69, 21, N'cpu/harddrive/memory/gpu', N'I7-13700H/512G/32G/RTX4070', 11000)
INSERT [dbo].[SkuItems] ([Id], [ProductSkuId], [key], [value], [Price]) VALUES (70, 21, N'cpu/harddrive/memory/gpu', N'I7-13700H/1T/64G/RTX4070', 16000)
INSERT [dbo].[SkuItems] ([Id], [ProductSkuId], [key], [value], [Price]) VALUES (71, 22, N'cpu/harddrive/memory/gpu', N'I7-12700K/1T/32G/RTX4080', 10000)
INSERT [dbo].[SkuItems] ([Id], [ProductSkuId], [key], [value], [Price]) VALUES (72, 22, N'cpu/harddrive/memory/gpu', N'I7-12700K/2T/64G/RTX4080', 15000)
INSERT [dbo].[SkuItems] ([Id], [ProductSkuId], [key], [value], [Price]) VALUES (73, 23, N'cpu/harddrive/memory/gpu', N'R5-7600X/512G/16G/RTX4070', 9000)
INSERT [dbo].[SkuItems] ([Id], [ProductSkuId], [key], [value], [Price]) VALUES (74, 23, N'cpu/harddrive/memory/gpu', N'R5-7600X/1T/32G/RTX4070', 13000)
INSERT [dbo].[SkuItems] ([Id], [ProductSkuId], [key], [value], [Price]) VALUES (75, 24, N'cpu/harddrive/memory/gpu', N'I5-13600K/512G/16G/RTX4060', 7500)
INSERT [dbo].[SkuItems] ([Id], [ProductSkuId], [key], [value], [Price]) VALUES (76, 24, N'cpu/harddrive/memory/gpu', N'I5-13600K/1T/32G/RTX4060', 11500)
INSERT [dbo].[SkuItems] ([Id], [ProductSkuId], [key], [value], [Price]) VALUES (77, 25, N'cpu/harddrive/memory/gpu', N'I9-13900K/1T/32G/RTX4090', 12000)
INSERT [dbo].[SkuItems] ([Id], [ProductSkuId], [key], [value], [Price]) VALUES (78, 25, N'cpu/harddrive/memory/gpu', N'I9-13900K/2T/64G/RTX4090', 18000)
INSERT [dbo].[SkuItems] ([Id], [ProductSkuId], [key], [value], [Price]) VALUES (79, 26, N'cpu/harddrive/memory/gpu', N'R7-7730U/512G/16G/RTX4060', 9000)
INSERT [dbo].[SkuItems] ([Id], [ProductSkuId], [key], [value], [Price]) VALUES (80, 26, N'cpu/harddrive/memory/gpu', N'R7-7730U/1T/32G/RTX4060', 14000)
INSERT [dbo].[SkuItems] ([Id], [ProductSkuId], [key], [value], [Price]) VALUES (81, 27, N'cpu/harddrive/memory/gpu', N'I9-13900HX/1T/32G/RTX4080', 11000)
INSERT [dbo].[SkuItems] ([Id], [ProductSkuId], [key], [value], [Price]) VALUES (82, 27, N'cpu/harddrive/memory/gpu', N'I9-13900HX/2T/64G/RTX4080', 16000)
INSERT [dbo].[SkuItems] ([Id], [ProductSkuId], [key], [value], [Price]) VALUES (83, 28, N'cpu/harddrive/memory/gpu', N'R7-7730U/512G/16G/RTX4050', 9000)
INSERT [dbo].[SkuItems] ([Id], [ProductSkuId], [key], [value], [Price]) VALUES (84, 28, N'cpu/harddrive/memory/gpu', N'R7-7730U/1T/32G/RTX4050', 13000)
INSERT [dbo].[SkuItems] ([Id], [ProductSkuId], [key], [value], [Price]) VALUES (85, 29, N'cpu/harddrive/memory/gpu', N'I7-13700H/512G/32G/RTX4070', 10000)
INSERT [dbo].[SkuItems] ([Id], [ProductSkuId], [key], [value], [Price]) VALUES (86, 29, N'cpu/harddrive/memory/gpu', N'I7-13700H/1T/64G/RTX4070', 15000)
INSERT [dbo].[SkuItems] ([Id], [ProductSkuId], [key], [value], [Price]) VALUES (87, 30, N'cpu/harddrive/memory/gpu', N'I9-13900K/1T/32G/RTX4090', 12000)
INSERT [dbo].[SkuItems] ([Id], [ProductSkuId], [key], [value], [Price]) VALUES (88, 30, N'cpu/harddrive/memory/gpu', N'I9-13900K/2T/64G/RTX4090', 18000)
INSERT [dbo].[SkuItems] ([Id], [ProductSkuId], [key], [value], [Price]) VALUES (89, 31, N'cpu/harddrive/memory/gpu', N'R5-7600H/512G/16G/RTX4060', 7500)
INSERT [dbo].[SkuItems] ([Id], [ProductSkuId], [key], [value], [Price]) VALUES (90, 31, N'cpu/harddrive/memory/gpu', N'R5-7600H/1T/32G/RTX4060', 11500)
INSERT [dbo].[SkuItems] ([Id], [ProductSkuId], [key], [value], [Price]) VALUES (91, 32, N'cpu/harddrive/memory/gpu', N'I7-13700H/512G/32G/RTX4070', 10000)
INSERT [dbo].[SkuItems] ([Id], [ProductSkuId], [key], [value], [Price]) VALUES (92, 32, N'cpu/harddrive/memory/gpu', N'I7-13700H/1T/64G/RTX4070', 15000)
INSERT [dbo].[SkuItems] ([Id], [ProductSkuId], [key], [value], [Price]) VALUES (105, 2, N'cpu/harddrive/memory/gpu', N'超級方向盤', 1)
INSERT [dbo].[SkuItems] ([Id], [ProductSkuId], [key], [value], [Price]) VALUES (107, 2, N'cpu/harddrive/memory/gpu', N'i9-9900K/3T/64G/RTX3090Ti', 200000)
SET IDENTITY_INSERT [dbo].[SkuItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Name], [Gender], [Account], [Password], [Phone], [Email], [Address], [Status], [IsConfirmed], [ConfirmCode], [CreateDate], [ModifyDate]) VALUES (30, N'Santiago', 1, N'santiago', N'3B92EF2C5FC6DD5178C6F6D62A846958BE3FB6233E73A969BEC92CD1DBAE4FD1', N'0912345678', N'santiago@gmail.com', N'台北市中正區延平南路96號', 0, 1, NULL, CAST(N'2024-09-23T15:45:48.367' AS DateTime), CAST(N'2024-09-23T15:45:48.367' AS DateTime))
INSERT [dbo].[Users] ([Id], [Name], [Gender], [Account], [Password], [Phone], [Email], [Address], [Status], [IsConfirmed], [ConfirmCode], [CreateDate], [ModifyDate]) VALUES (31, N'jason', 1, N'jason', N'3B92EF2C5FC6DD5178C6F6D62A846958BE3FB6233E73A969BEC92CD1DBAE4FD1', N'0923548561', N'jason@gmail.com', N'臺北市大安區忠孝東路四段325號', 1, 1, NULL, CAST(N'2024-09-24T09:08:05.987' AS DateTime), CAST(N'2024-09-24T09:08:05.987' AS DateTime))
INSERT [dbo].[Users] ([Id], [Name], [Gender], [Account], [Password], [Phone], [Email], [Address], [Status], [IsConfirmed], [ConfirmCode], [CreateDate], [ModifyDate]) VALUES (32, N'Ame', 0, N'ame', N'3B92EF2C5FC6DD5178C6F6D62A846958BE3FB6233E73A969BEC92CD1DBAE4FD1', N'0934587423', N'peter@gmail.com', N'新北市板橋區文化路二段166號', 1, 1, NULL, CAST(N'2024-09-24T15:29:01.653' AS DateTime), CAST(N'2024-09-24T15:29:01.653' AS DateTime))
INSERT [dbo].[Users] ([Id], [Name], [Gender], [Account], [Password], [Phone], [Email], [Address], [Status], [IsConfirmed], [ConfirmCode], [CreateDate], [ModifyDate]) VALUES (33, N'gura', 0, N'gura', N'3B92EF2C5FC6DD5178C6F6D62A846958BE3FB6233E73A969BEC92CD1DBAE4FD1', N'0925365478', N'gura@gmail.com', N'桃園市中壢區元化路136巷12號', 1, 1, NULL, CAST(N'2024-09-25T16:35:37.553' AS DateTime), CAST(N'2024-09-25T16:35:37.553' AS DateTime))
INSERT [dbo].[Users] ([Id], [Name], [Gender], [Account], [Password], [Phone], [Email], [Address], [Status], [IsConfirmed], [ConfirmCode], [CreateDate], [ModifyDate]) VALUES (34, N'dio', 1, N'dio', N'3B92EF2C5FC6DD5178C6F6D62A846958BE3FB6233E73A969BEC92CD1DBAE4FD1', N'0925365445', N'gura@gmail.com', N'臺中市北區博館路55巷18號', 1, 1, NULL, CAST(N'2024-09-25T16:44:09.373' AS DateTime), CAST(N'2024-09-25T16:44:09.373' AS DateTime))
INSERT [dbo].[Users] ([Id], [Name], [Gender], [Account], [Password], [Phone], [Email], [Address], [Status], [IsConfirmed], [ConfirmCode], [CreateDate], [ModifyDate]) VALUES (35, N'Ina', 0, N'ina', N'3B92EF2C5FC6DD5178C6F6D62A846958BE3FB6233E73A969BEC92CD1DBAE4FD1', N'0987459234', N'ina@gmail.com', N'高雄市左營區文自路45號', 1, 1, NULL, CAST(N'2024-09-26T09:09:59.817' AS DateTime), CAST(N'2024-09-26T09:09:59.817' AS DateTime))
INSERT [dbo].[Users] ([Id], [Name], [Gender], [Account], [Password], [Phone], [Email], [Address], [Status], [IsConfirmed], [ConfirmCode], [CreateDate], [ModifyDate]) VALUES (36, N'Tim1', 1, N'tim', N'DF44428CBF022152CB39B50C34F407367B6D06FFAE1A9B2DB73621CE36571991', N'0923543765', N'tim@gmail.com', N'基隆市仁愛區愛三路5號', 1, 1, NULL, CAST(N'2024-09-26T09:18:00.883' AS DateTime), CAST(N'2024-09-26T09:18:00.883' AS DateTime))
INSERT [dbo].[Users] ([Id], [Name], [Gender], [Account], [Password], [Phone], [Email], [Address], [Status], [IsConfirmed], [ConfirmCode], [CreateDate], [ModifyDate]) VALUES (37, N'Yee', 1, N'yee', N'3B92EF2C5FC6DD5178C6F6D62A846958BE3FB6233E73A969BEC92CD1DBAE4FD1', N'0974123698', N'yee@gmail.com', N'臺南市永康區中山南路23號', 0, 1, NULL, CAST(N'2024-09-26T09:47:14.990' AS DateTime), CAST(N'2024-09-26T09:47:14.990' AS DateTime))
INSERT [dbo].[Users] ([Id], [Name], [Gender], [Account], [Password], [Phone], [Email], [Address], [Status], [IsConfirmed], [ConfirmCode], [CreateDate], [ModifyDate]) VALUES (38, N'廖宏銘', 1, N'jack', N'279DA512F953936B0E3F7D24F7DBD4B70BFE5400BA6163E972EF6EF09FFABED7', N'0919077083', N'pianoprince35@gmail.com', N'安泰路60巷55弄54號', 1, 1, NULL, CAST(N'2024-09-30T13:38:14.147' AS DateTime), CAST(N'2024-09-30T13:38:14.147' AS DateTime))
INSERT [dbo].[Users] ([Id], [Name], [Gender], [Account], [Password], [Phone], [Email], [Address], [Status], [IsConfirmed], [ConfirmCode], [CreateDate], [ModifyDate]) VALUES (49, N'卓大雲', 0, N'ayun0505', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', N'0909328595', N'ss860505@gmail.com', N'臺北市信義區松高路68號', 0, 1, NULL, CAST(N'2024-10-02T16:56:27.107' AS DateTime), CAST(N'2024-10-02T16:56:27.107' AS DateTime))
INSERT [dbo].[Users] ([Id], [Name], [Gender], [Account], [Password], [Phone], [Email], [Address], [Status], [IsConfirmed], [ConfirmCode], [CreateDate], [ModifyDate]) VALUES (50, N'liao', 0, N'liao', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', N'0919077083', N'pianoprince35@gmail.com', N'彰化縣彰化市中正路二段302號', 0, 1, NULL, CAST(N'2024-10-02T18:50:47.497' AS DateTime), CAST(N'2024-10-02T18:50:47.497' AS DateTime))
INSERT [dbo].[Users] ([Id], [Name], [Gender], [Account], [Password], [Phone], [Email], [Address], [Status], [IsConfirmed], [ConfirmCode], [CreateDate], [ModifyDate]) VALUES (51, N'tom', 0, N'tom', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', N'0987654321', N'tom70714@gmail.com', N'嘉義市西區世賢路一段87號', 0, 1, NULL, CAST(N'2024-10-02T20:18:45.380' AS DateTime), CAST(N'2024-10-02T20:18:45.380' AS DateTime))
INSERT [dbo].[Users] ([Id], [Name], [Gender], [Account], [Password], [Phone], [Email], [Address], [Status], [IsConfirmed], [ConfirmCode], [CreateDate], [ModifyDate]) VALUES (55, N'楊融融', 0, N'tom70714', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', N'0987654321', N'pianoprince35@gmail.com', N'新北市永和區中正路312號', 0, 1, NULL, CAST(N'2024-10-04T11:20:26.623' AS DateTime), CAST(N'2024-10-04T11:20:26.623' AS DateTime))
INSERT [dbo].[Users] ([Id], [Name], [Gender], [Account], [Password], [Phone], [Email], [Address], [Status], [IsConfirmed], [ConfirmCode], [CreateDate], [ModifyDate]) VALUES (56, N'阿泰', 0, N'mrt520889', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', N'0963935977', N'zscx520071@gmail.com', N'新竹市東區光復路二段56號', 0, 1, NULL, CAST(N'2024-10-04T16:39:25.227' AS DateTime), CAST(N'2024-10-04T16:39:25.227' AS DateTime))
INSERT [dbo].[Users] ([Id], [Name], [Gender], [Account], [Password], [Phone], [Email], [Address], [Status], [IsConfirmed], [ConfirmCode], [CreateDate], [ModifyDate]) VALUES (62, N'陳小明', 0, N'user001', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', N'0912345678', N'tom841110@gmail.com', N'台北市大安區和平東路1號', 0, 1, NULL, CAST(N'2024-10-05T13:39:29.970' AS DateTime), CAST(N'2024-10-05T13:39:29.970' AS DateTime))
INSERT [dbo].[Users] ([Id], [Name], [Gender], [Account], [Password], [Phone], [Email], [Address], [Status], [IsConfirmed], [ConfirmCode], [CreateDate], [ModifyDate]) VALUES (63, N'李小華', 1, N'user002', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', N'0923456789', N'tom841110@gmail.com', N'新北市三峽區文化路2號', 0, 1, NULL, CAST(N'2024-10-05T13:39:29.970' AS DateTime), CAST(N'2024-10-05T13:39:29.970' AS DateTime))
INSERT [dbo].[Users] ([Id], [Name], [Gender], [Account], [Password], [Phone], [Email], [Address], [Status], [IsConfirmed], [ConfirmCode], [CreateDate], [ModifyDate]) VALUES (64, N'張大志', 0, N'user003', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', N'0934567890', N'tom841110@gmail.com', N'高雄市苓雅區建國路3號', 0, 1, NULL, CAST(N'2024-10-05T13:39:29.970' AS DateTime), CAST(N'2024-10-05T13:39:29.970' AS DateTime))
INSERT [dbo].[Users] ([Id], [Name], [Gender], [Account], [Password], [Phone], [Email], [Address], [Status], [IsConfirmed], [ConfirmCode], [CreateDate], [ModifyDate]) VALUES (65, N'王美麗', 1, N'user004', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', N'0945678901', N'tom841110@gmail.com', N'台中市西區公益路4號', 0, 1, NULL, CAST(N'2024-10-05T13:39:29.970' AS DateTime), CAST(N'2024-10-05T13:39:29.970' AS DateTime))
INSERT [dbo].[Users] ([Id], [Name], [Gender], [Account], [Password], [Phone], [Email], [Address], [Status], [IsConfirmed], [ConfirmCode], [CreateDate], [ModifyDate]) VALUES (66, N'劉建國', 0, N'user005', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', N'0956789012', N'tom841110@gmail.com', N'台南市中西區民生路5號', 0, 1, NULL, CAST(N'2024-10-05T13:39:29.970' AS DateTime), CAST(N'2024-10-05T13:39:29.970' AS DateTime))
INSERT [dbo].[Users] ([Id], [Name], [Gender], [Account], [Password], [Phone], [Email], [Address], [Status], [IsConfirmed], [ConfirmCode], [CreateDate], [ModifyDate]) VALUES (69, N'林孟勳', 0, N'lemon870703', N'd0659ccd042acc1ac38c2a0abfacf2c910f4bf5b36351f1f27eaac4fabaec033', N'0966777888', N'zscx520071@gmail.com', N'台北市中正區濟南路一段321號', 0, 1, NULL, CAST(N'2024-10-07T15:02:36.070' AS DateTime), CAST(N'2024-10-07T15:02:36.070' AS DateTime))
INSERT [dbo].[Users] ([Id], [Name], [Gender], [Account], [Password], [Phone], [Email], [Address], [Status], [IsConfirmed], [ConfirmCode], [CreateDate], [ModifyDate]) VALUES (70, N'John', 1, N'john', N'FBEBD2BDA4900A1257B40A60825E32177C5C6C97AB2D80BCB2F85B8F893CFA86', N'0936521485', N'john@gmail.com', N'台北市信義區松智路100號', 0, 0, N'b66ad8ed8ac346709cdddec6345cfc0e', CAST(N'2024-10-07T15:16:21.440' AS DateTime), CAST(N'2024-10-07T15:16:21.440' AS DateTime))
INSERT [dbo].[Users] ([Id], [Name], [Gender], [Account], [Password], [Phone], [Email], [Address], [Status], [IsConfirmed], [ConfirmCode], [CreateDate], [ModifyDate]) VALUES (71, N'林勳', 0, N'lemon8707031', N'21dcf7c8b4effd61ccb2ac290d892592d67150c3ed3f54d0810916e475b213b4', N'0966777888', N'zscx520071@gmail.com', N'台北市中正區濟南路一段321號', 0, 1, NULL, CAST(N'2024-10-07T16:20:21.930' AS DateTime), CAST(N'2024-10-07T16:20:21.930' AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Brands] ADD  CONSTRAINT [DF_Brand_Stauts]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Images] ADD  CONSTRAINT [DF_Images_ModifyCreate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[MemberFollowLists] ADD  CONSTRAINT [DF_MemberFollowLists_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_ModifyDate]  DEFAULT (getdate()) FOR [ModifyDate]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_ModifyDate]  DEFAULT (getdate()) FOR [ModifyDate]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Members_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Members_ModifyDate]  DEFAULT (getdate()) FOR [ModifyDate]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_ProductSkus] FOREIGN KEY([ProductSkuId])
REFERENCES [dbo].[ProductSkus] ([Id])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_ProductSkus]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_SkuItems] FOREIGN KEY([SkuItemId])
REFERENCES [dbo].[SkuItems] ([Id])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_SkuItems]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Users]
GO
ALTER TABLE [dbo].[Images]  WITH CHECK ADD  CONSTRAINT [FK_Images_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Images] CHECK CONSTRAINT [FK_Images_Products]
GO
ALTER TABLE [dbo].[MemberFollowLists]  WITH CHECK ADD  CONSTRAINT [FK_MemberFollowLists_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[MemberFollowLists] CHECK CONSTRAINT [FK_MemberFollowLists_Products]
GO
ALTER TABLE [dbo].[MemberFollowLists]  WITH CHECK ADD  CONSTRAINT [FK_MemberFollowLists_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[MemberFollowLists] CHECK CONSTRAINT [FK_MemberFollowLists_Users]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Orders] FOREIGN KEY([ProductSkuId])
REFERENCES [dbo].[ProductSkus] ([Id])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Orders]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Orders1] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Orders1]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_SkuItems] FOREIGN KEY([SkuItemId])
REFERENCES [dbo].[SkuItems] ([Id])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_SkuItems]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Brands] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brands] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Brands]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductCategories] FOREIGN KEY([ProductCategoryId])
REFERENCES [dbo].[ProductCategories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductCategories]
GO
ALTER TABLE [dbo].[ProductSkus]  WITH CHECK ADD  CONSTRAINT [FK_ProductSkus_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[ProductSkus] CHECK CONSTRAINT [FK_ProductSkus_Products]
GO
ALTER TABLE [dbo].[Roles]  WITH CHECK ADD  CONSTRAINT [FK_Roles_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Roles] CHECK CONSTRAINT [FK_Roles_Users]
GO
ALTER TABLE [dbo].[SkuItems]  WITH CHECK ADD  CONSTRAINT [FK_SkuItems_ProductSkus] FOREIGN KEY([ProductSkuId])
REFERENCES [dbo].[ProductSkus] ([Id])
GO
ALTER TABLE [dbo].[SkuItems] CHECK CONSTRAINT [FK_SkuItems_ProductSkus]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0=管理員 1=員工' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Roles', @level2type=N'COLUMN',@level2name=N'Role'
GO
USE [master]
GO
ALTER DATABASE [Fat4Fun] SET  READ_WRITE 
GO
