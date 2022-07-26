USE [master]
GO
/****** Object:  Database [EshoppingDB]    Script Date: 22/07/2022 20:41 ******/
CREATE DATABASE [EshoppingDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EshoppingDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\EshoppingDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EshoppingDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\EshoppingDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [EshoppingDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EshoppingDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EshoppingDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EshoppingDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EshoppingDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EshoppingDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EshoppingDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [EshoppingDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EshoppingDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EshoppingDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EshoppingDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EshoppingDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EshoppingDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EshoppingDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EshoppingDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EshoppingDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EshoppingDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EshoppingDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EshoppingDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EshoppingDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EshoppingDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EshoppingDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EshoppingDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EshoppingDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EshoppingDB] SET RECOVERY FULL 
GO
ALTER DATABASE [EshoppingDB] SET  MULTI_USER 
GO
ALTER DATABASE [EshoppingDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EshoppingDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EshoppingDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EshoppingDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EshoppingDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'EshoppingDB', N'ON'
GO
ALTER DATABASE [EshoppingDB] SET QUERY_STORE = OFF
GO
USE [EshoppingDB]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 22/07/2022 20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CatName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FinalOrder]    Script Date: 22/07/2022 20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FinalOrder](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Address] [nvarchar](max) NULL,
	[State] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Zip] [int] NULL,
	[Email] [nvarchar](50) NULL,
	[OrderName] [nvarchar](50) NULL,
	[OrderQuantity] [decimal](18, 2) NULL,
	[OrderPrice] [decimal](18, 2) NULL,
	[UserName] [nvarchar](200) NULL,
 CONSTRAINT [PK_FinalOrder] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 22/07/2022 20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[IsAdmin] [int] NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MyOrder]    Script Date: 22/07/2022 20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MyOrder](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NULL,
	[ProductCategory] [nvarchar](50) NULL,
	[ProductPrice] [decimal](18, 2) NULL,
 CONSTRAINT [PK_MyOrder] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 22/07/2022 20:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](max) NULL,
	[ProductDescription] [nvarchar](max) NULL,
	[Category] [nvarchar](50) NULL,
	[ProductImage] [nvarchar](max) NULL,
	[ProductDiscount] [decimal](18, 2) NULL,
	[ProductMRP] [decimal](18, 2) NULL,
	[ProductSellingPrice] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [CatName]) VALUES (1, N'Mobile')
INSERT [dbo].[Category] ([Id], [CatName]) VALUES (2, N'Clothes')
INSERT [dbo].[Category] ([Id], [CatName]) VALUES (1002, N'Laptop')
INSERT [dbo].[Category] ([Id], [CatName]) VALUES (1003, N'TV')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[FinalOrder] ON 

