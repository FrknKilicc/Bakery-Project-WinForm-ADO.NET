USE [master]
GO
/****** Object:  Database [borcelle_bakery]    Script Date: 13.10.2023 02:15:40 ******/
CREATE DATABASE [borcelle_bakery]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'borcelle_bakery', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.FURKANKILIC\MSSQL\DATA\borcelle_bakery.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'borcelle_bakery_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.FURKANKILIC\MSSQL\DATA\borcelle_bakery_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [borcelle_bakery] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [borcelle_bakery].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [borcelle_bakery] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [borcelle_bakery] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [borcelle_bakery] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [borcelle_bakery] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [borcelle_bakery] SET ARITHABORT OFF 
GO
ALTER DATABASE [borcelle_bakery] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [borcelle_bakery] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [borcelle_bakery] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [borcelle_bakery] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [borcelle_bakery] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [borcelle_bakery] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [borcelle_bakery] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [borcelle_bakery] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [borcelle_bakery] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [borcelle_bakery] SET  ENABLE_BROKER 
GO
ALTER DATABASE [borcelle_bakery] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [borcelle_bakery] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [borcelle_bakery] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [borcelle_bakery] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [borcelle_bakery] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [borcelle_bakery] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [borcelle_bakery] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [borcelle_bakery] SET RECOVERY FULL 
GO
ALTER DATABASE [borcelle_bakery] SET  MULTI_USER 
GO
ALTER DATABASE [borcelle_bakery] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [borcelle_bakery] SET DB_CHAINING OFF 
GO
ALTER DATABASE [borcelle_bakery] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [borcelle_bakery] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [borcelle_bakery] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [borcelle_bakery] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'borcelle_bakery', N'ON'
GO
ALTER DATABASE [borcelle_bakery] SET QUERY_STORE = ON
GO
ALTER DATABASE [borcelle_bakery] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [borcelle_bakery]
GO
/****** Object:  Table [dbo].[Musteri]    Script Date: 13.10.2023 02:15:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Musteri](
	[MusteriID] [int] IDENTITY(1,1) NOT NULL,
	[MusteriAdi] [varchar](50) NULL,
	[MusteriSifre] [varchar](50) NOT NULL,
	[MusteriTelNo] [char](30) NULL,
 CONSTRAINT [PK_Musteri] PRIMARY KEY CLUSTERED 
(
	[MusteriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderDetails]    Script Date: 13.10.2023 02:15:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderDetails](
	[SiparisID] [int] NULL,
	[UrunlerID] [int] NOT NULL,
	[BirimFiyat] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 13.10.2023 02:15:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[SiparisID] [int] NOT NULL,
	[MusteriID] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[SiparisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 13.10.2023 02:15:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProducID] [int] IDENTITY(1001,1) NOT NULL,
	[UrunlerAdi] [varchar](50) NULL,
	[UrunKodu] [varchar](50) NULL,
	[BirimFiyat] [money] NULL,
	[kategoriID] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProducID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yonetici]    Script Date: 13.10.2023 02:15:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yonetici](
	[YoneticiID] [int] IDENTITY(1,1) NOT NULL,
	[YoneticiAdi] [varchar](50) NULL,
	[YoneticiSifre] [varchar](50) NOT NULL,
	[YoneticiTelNo] [char](20) NULL,
 CONSTRAINT [PK_Yonetici] PRIMARY KEY CLUSTERED 
(
	[YoneticiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Musteri] ON 

INSERT [dbo].[Musteri] ([MusteriID], [MusteriAdi], [MusteriSifre], [MusteriTelNo]) VALUES (1, N'furkan', N'123', N'(544) 260-3193                ')
SET IDENTITY_INSERT [dbo].[Musteri] OFF
GO
INSERT [dbo].[orderDetails] ([SiparisID], [UrunlerID], [BirimFiyat]) VALUES (NULL, 1001, 50.0000)
INSERT [dbo].[orderDetails] ([SiparisID], [UrunlerID], [BirimFiyat]) VALUES (NULL, 1001, 80.0000)
INSERT [dbo].[orderDetails] ([SiparisID], [UrunlerID], [BirimFiyat]) VALUES (1, 1001, 80.0000)
GO
INSERT [dbo].[Orders] ([SiparisID], [MusteriID]) VALUES (1, 1)
INSERT [dbo].[Orders] ([SiparisID], [MusteriID]) VALUES (2, 1)
INSERT [dbo].[Orders] ([SiparisID], [MusteriID]) VALUES (3, 1)
INSERT [dbo].[Orders] ([SiparisID], [MusteriID]) VALUES (4, 1)
INSERT [dbo].[Orders] ([SiparisID], [MusteriID]) VALUES (5, 1)
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProducID], [UrunlerAdi], [UrunKodu], [BirimFiyat], [kategoriID]) VALUES (1001, N'Termos', N'as-1', 50.0000, NULL)
INSERT [dbo].[Products] ([ProducID], [UrunlerAdi], [UrunKodu], [BirimFiyat], [kategoriID]) VALUES (1002, N'Kahve', N'as-2', 70.0000, NULL)
INSERT [dbo].[Products] ([ProducID], [UrunlerAdi], [UrunKodu], [BirimFiyat], [kategoriID]) VALUES (1003, N'Süt Tozu', N'as-3', 45.0000, NULL)
INSERT [dbo].[Products] ([ProducID], [UrunlerAdi], [UrunKodu], [BirimFiyat], [kategoriID]) VALUES (1004, N'Şeker', N'as-4', 60.0000, NULL)
INSERT [dbo].[Products] ([ProducID], [UrunlerAdi], [UrunKodu], [BirimFiyat], [kategoriID]) VALUES (1005, N'Çay', N'as-5', 80.0000, NULL)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Yonetici] ON 

INSERT [dbo].[Yonetici] ([YoneticiID], [YoneticiAdi], [YoneticiSifre], [YoneticiTelNo]) VALUES (1, N'furkan', N'12', N'(544) 260-3193      ')
INSERT [dbo].[Yonetici] ([YoneticiID], [YoneticiAdi], [YoneticiSifre], [YoneticiTelNo]) VALUES (2, N'dilara', N'123', N'(544) 260-3193      ')
SET IDENTITY_INSERT [dbo].[Yonetici] OFF
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Musteri] FOREIGN KEY([MusteriID])
REFERENCES [dbo].[Musteri] ([MusteriID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Musteri]
GO
/****** Object:  StoredProcedure [dbo].[productlist]    Script Date: 13.10.2023 02:15:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[productlist]	
as begin
select * from Products
end
GO
/****** Object:  StoredProcedure [dbo].[Urunekle]    Script Date: 13.10.2023 02:15:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Urunekle]

(

@UrunlerAdi varchar(50),
@UrunKodu varchar (50),
@BirimFiyat money



)
as begin

insert into Products (UrunlerAdi,UrunKodu,BirimFiyat) values (@UrunlerAdi,@UrunKodu,@BirimFiyat)

end
GO
USE [master]
GO
ALTER DATABASE [borcelle_bakery] SET  READ_WRITE 
GO