INSERT [dbo].[FinalOrder] ([Id], [FirstName], [LastName], [Address], [State], [City], [Zip], [Email], [OrderName], [OrderQuantity], [OrderPrice], [UserName]) VALUES (1, N'Omkar', N'Dhumal', N'33,saibaba nagar', N'Maharashtra', N'Pune', 440034, N'omi@gmail.com', N'Iphone8', CAST(1.00 AS Decimal(18, 2)), CAST(50000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[FinalOrder] ([Id], [FirstName], [LastName], [Address], [State], [City], [Zip], [Email], [OrderName], [OrderQuantity], [OrderPrice], [UserName]) VALUES (2, N'', N'', N'', N'', N'', 0, N'', N'', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[FinalOrder] ([Id], [FirstName], [LastName], [Address], [State], [City], [Zip], [Email], [OrderName], [OrderQuantity], [OrderPrice], [UserName]) VALUES (3, N'', N'', N'', N'3', N'', 0, N'', N'', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[FinalOrder] ([Id], [FirstName], [LastName], [Address], [State], [City], [Zip], [Email], [OrderName], [OrderQuantity], [OrderPrice], [UserName]) VALUES (4, N'akshay', N'', N'', N'4', N'', 0, N'', N'', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'asd@asd.asdcom')
INSERT [dbo].[FinalOrder] ([Id], [FirstName], [LastName], [Address], [State], [City], [Zip], [Email], [OrderName], [OrderQuantity], [OrderPrice], [UserName]) VALUES (5, N'fgf', N'', N'', N'Maharashtra', N'', 0, N'', N'', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'asd@asd.asdcom')
INSERT [dbo].[FinalOrder] ([Id], [FirstName], [LastName], [Address], [State], [City], [Zip], [Email], [OrderName], [OrderQuantity], [OrderPrice], [UserName]) VALUES (6, N'akshay', N'patil', N'33 nehru nagar', N'Delhi', N'Delhi', 4187, N'kj@gmail', N'', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'asd@asd.asdcom')
INSERT [dbo].[FinalOrder] ([Id], [FirstName], [LastName], [Address], [State], [City], [Zip], [Email], [OrderName], [OrderQuantity], [OrderPrice], [UserName]) VALUES (7, N'Vikash', N'Verma', N'asdasd ads', N'Maharashtra', N'Mumbai', 122001, N'vikash@asdasd.com', N'', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'vikash@abcd.com')
SET IDENTITY_INSERT [dbo].[FinalOrder] OFF
SET IDENTITY_INSERT [dbo].[Login] ON 

INSERT [dbo].[Login] ([Id], [UserName], [Password], [IsAdmin]) VALUES (1, N'Akshay@123', N'111', NULL)
INSERT [dbo].[Login] ([Id], [UserName], [Password], [IsAdmin]) VALUES (3, N'Akshay@111', N'1111', NULL)
INSERT [dbo].[Login] ([Id], [UserName], [Password], [IsAdmin]) VALUES (4, N'Akshay@3334', N'3334', 1)
INSERT [dbo].[Login] ([Id], [UserName], [Password], [IsAdmin]) VALUES (5, N'Akshay@1233', N'123', NULL)
INSERT [dbo].[Login] ([Id], [UserName], [Password], [IsAdmin]) VALUES (6, N'ap@111', N'111', NULL)
INSERT [dbo].[Login] ([Id], [UserName], [Password], [IsAdmin]) VALUES (11, N'vikash@asd.com', N'1234', NULL)
INSERT [dbo].[Login] ([Id], [UserName], [Password], [IsAdmin]) VALUES (12, N'ram@k.com', N'1234', NULL)
INSERT [dbo].[Login] ([Id], [UserName], [Password], [IsAdmin]) VALUES (13, N'asd@rm.com', N'ads', NULL)
INSERT [dbo].[Login] ([Id], [UserName], [Password], [IsAdmin]) VALUES (14, N'asd.com', N'12', NULL)
INSERT [dbo].[Login] ([Id], [UserName], [Password], [IsAdmin]) VALUES (15, N'ad', N'asd', NULL)
INSERT [dbo].[Login] ([Id], [UserName], [Password], [IsAdmin]) VALUES (16, N'asd@asd.asdcom', N'asd', NULL)
INSERT [dbo].[Login] ([Id], [UserName], [Password], [IsAdmin]) VALUES (17, N'vikash@abcd.com', N'1234', NULL)
SET IDENTITY_INSERT [dbo].[Login] OFF
SET IDENTITY_INSERT [dbo].[MyOrder] ON 

INSERT [dbo].[MyOrder] ([Id], [ProductName], [ProductCategory], [ProductPrice]) VALUES (1, N'iphone8', N'Mobile', CAST(50000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[MyOrder] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [Category], [ProductImage], [ProductDiscount], [ProductMRP], [ProductSellingPrice]) VALUES (13, N'Bullmer', N'Striped Henley T-shirt', N'Tshirt', N'tshirt3.webp', CAST(31.00 AS Decimal(18, 2)), CAST(999.00 AS Decimal(18, 2)), CAST(689.00 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [Category], [ProductImage], [ProductDiscount], [ProductMRP], [ProductSellingPrice]) VALUES (15, N'EA7 EMPORIO ARMANI', N'Tennis Pro Printed Polo T-shirt', N'Tshirt', N'img1.webp', CAST(28.00 AS Decimal(18, 2)), CAST(10999.00 AS Decimal(18, 2)), CAST(7919.00 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [Category], [ProductImage], [ProductDiscount], [ProductMRP], [ProductSellingPrice]) VALUES (16, N'BULLMER', N'Colourblock Polo T-shirt', N'Tshirt', N'img2.jpg', CAST(35.00 AS Decimal(18, 2)), CAST(999.00 AS Decimal(18, 2)), CAST(649.00 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [Category], [ProductImage], [ProductDiscount], [ProductMRP], [ProductSellingPrice]) VALUES (18, N'ADIDAS', N'Logo Print Crew-Neck T-shirt', N'Tshirt', N'img3.webp', CAST(20.00 AS Decimal(18, 2)), CAST(999.00 AS Decimal(18, 2)), CAST(799.00 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [Category], [ProductImage], [ProductDiscount], [ProductMRP], [ProductSellingPrice]) VALUES (19, N'STELLERS', N'Solid Slim Fit Polo T-shirt', N'Tshirt', N'img5.jpg', CAST(64.00 AS Decimal(18, 2)), CAST(1999.00 AS Decimal(18, 2)), CAST(720.00 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [Category], [ProductImage], [ProductDiscount], [ProductMRP], [ProductSellingPrice]) VALUES (20, N'Bewakoof', N'Men Black Gohan Graphic Printed T-shirt', N'Tshirt', N'img6.webp', CAST(55.00 AS Decimal(18, 2)), CAST(999.00 AS Decimal(18, 2)), CAST(449.00 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [Category], [ProductImage], [ProductDiscount], [ProductMRP], [ProductSellingPrice]) VALUES (21, N'OFFICIAL NASA MERCHANDISE', N' Black Fly Me To The Moon Graphic Printed Oversized T-shirt', N'Tshirt', N'img7.webp', CAST(53.00 AS Decimal(18, 2)), CAST(1300.00 AS Decimal(18, 2)), CAST(599.00 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [Category], [ProductImage], [ProductDiscount], [ProductMRP], [ProductSellingPrice]) VALUES (22, N'Bewakoof', N' Black Anime Flamed Graphic Printed Oversized T-shirt', N'Tshirt', N'img8.webp', CAST(23.00 AS Decimal(18, 2)), CAST(1299.00 AS Decimal(18, 2)), CAST(999.00 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [Category], [ProductImage], [ProductDiscount], [ProductMRP], [ProductSellingPrice]) VALUES (23, N'Rigo', N' Black Walk the Walk Typography Polo T-shirt', N'Tshirt', N'img9.webp', CAST(60.00 AS Decimal(18, 2)), CAST(4000.00 AS Decimal(18, 2)), CAST(1600.00 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [Category], [ProductImage], [ProductDiscount], [ProductMRP], [ProductSellingPrice]) VALUES (24, N'Snitch', N' Rose Salmon Pink Graphic T Shirt', N'Tshirt', N'img10.webp', CAST(10.00 AS Decimal(18, 2)), CAST(799.00 AS Decimal(18, 2)), CAST(710.00 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [Category], [ProductImage], [ProductDiscount], [ProductMRP], [ProductSellingPrice]) VALUES (25, N'Bewakoof', N'  Blue Off Road Cotton Graphic Printed Hoodie T-shirt', N'Tshirt', N'img11.webp', CAST(50.00 AS Decimal(18, 2)), CAST(1399.00 AS Decimal(18, 2)), CAST(699.00 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [Category], [ProductImage], [ProductDiscount], [ProductMRP], [ProductSellingPrice]) VALUES (26, N'HueCoast', N'  Unisex Black & White Tie & Dye Relaxed Fit T-shirt', N'Tshirt', N'img12.webp', CAST(23.00 AS Decimal(18, 2)), CAST(899.00 AS Decimal(18, 2)), CAST(699.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Product] OFF
USE [master]
GO
ALTER DATABASE [EshoppingDB] SET  READ_WRITE 
GO
