USE [master]
GO
/****** Object:  Database [Pubs_DV]    Script Date: 6/26/2024 14:46:50 ******/
CREATE DATABASE [Pubs_DV]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Pubs_DV', FILENAME = N'D:\DataScience\Pubs_DV.mdf' , SIZE = 65536KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Pubs_DV_log', FILENAME = N'D:\DataScience\Pubs_DV_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 8192KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Pubs_DV] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Pubs_DV].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Pubs_DV] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Pubs_DV] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Pubs_DV] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Pubs_DV] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Pubs_DV] SET ARITHABORT OFF 
GO
ALTER DATABASE [Pubs_DV] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Pubs_DV] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Pubs_DV] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Pubs_DV] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Pubs_DV] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Pubs_DV] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Pubs_DV] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Pubs_DV] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Pubs_DV] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Pubs_DV] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Pubs_DV] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Pubs_DV] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Pubs_DV] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Pubs_DV] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Pubs_DV] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Pubs_DV] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Pubs_DV] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Pubs_DV] SET RECOVERY FULL 
GO
ALTER DATABASE [Pubs_DV] SET  MULTI_USER 
GO
ALTER DATABASE [Pubs_DV] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Pubs_DV] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Pubs_DV] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Pubs_DV] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Pubs_DV] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Pubs_DV] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Pubs_DV', N'ON'
GO
ALTER DATABASE [Pubs_DV] SET QUERY_STORE = OFF
GO
USE [Pubs_DV]
GO
/****** Object:  Table [dbo].[Author_Hub]    Script Date: 6/26/2024 14:46:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author_Hub](
	[Author_HSK] [varbinary](800) NOT NULL,
	[Author_BK] [varchar](11) NULL,
	[LoadDateTime] [datetime] NULL,
	[sourceSystem] [varchar](4) NULL,
	[LoadProcessID] [varchar](4) NULL,
PRIMARY KEY CLUSTERED 
(
	[Author_HSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authors_Sat]    Script Date: 6/26/2024 14:46:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors_Sat](
	[Author_HSK] [varbinary](800) NULL,
	[StartDateTime] [datetime] NULL,
	[EndDateTime] [int] NULL,
	[LoadDateTime] [datetime] NULL,
	[au_lname] [varchar](40) NULL,
	[au_fname] [varchar](20) NULL,
	[phone] [varchar](12) NULL,
	[address] [varchar](40) NULL,
	[city] [varchar](20) NULL,
	[state] [varchar](2) NULL,
	[zip] [varchar](5) NULL,
	[contract] [bit] NULL,
	[sourceSystem] [varchar](4) NULL,
	[LoadProcessID] [varchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount_Link]    Script Date: 6/26/2024 14:46:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount_Link](
	[Discount_HSK] [varbinary](800) NOT NULL,
	[stores_HSK] [binary](800) NULL,
	[LoadDateTime] [datetime] NULL,
	[SourceSystem] [varchar](4) NULL,
	[LoadProcessID] [varchar](4) NULL,
PRIMARY KEY CLUSTERED 
(
	[Discount_HSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount_Sat]    Script Date: 6/26/2024 14:46:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount_Sat](
	[Discount_HSK] [varbinary](800) NOT NULL,
	[StartDateTime] [datetime] NULL,
	[EndDateTime] [int] NULL,
	[discounttype] [varchar](40) NULL,
	[lowqty] [smallint] NULL,
	[highqty] [smallint] NULL,
	[discount] [numeric](4, 2) NULL,
	[LoadDateTime] [datetime] NULL,
	[SourceSystem] [varchar](4) NULL,
	[LoadProcessID] [varchar](4) NULL,
PRIMARY KEY CLUSTERED 
(
	[Discount_HSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee_Hub]    Script Date: 6/26/2024 14:46:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Hub](
	[Employee_HSK] [varbinary](800) NOT NULL,
	[Employee_BK] [varchar](9) NULL,
	[LoadDateTime] [datetime] NULL,
	[sourceSystem] [varchar](4) NULL,
	[LoadProcessID] [varchar](4) NULL,
PRIMARY KEY CLUSTERED 
(
	[Employee_HSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee_Sat]    Script Date: 6/26/2024 14:46:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Sat](
	[Employee_HSK] [varbinary](800) NOT NULL,
	[StartDateTime] [datetime] NOT NULL,
	[EndDateTime] [int] NULL,
	[LoadDateTime] [datetime] NULL,
	[fname] [varchar](20) NULL,
	[minit] [varchar](1) NULL,
	[lname] [varchar](30) NULL,
	[job_id] [smallint] NULL,
	[job_lvl] [tinyint] NULL,
	[pub_id] [varchar](4) NULL,
	[hire_date] [datetime] NULL,
	[sourceSystem] [varchar](4) NULL,
	[LoadProcessID] [varchar](4) NULL,
 CONSTRAINT [PK_Employee_Sat] PRIMARY KEY CLUSTERED 
(
	[Employee_HSK] ASC,
	[StartDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jobs_Hub]    Script Date: 6/26/2024 14:46:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jobs_Hub](
	[Job_HSK] [varbinary](800) NOT NULL,
	[Job_BK] [smallint] NULL,
	[LoadDateTime] [datetime] NULL,
	[sourceSystem] [varchar](4) NULL,
	[LoadProcessID] [varchar](4) NULL,
PRIMARY KEY CLUSTERED 
(
	[Job_HSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jobs_Sat]    Script Date: 6/26/2024 14:46:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jobs_Sat](
	[Job_HSK] [varbinary](800) NOT NULL,
	[StartDateTime] [datetime] NOT NULL,
	[EndDateTime] [int] NULL,
	[job_desc] [varchar](50) NULL,
	[min_lvl] [tinyint] NULL,
	[max_lvl] [tinyint] NULL,
	[LoadDateTime] [datetime] NULL,
	[sourceSystem] [varchar](4) NULL,
	[LoadProcessID] [varchar](4) NULL,
 CONSTRAINT [PK_Jobs_Sat] PRIMARY KEY CLUSTERED 
(
	[Job_HSK] ASC,
	[StartDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PubInfo_Link]    Script Date: 6/26/2024 14:46:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PubInfo_Link](
	[Pubinfo_HSK] [varbinary](800) NOT NULL,
	[publishers_HSK] [binary](800) NULL,
	[LoadDateTime] [datetime] NULL,
	[SourceSystem] [varchar](4) NULL,
	[LoadProcessID] [varchar](4) NULL,
PRIMARY KEY CLUSTERED 
(
	[Pubinfo_HSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PubInfo_Sat]    Script Date: 6/26/2024 14:46:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PubInfo_Sat](
	[Pubinfo_HSK] [varbinary](800) NOT NULL,
	[StartDateTime] [datetime] NULL,
	[EndDateTime] [int] NULL,
	[logo] [varbinary](max) NULL,
	[pr_info] [varchar](max) NULL,
	[LoadDateTime] [datetime] NULL,
	[SourceSystem] [varchar](4) NULL,
	[LoadProcessID] [varchar](4) NULL,
PRIMARY KEY CLUSTERED 
(
	[Pubinfo_HSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publishers_Hub]    Script Date: 6/26/2024 14:46:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publishers_Hub](
	[publishers_HSK] [varbinary](800) NOT NULL,
	[publishers_BK] [varchar](4) NULL,
	[LoadDateTime] [datetime] NULL,
	[sourceSystem] [varchar](4) NULL,
	[LoadProcessID] [varchar](4) NULL,
PRIMARY KEY CLUSTERED 
(
	[publishers_HSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publishers_Sat]    Script Date: 6/26/2024 14:46:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publishers_Sat](
	[publishers_HSK] [varbinary](800) NOT NULL,
	[StartDateTime] [datetime] NOT NULL,
	[EndDateTime] [int] NULL,
	[LoadDateTime] [datetime] NULL,
	[pub_name] [varchar](40) NULL,
	[city] [varchar](20) NULL,
	[state] [varchar](2) NULL,
	[country] [varchar](30) NULL,
	[sourceSystem] [varchar](4) NULL,
	[LoadProcessID] [varchar](4) NULL,
 CONSTRAINT [PK_Publishers_Sat] PRIMARY KEY CLUSTERED 
(
	[publishers_HSK] ASC,
	[StartDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale_Link]    Script Date: 6/26/2024 14:46:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale_Link](
	[Sale_HSK] [varbinary](800) NOT NULL,
	[stores_HSK] [binary](800) NULL,
	[titles_HSK] [varbinary](800) NULL,
	[loadDateTime] [datetime] NULL,
	[sourceSystem] [varchar](10) NULL,
	[LoadProcessID] [varchar](4) NULL,
 CONSTRAINT [PK__Sale_Lin__C1C2FD53511F2D76] PRIMARY KEY CLUSTERED 
(
	[Sale_HSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale_Sat]    Script Date: 6/26/2024 14:46:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale_Sat](
	[Sale_HSK] [varbinary](800) NOT NULL,
	[startDateTime] [datetime] NULL,
	[EndDateTime] [int] NULL,
	[ord_num] [varchar](20) NULL,
	[ord_date] [datetime] NULL,
	[qty] [smallint] NULL,
	[payterms] [varchar](12) NULL,
	[loadDateTime] [datetime] NULL,
	[sourceSystem] [varchar](10) NULL,
	[LoadProcessID] [varchar](4) NULL,
PRIMARY KEY CLUSTERED 
(
	[Sale_HSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stores_Hub]    Script Date: 6/26/2024 14:46:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stores_Hub](
	[stores_HSK] [varbinary](800) NOT NULL,
	[stors_BK] [varchar](4) NULL,
	[LoadDateTime] [datetime] NULL,
	[sourceSystem] [varchar](4) NULL,
	[LoadProcessID] [varchar](4) NULL,
PRIMARY KEY CLUSTERED 
(
	[stores_HSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stores_Sat]    Script Date: 6/26/2024 14:46:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stores_Sat](
	[stores_HSK] [varbinary](800) NOT NULL,
	[StartDateTime] [datetime] NOT NULL,
	[EndDateTime] [int] NULL,
	[stor_name] [varchar](40) NULL,
	[stor_address] [varchar](40) NULL,
	[city] [varchar](20) NULL,
	[state] [varchar](2) NULL,
	[zip] [varchar](5) NULL,
	[LoadDateTime] [datetime] NULL,
	[sourceSystem] [varchar](4) NULL,
	[LoadProcessID] [varchar](4) NULL,
 CONSTRAINT [PK_Stores_Sat] PRIMARY KEY CLUSTERED 
(
	[stores_HSK] ASC,
	[StartDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TitleAuthors_Link]    Script Date: 6/26/2024 14:46:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TitleAuthors_Link](
	[TitleAuthor_HSK] [varbinary](800) NOT NULL,
	[titles_HSK] [varbinary](800) NULL,
	[Author_HSK] [binary](800) NULL,
	[LoadDateTime] [datetime] NULL,
	[SourceSystem] [varchar](4) NULL,
	[LoadProcessID] [varchar](4) NULL,
 CONSTRAINT [PK__TitleAut__196DA29B8469434C] PRIMARY KEY CLUSTERED 
(
	[TitleAuthor_HSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TitleAuthors_Sat]    Script Date: 6/26/2024 14:46:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TitleAuthors_Sat](
	[TitleAuthor_HSK] [varbinary](800) NOT NULL,
	[StartDateTime] [datetime] NULL,
	[EndDateTime] [int] NULL,
	[au_ord] [tinyint] NULL,
	[royaltyper] [int] NULL,
	[LoadDateTime] [datetime] NULL,
	[SourceSystem] [varchar](4) NULL,
	[LoadProcessID] [varchar](4) NULL,
PRIMARY KEY CLUSTERED 
(
	[TitleAuthor_HSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Titles_Hub]    Script Date: 6/26/2024 14:46:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Titles_Hub](
	[titles_HSK] [varbinary](800) NOT NULL,
	[titles_BK] [varchar](6) NULL,
	[LoadDateTime] [datetime] NULL,
	[sourceSystem] [varchar](4) NULL,
	[LoadProcessID] [varchar](4) NULL,
PRIMARY KEY CLUSTERED 
(
	[titles_HSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Titles_Sat]    Script Date: 6/26/2024 14:46:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Titles_Sat](
	[titles_HSK] [varbinary](800) NOT NULL,
	[StartDateTime] [datetime] NOT NULL,
	[EndDateTime] [int] NULL,
	[title] [varchar](80) NULL,
	[type] [varchar](12) NULL,
	[pub_id] [varchar](4) NULL,
	[price] [money] NULL,
	[advance] [money] NULL,
	[royalty] [int] NULL,
	[ytd_sales] [int] NULL,
	[notes] [varchar](200) NULL,
	[pubdate] [datetime] NULL,
	[LoadDateTime] [datetime] NULL,
	[sourceSystem] [varchar](4) NULL,
	[LoadProcessID] [varchar](4) NULL,
 CONSTRAINT [PK_Titles_Sat] PRIMARY KEY CLUSTERED 
(
	[titles_HSK] ASC,
	[StartDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Author_Hub] ([Author_HSK], [Author_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x09E29B4584C902854A920BF2EF18FDB2, N'409-56-7008', CAST(N'2024-06-11T19:28:19.607' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Author_Hub] ([Author_HSK], [Author_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x0ADC2145D77C0E766611B00834231439, N'899-46-2035', CAST(N'2024-06-11T19:28:19.607' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Author_Hub] ([Author_HSK], [Author_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x0D99B5D1C0CCAC876E8A73E9A280B208, N'157-25-1652', CAST(N'2024-06-11T19:28:19.607' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Author_Hub] ([Author_HSK], [Author_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x0F651D26FEB2BA958384B3D55E2256C4, N'238-95-7766', CAST(N'2024-06-11T19:28:19.607' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Author_Hub] ([Author_HSK], [Author_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x0F93E1D8773301D99BB4F8B26BAB5AE3, N'274-80-9322', CAST(N'2024-06-11T19:28:19.607' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Author_Hub] ([Author_HSK], [Author_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x1510403E23A69CF50BF1C28E47DCD1E0, N'213-46-8915', CAST(N'2024-06-11T19:28:19.607' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Author_Hub] ([Author_HSK], [Author_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x26BCE8956F85C718FBF3F0B896AA9187, N'486-29-1786', CAST(N'2024-06-11T19:28:19.607' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Author_Hub] ([Author_HSK], [Author_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x36B9295607CDCB120EE40F39C6DF45A1, N'846-92-7186', CAST(N'2024-06-11T19:28:19.607' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Author_Hub] ([Author_HSK], [Author_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x3F7B25C3C2CDA4EFD412B87DE8E4242C, N'274-80-9391', CAST(N'2024-06-11T19:28:19.607' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Author_Hub] ([Author_HSK], [Author_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x4DDA8A5D35947B12B948EFF6EF14579A, N'172-32-1176', CAST(N'2024-06-11T19:28:19.607' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Author_Hub] ([Author_HSK], [Author_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x516418EC8F01C02E09CF6AEA5889009E, N'472-27-2349', CAST(N'2024-06-11T19:28:19.607' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Author_Hub] ([Author_HSK], [Author_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x577E2DB3101964E58D262908FD130170, N'341-22-1782', CAST(N'2024-06-11T19:28:19.607' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Author_Hub] ([Author_HSK], [Author_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x73706F147720ADA6C6504B637858E226, N'648-92-1872', CAST(N'2024-06-11T19:28:19.607' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Author_Hub] ([Author_HSK], [Author_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x851618951AC154307F7FCA30661E8852, N'756-30-7391', CAST(N'2024-06-11T19:28:19.607' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Author_Hub] ([Author_HSK], [Author_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x85C0253DE4F73450F18B3178F27BED67, N'998-72-3567', CAST(N'2024-06-11T19:28:19.607' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Author_Hub] ([Author_HSK], [Author_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x870B393E06226E453DB416C1711FBAC3, N'157-25-1635', CAST(N'2024-06-11T19:28:19.607' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Author_Hub] ([Author_HSK], [Author_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x94DE798E6797D0B7B0FC143D170ADB02, N'267-41-2394', CAST(N'2024-06-11T19:28:19.607' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Author_Hub] ([Author_HSK], [Author_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xA35BFDD11989C282161A6FCECBD391F4, N'722-51-5454', CAST(N'2024-06-11T19:28:19.607' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Author_Hub] ([Author_HSK], [Author_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xB5859011FD5136E98E5F7F90FC8B4FD8, N'893-72-1158', CAST(N'2024-06-11T19:28:19.607' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Author_Hub] ([Author_HSK], [Author_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xB6B4CE6DF035DCFAA26F3BC32FB89E6A, N'tu', CAST(N'2024-06-11T19:28:19.607' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Author_Hub] ([Author_HSK], [Author_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xC581BE69DCD9457AE9724C6540169233, N'712-45-1867', CAST(N'2024-06-11T19:28:19.607' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Author_Hub] ([Author_HSK], [Author_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xD9E364B71491ABEF30BC3B705FCE127C, N'427-17-2319', CAST(N'2024-06-11T19:28:19.607' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Author_Hub] ([Author_HSK], [Author_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xE276EB753BAC82A5F19D065E2CEF488B, N'672-71-3249', CAST(N'2024-06-11T19:28:19.607' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Author_Hub] ([Author_HSK], [Author_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xECF4803005BBAF6E00E9B966820E9F7C, N'724-80-9391', CAST(N'2024-06-11T19:28:19.607' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Author_Hub] ([Author_HSK], [Author_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xED3F8246430AAA86EED2FC9F29CF4CFC, N'807-91-6654', CAST(N'2024-06-11T19:28:19.607' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Author_Hub] ([Author_HSK], [Author_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xF43C40E26B78CBC24B671347157E0BA2, N'527-72-3246', CAST(N'2024-06-11T19:28:19.607' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Author_Hub] ([Author_HSK], [Author_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xFEA5D5245796E8D1DB05E667A65C13C4, N'724-08-9931', CAST(N'2024-06-11T19:28:19.607' AS DateTime), N'Pubs', N'1001')
GO
INSERT [dbo].[Authors_Sat] ([Author_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [au_lname], [au_fname], [phone], [address], [city], [state], [zip], [contract], [sourceSystem], [LoadProcessID]) VALUES (0x870B393E06226E453DB416C1711FBAC3, CAST(N'2024-06-11T23:18:43.203' AS DateTime), NULL, CAST(N'2024-06-11T23:18:43.203' AS DateTime), N'ana', N'ya', N'215 3251-202', N'xfvsdf', N'cdc', N'ca', N'94618', 1, N'Pubs', N'1002')
INSERT [dbo].[Authors_Sat] ([Author_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [au_lname], [au_fname], [phone], [address], [city], [state], [zip], [contract], [sourceSystem], [LoadProcessID]) VALUES (0x0D99B5D1C0CCAC876E8A73E9A280B208, CAST(N'2024-06-11T23:18:43.203' AS DateTime), NULL, CAST(N'2024-06-11T23:18:43.203' AS DateTime), N'uk', N'yuk', N'215 3251-202', N'dfv', N'df', N'IN', N'12547', 1, N'Pubs', N'1002')
INSERT [dbo].[Authors_Sat] ([Author_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [au_lname], [au_fname], [phone], [address], [city], [state], [zip], [contract], [sourceSystem], [LoadProcessID]) VALUES (0x4DDA8A5D35947B12B948EFF6EF14579A, CAST(N'2024-06-11T23:18:43.203' AS DateTime), NULL, CAST(N'2024-06-11T23:18:43.203' AS DateTime), N'White', N'Johnson', N'408 496-7223', N'10932 Bigge Rd.', N'Menlo Park', N'CA', N'94025', 1, N'Pubs', N'1002')
INSERT [dbo].[Authors_Sat] ([Author_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [au_lname], [au_fname], [phone], [address], [city], [state], [zip], [contract], [sourceSystem], [LoadProcessID]) VALUES (0x1510403E23A69CF50BF1C28E47DCD1E0, CAST(N'2024-06-11T23:18:43.203' AS DateTime), NULL, CAST(N'2024-06-11T23:18:43.203' AS DateTime), N'Green', N'Marjorie', N'415 986-7020', N'309 63rd St. #411', N'Oakland', N'CA', N'94618', 1, N'Pubs', N'1002')
INSERT [dbo].[Authors_Sat] ([Author_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [au_lname], [au_fname], [phone], [address], [city], [state], [zip], [contract], [sourceSystem], [LoadProcessID]) VALUES (0x0F651D26FEB2BA958384B3D55E2256C4, CAST(N'2024-06-11T23:18:43.203' AS DateTime), NULL, CAST(N'2024-06-11T23:18:43.203' AS DateTime), N'Carson', N'Cheryl', N'415 548-7723', N'589 Darwin Ln.', N'Berkeley', N'CA', N'94705', 1, N'Pubs', N'1002')
INSERT [dbo].[Authors_Sat] ([Author_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [au_lname], [au_fname], [phone], [address], [city], [state], [zip], [contract], [sourceSystem], [LoadProcessID]) VALUES (0x94DE798E6797D0B7B0FC143D170ADB02, CAST(N'2024-06-11T23:18:43.203' AS DateTime), NULL, CAST(N'2024-06-11T23:18:43.203' AS DateTime), N'O''Leary', N'Michael', N'408 286-2428', N'22 Cleveland Av. #14', N'San Jose', N'CA', N'95128', 1, N'Pubs', N'1002')
INSERT [dbo].[Authors_Sat] ([Author_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [au_lname], [au_fname], [phone], [address], [city], [state], [zip], [contract], [sourceSystem], [LoadProcessID]) VALUES (0x0F93E1D8773301D99BB4F8B26BAB5AE3, CAST(N'2024-06-11T23:18:43.203' AS DateTime), NULL, CAST(N'2024-06-11T23:18:43.203' AS DateTime), N'ff', N'fg', N'241 524-4242', N'dfdf', N'fdf', N'CA', N'24524', 1, N'Pubs', N'1002')
INSERT [dbo].[Authors_Sat] ([Author_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [au_lname], [au_fname], [phone], [address], [city], [state], [zip], [contract], [sourceSystem], [LoadProcessID]) VALUES (0x3F7B25C3C2CDA4EFD412B87DE8E4242C, CAST(N'2024-06-11T23:18:43.203' AS DateTime), NULL, CAST(N'2024-06-11T23:18:43.203' AS DateTime), N'Straight', N'Dean', N'415 834-2919', N'5420 College Av.', N'Oakland', N'CA', N'94609', 1, N'Pubs', N'1002')
INSERT [dbo].[Authors_Sat] ([Author_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [au_lname], [au_fname], [phone], [address], [city], [state], [zip], [contract], [sourceSystem], [LoadProcessID]) VALUES (0x577E2DB3101964E58D262908FD130170, CAST(N'2024-06-11T23:18:43.203' AS DateTime), NULL, CAST(N'2024-06-11T23:18:43.203' AS DateTime), N'Smith', N'Meander', N'913 843-0462', N'10 Mississippi Dr.', N'Lawrence', N'KS', N'66044', 0, N'Pubs', N'1002')
INSERT [dbo].[Authors_Sat] ([Author_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [au_lname], [au_fname], [phone], [address], [city], [state], [zip], [contract], [sourceSystem], [LoadProcessID]) VALUES (0x09E29B4584C902854A920BF2EF18FDB2, CAST(N'2024-06-11T23:18:43.203' AS DateTime), NULL, CAST(N'2024-06-11T23:18:43.203' AS DateTime), N'Bennet', N'Abraham', N'415 658-9932', N'6223 Bateman St.', N'Berkeley', N'CA', N'94705', 1, N'Pubs', N'1002')
INSERT [dbo].[Authors_Sat] ([Author_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [au_lname], [au_fname], [phone], [address], [city], [state], [zip], [contract], [sourceSystem], [LoadProcessID]) VALUES (0xD9E364B71491ABEF30BC3B705FCE127C, CAST(N'2024-06-11T23:18:43.203' AS DateTime), NULL, CAST(N'2024-06-11T23:18:43.203' AS DateTime), N'Dull', N'Ann', N'415 836-7128', N'3410 Blonde St.', N'Palo Alto', N'CA', N'94301', 1, N'Pubs', N'1002')
INSERT [dbo].[Authors_Sat] ([Author_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [au_lname], [au_fname], [phone], [address], [city], [state], [zip], [contract], [sourceSystem], [LoadProcessID]) VALUES (0x516418EC8F01C02E09CF6AEA5889009E, CAST(N'2024-06-11T23:18:43.203' AS DateTime), NULL, CAST(N'2024-06-11T23:18:43.203' AS DateTime), N'Gringlesby', N'Burt', N'707 938-6445', N'PO Box 792', N'Covelo', N'CA', N'95428', 1, N'Pubs', N'1002')
INSERT [dbo].[Authors_Sat] ([Author_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [au_lname], [au_fname], [phone], [address], [city], [state], [zip], [contract], [sourceSystem], [LoadProcessID]) VALUES (0x26BCE8956F85C718FBF3F0B896AA9187, CAST(N'2024-06-11T23:18:43.203' AS DateTime), NULL, CAST(N'2024-06-11T23:18:43.203' AS DateTime), N'Locksley', N'Charlene', N'415 585-4620', N'18 Broadway Av.', N'San Francisco', N'CA', N'94130', 1, N'Pubs', N'1002')
INSERT [dbo].[Authors_Sat] ([Author_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [au_lname], [au_fname], [phone], [address], [city], [state], [zip], [contract], [sourceSystem], [LoadProcessID]) VALUES (0xF43C40E26B78CBC24B671347157E0BA2, CAST(N'2024-06-11T23:18:43.203' AS DateTime), NULL, CAST(N'2024-06-11T23:18:43.203' AS DateTime), N'Greene', N'Morningstar', N'615 297-2723', N'22 Graybar House Rd.', N'Nashville', N'TN', N'37215', 0, N'Pubs', N'1002')
INSERT [dbo].[Authors_Sat] ([Author_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [au_lname], [au_fname], [phone], [address], [city], [state], [zip], [contract], [sourceSystem], [LoadProcessID]) VALUES (0x73706F147720ADA6C6504B637858E226, CAST(N'2024-06-11T23:18:43.203' AS DateTime), NULL, CAST(N'2024-06-11T23:18:43.203' AS DateTime), N'Blotchet-Halls', N'Reginald', N'503 745-6402', N'55 Hillsdale Bl.', N'Corvallis', N'OR', N'97330', 1, N'Pubs', N'1002')
INSERT [dbo].[Authors_Sat] ([Author_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [au_lname], [au_fname], [phone], [address], [city], [state], [zip], [contract], [sourceSystem], [LoadProcessID]) VALUES (0xE276EB753BAC82A5F19D065E2CEF488B, CAST(N'2024-06-11T23:18:43.203' AS DateTime), NULL, CAST(N'2024-06-11T23:18:43.203' AS DateTime), N'Yokomoto', N'Akiko', N'415 935-4228', N'3 Silver Ct.', N'Walnut Creek', N'CA', N'94595', 1, N'Pubs', N'1002')
INSERT [dbo].[Authors_Sat] ([Author_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [au_lname], [au_fname], [phone], [address], [city], [state], [zip], [contract], [sourceSystem], [LoadProcessID]) VALUES (0xC581BE69DCD9457AE9724C6540169233, CAST(N'2024-06-11T23:18:43.203' AS DateTime), NULL, CAST(N'2024-06-11T23:18:43.203' AS DateTime), N'del Castillo', N'Innes', N'615 996-8275', N'2286 Cram Pl. #86', N'Ann Arbor', N'MI', N'48105', 1, N'Pubs', N'1002')
INSERT [dbo].[Authors_Sat] ([Author_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [au_lname], [au_fname], [phone], [address], [city], [state], [zip], [contract], [sourceSystem], [LoadProcessID]) VALUES (0xA35BFDD11989C282161A6FCECBD391F4, CAST(N'2024-06-11T23:18:43.203' AS DateTime), NULL, CAST(N'2024-06-11T23:18:43.203' AS DateTime), N'DeFrance', N'Michel', N'219 547-9982', N'3 Balding Pl.', N'Gary', N'IN', N'46403', 1, N'Pubs', N'1002')
INSERT [dbo].[Authors_Sat] ([Author_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [au_lname], [au_fname], [phone], [address], [city], [state], [zip], [contract], [sourceSystem], [LoadProcessID]) VALUES (0xFEA5D5245796E8D1DB05E667A65C13C4, CAST(N'2024-06-11T23:18:43.203' AS DateTime), NULL, CAST(N'2024-06-11T23:18:43.203' AS DateTime), N'Stringer', N'Dirk', N'415 843-2991', N'5420 Telegraph Av.', N'Oakland', N'CA', N'94609', 0, N'Pubs', N'1002')
INSERT [dbo].[Authors_Sat] ([Author_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [au_lname], [au_fname], [phone], [address], [city], [state], [zip], [contract], [sourceSystem], [LoadProcessID]) VALUES (0xECF4803005BBAF6E00E9B966820E9F7C, CAST(N'2024-06-11T23:18:43.203' AS DateTime), NULL, CAST(N'2024-06-11T23:18:43.203' AS DateTime), N'MacFeather', N'Stearns', N'415 354-7128', N'44 Upland Hts.', N'Oakland', N'CA', N'94612', 1, N'Pubs', N'1002')
INSERT [dbo].[Authors_Sat] ([Author_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [au_lname], [au_fname], [phone], [address], [city], [state], [zip], [contract], [sourceSystem], [LoadProcessID]) VALUES (0x851618951AC154307F7FCA30661E8852, CAST(N'2024-06-11T23:18:43.203' AS DateTime), NULL, CAST(N'2024-06-11T23:18:43.203' AS DateTime), N'Karsen', N'Livia', N'415 534-9219', N'5720 McAuley St.', N'Oakland', N'CA', N'94609', 1, N'Pubs', N'1002')
INSERT [dbo].[Authors_Sat] ([Author_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [au_lname], [au_fname], [phone], [address], [city], [state], [zip], [contract], [sourceSystem], [LoadProcessID]) VALUES (0xED3F8246430AAA86EED2FC9F29CF4CFC, CAST(N'2024-06-11T23:18:43.203' AS DateTime), NULL, CAST(N'2024-06-11T23:18:43.203' AS DateTime), N'Panteley', N'Sylvia', N'301 946-8853', N'1956 Arlington Pl.', N'Rockville', N'MD', N'20853', 1, N'Pubs', N'1002')
INSERT [dbo].[Authors_Sat] ([Author_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [au_lname], [au_fname], [phone], [address], [city], [state], [zip], [contract], [sourceSystem], [LoadProcessID]) VALUES (0x36B9295607CDCB120EE40F39C6DF45A1, CAST(N'2024-06-11T23:18:43.203' AS DateTime), NULL, CAST(N'2024-06-11T23:18:43.203' AS DateTime), N'Hunter', N'Sheryl', N'415 836-7128', N'3410 Blonde St.', N'Palo Alto', N'CA', N'94301', 1, N'Pubs', N'1002')
INSERT [dbo].[Authors_Sat] ([Author_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [au_lname], [au_fname], [phone], [address], [city], [state], [zip], [contract], [sourceSystem], [LoadProcessID]) VALUES (0xB5859011FD5136E98E5F7F90FC8B4FD8, CAST(N'2024-06-11T23:18:43.203' AS DateTime), NULL, CAST(N'2024-06-11T23:18:43.203' AS DateTime), N'McBadden', N'Heather', N'707 448-4982', N'301 Putnam', N'Vacaville', N'CA', N'95688', 0, N'Pubs', N'1002')
INSERT [dbo].[Authors_Sat] ([Author_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [au_lname], [au_fname], [phone], [address], [city], [state], [zip], [contract], [sourceSystem], [LoadProcessID]) VALUES (0x0ADC2145D77C0E766611B00834231439, CAST(N'2024-06-11T23:18:43.203' AS DateTime), NULL, CAST(N'2024-06-11T23:18:43.203' AS DateTime), N'Ringer', N'Anne', N'801 826-0752', N'67 Seventh Av.', N'Salt Lake City', N'UT', N'84152', 1, N'Pubs', N'1002')
INSERT [dbo].[Authors_Sat] ([Author_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [au_lname], [au_fname], [phone], [address], [city], [state], [zip], [contract], [sourceSystem], [LoadProcessID]) VALUES (0x85C0253DE4F73450F18B3178F27BED67, CAST(N'2024-06-11T23:18:43.203' AS DateTime), NULL, CAST(N'2024-06-11T23:18:43.203' AS DateTime), N'Ringer', N'Albert', N'801 826-0752', N'67 Seventh Av.', N'Salt Lake City', N'UT', N'84152', 1, N'Pubs', N'1002')
INSERT [dbo].[Authors_Sat] ([Author_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [au_lname], [au_fname], [phone], [address], [city], [state], [zip], [contract], [sourceSystem], [LoadProcessID]) VALUES (0xB6B4CE6DF035DCFAA26F3BC32FB89E6A, CAST(N'2024-06-11T23:18:43.203' AS DateTime), NULL, CAST(N'2024-06-11T23:18:43.203' AS DateTime), N'tyj', N'ty', N'452         ', N'ik', N'jik', N'IN', N'1    ', 1, N'Pubs', N'1002')
GO
INSERT [dbo].[Discount_Link] ([Discount_HSK], [stores_HSK], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0xECCBC87E4B5CE2FE28308FD9F2A7BAF3, 0x6EBB69FFBEBE9FD95D160FFC29E0FE5D00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-17T00:50:19.287' AS DateTime), N'Pubs', N'1002')
GO
INSERT [dbo].[Discount_Sat] ([Discount_HSK], [StartDateTime], [EndDateTime], [discounttype], [lowqty], [highqty], [discount], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0xC4CA4238A0B923820DCC509A6F75849B, CAST(N'2024-06-17T00:42:20.470' AS DateTime), NULL, N'Initial Customer', NULL, NULL, CAST(10.50 AS Numeric(4, 2)), CAST(N'2024-06-17T00:42:20.470' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Discount_Sat] ([Discount_HSK], [StartDateTime], [EndDateTime], [discounttype], [lowqty], [highqty], [discount], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0xC81E728D9D4C2F636F067F89CC14862C, CAST(N'2024-06-17T00:42:20.470' AS DateTime), NULL, N'Volume Discount', 100, 1000, CAST(6.70 AS Numeric(4, 2)), CAST(N'2024-06-17T00:42:20.470' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Discount_Sat] ([Discount_HSK], [StartDateTime], [EndDateTime], [discounttype], [lowqty], [highqty], [discount], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0xECCBC87E4B5CE2FE28308FD9F2A7BAF3, CAST(N'2024-06-17T00:42:20.470' AS DateTime), NULL, N'Customer Discount', NULL, NULL, CAST(5.00 AS Numeric(4, 2)), CAST(N'2024-06-17T00:42:20.470' AS DateTime), N'Pubs', N'1002')
GO
INSERT [dbo].[Employee_Hub] ([Employee_HSK], [Employee_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x02654093C15ED6C2830B73E1703C2071, N'PMA42628M', CAST(N'2024-06-11T20:20:26.900' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Employee_Hub] ([Employee_HSK], [Employee_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x03BA0A8145DAC8BA1AC6B48DC0DE11BF, N'VPA30890F', CAST(N'2024-06-11T20:20:26.900' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Employee_Hub] ([Employee_HSK], [Employee_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x0A3A1AFD4763A69A7336B0BF53576DF9, N'AMD15433F', CAST(N'2024-06-11T20:20:26.900' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Employee_Hub] ([Employee_HSK], [Employee_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x0C9A097EEE6FAD7794BF0BCCB88D3F52, N'MMS49649F', CAST(N'2024-06-11T20:20:26.900' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Employee_Hub] ([Employee_HSK], [Employee_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x11C80AB6B55A22DE0F1A3C5B5CA70014, N'KFJ64308F', CAST(N'2024-06-11T20:20:26.900' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Employee_Hub] ([Employee_HSK], [Employee_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x14464BF073A782116FE06D0F2511872B, N'A-R89858F', CAST(N'2024-06-11T20:20:26.900' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Employee_Hub] ([Employee_HSK], [Employee_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x159E6ED3778F3477988ACD881798719D, N'DBT39435M', CAST(N'2024-06-11T20:20:26.900' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Employee_Hub] ([Employee_HSK], [Employee_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x1992FF38A5DAA7673B5C6548E706FABE, N'TPO55093M', CAST(N'2024-06-11T20:20:26.900' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Employee_Hub] ([Employee_HSK], [Employee_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x1B821DDF17487F590D58CCAAD953FA2B, N'PXH22250M', CAST(N'2024-06-11T20:20:26.900' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Employee_Hub] ([Employee_HSK], [Employee_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x27BFD214AE56A5831756609EF8B31255, N'KJJ92907F', CAST(N'2024-06-11T20:20:26.900' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Employee_Hub] ([Employee_HSK], [Employee_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x27E36389C4C84066EF46FDAF4E1CC3CC, N'POK93028M', CAST(N'2024-06-11T20:20:26.900' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Employee_Hub] ([Employee_HSK], [Employee_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x3AAF47BC79825388A5916881846322D2, N'Y-L77953M', CAST(N'2024-06-11T20:20:26.900' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Employee_Hub] ([Employee_HSK], [Employee_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x58C96CF5958CB2C32C419B082BAA9A13, N'M-L67958F', CAST(N'2024-06-11T20:20:26.900' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Employee_Hub] ([Employee_HSK], [Employee_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x594F883F5EA5A1508875B0EC10855CE8, N'L-B31947F', CAST(N'2024-06-11T20:20:26.900' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Employee_Hub] ([Employee_HSK], [Employee_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x5B18E3735398EB88D899359C9D99E6A7, N'SKO22412M', CAST(N'2024-06-11T20:20:26.900' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Employee_Hub] ([Employee_HSK], [Employee_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x61738A89C5AD89C409F6D99F7EBF0DF0, N'GHT50241M', CAST(N'2024-06-11T20:20:26.900' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Employee_Hub] ([Employee_HSK], [Employee_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x64FC2531290C0CD2E68AB2F690CE03A2, N'PTC11962M', CAST(N'2024-06-11T20:20:26.900' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Employee_Hub] ([Employee_HSK], [Employee_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x6726CD50F9A5848348695C1F906B2BC3, N'LAL21447M', CAST(N'2024-06-11T20:20:26.900' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Employee_Hub] ([Employee_HSK], [Employee_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x68CC72AA896B46B9A4CF592895D05A34, N'HAN90777M', CAST(N'2024-06-11T20:20:26.900' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Employee_Hub] ([Employee_HSK], [Employee_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x6C74F8A34FFB0B8AD5C3D67044864434, N'CGS88322F', CAST(N'2024-06-11T20:20:26.900' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Employee_Hub] ([Employee_HSK], [Employee_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x7793E50AF8AFC2FF2449F58FD6243DE1, N'DWR65030M', CAST(N'2024-06-11T20:20:26.900' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Employee_Hub] ([Employee_HSK], [Employee_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x7C55EB59319F777285B83FA5AB08D70B, N'R-M53550M', CAST(N'2024-06-11T20:20:26.900' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Employee_Hub] ([Employee_HSK], [Employee_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x86D7CEA1E79BB131C41218622142B77A, N'ENL44273F', CAST(N'2024-06-11T20:20:26.900' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Employee_Hub] ([Employee_HSK], [Employee_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x88067EB493372E1925D4C474213B1938, N'MFS52347M', CAST(N'2024-06-11T20:20:26.900' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Employee_Hub] ([Employee_HSK], [Employee_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x8E9AA2D3AF8D69C96350BA7CAE532B03, N'JYL26161F', CAST(N'2024-06-11T20:20:26.900' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Employee_Hub] ([Employee_HSK], [Employee_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x98C87153C2B35880B779C0C85887CE5F, N'HAS54740M', CAST(N'2024-06-11T20:20:26.900' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Employee_Hub] ([Employee_HSK], [Employee_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x98EA798E2AAB9F69CE1345A6B1AA08F4, N'M-P91209M', CAST(N'2024-06-11T20:20:26.900' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Employee_Hub] ([Employee_HSK], [Employee_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x9B461C7E57FD687A8D6CB24A0905D543, N'MGK44605M', CAST(N'2024-06-11T20:20:26.900' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Employee_Hub] ([Employee_HSK], [Employee_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xA8A762CCAEE63F1B178B710B923C54B6, N'PHF38899M', CAST(N'2024-06-11T20:20:26.900' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Employee_Hub] ([Employee_HSK], [Employee_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xB532ABFDB4AF42AB37A503BC24494697, N'ARD36773F', CAST(N'2024-06-11T20:20:26.900' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Employee_Hub] ([Employee_HSK], [Employee_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xB5DC4348C1AFEFC85CC294F607FEE99E, N'PMA42654M', CAST(N'2024-06-11T20:20:26.900' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Employee_Hub] ([Employee_HSK], [Employee_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xB8177984735156B2168AF2C8510521F7, N'MAP77183M', CAST(N'2024-06-11T20:20:26.900' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Employee_Hub] ([Employee_HSK], [Employee_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xB9FDB01D315AB6B0D99E6C3F6A8CE936, N'MAS70474F', CAST(N'2024-06-11T20:20:26.900' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Employee_Hub] ([Employee_HSK], [Employee_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xBEF47A4565DE630EF6DE753F87FAA4FF, N'F-C16315M', CAST(N'2024-06-11T20:20:26.900' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Employee_Hub] ([Employee_HSK], [Employee_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xD284F3246B1C755E7730C45600EE0EB5, N'PSP68661F', CAST(N'2024-06-11T20:20:26.900' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Employee_Hub] ([Employee_HSK], [Employee_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xD726697E90761A25184B9D3810240F77, N'PDI47470M', CAST(N'2024-06-11T20:20:26.900' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Employee_Hub] ([Employee_HSK], [Employee_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xD982A8AF299DB0A144597CDCF00489E1, N'PMA42758M', CAST(N'2024-06-11T20:20:26.900' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Employee_Hub] ([Employee_HSK], [Employee_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xDA42B8A6687C17EFCC38E0B132DBB24D, N'H-B39728F', CAST(N'2024-06-11T20:20:26.900' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Employee_Hub] ([Employee_HSK], [Employee_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xDD2F384F0BD342D29520E3D729E5274B, N'A-C71970F', CAST(N'2024-06-11T20:20:26.900' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Employee_Hub] ([Employee_HSK], [Employee_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xDDFA04D557C14F164A68022F328766F5, N'RBM23061F', CAST(N'2024-06-11T20:20:26.900' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Employee_Hub] ([Employee_HSK], [Employee_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xE0F96CBE9A451B455C833BCB3193F357, N'PCM98509F', CAST(N'2024-06-11T20:20:26.900' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Employee_Hub] ([Employee_HSK], [Employee_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xE2061C5276086326C4B4816763F95461, N'fg       ', CAST(N'2024-06-11T20:20:26.900' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Employee_Hub] ([Employee_HSK], [Employee_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xE6928824B6200DADCF29DC96233B89D8, N'MJP25939M', CAST(N'2024-06-11T20:20:26.900' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Employee_Hub] ([Employee_HSK], [Employee_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xEDB523332FE9FA9D5D19159A703EC24F, N'CFH28514M', CAST(N'2024-06-11T20:20:26.900' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Employee_Hub] ([Employee_HSK], [Employee_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xF31B9AF698A32B4C507EDE33F505D8BA, N'M-R38834F', CAST(N'2024-06-11T20:20:26.900' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Employee_Hub] ([Employee_HSK], [Employee_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xF72C1ABB24879583103FB18FBAE130A9, N'PSA89086M', CAST(N'2024-06-11T20:20:26.900' AS DateTime), N'Pubs', N'1001')
GO
INSERT [dbo].[Employee_Sat] ([Employee_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [fname], [minit], [lname], [job_id], [job_lvl], [pub_id], [hire_date], [sourceSystem], [LoadProcessID]) VALUES (0x02654093C15ED6C2830B73E1703C2071, CAST(N'2024-06-11T23:28:00.520' AS DateTime), NULL, CAST(N'2024-06-11T23:28:00.520' AS DateTime), N'Paolo', N'M', N'Accorti', 13, 35, N'0877', CAST(N'1992-08-27T00:00:00.000' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Employee_Sat] ([Employee_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [fname], [minit], [lname], [job_id], [job_lvl], [pub_id], [hire_date], [sourceSystem], [LoadProcessID]) VALUES (0x03BA0A8145DAC8BA1AC6B48DC0DE11BF, CAST(N'2024-06-11T23:28:00.520' AS DateTime), NULL, CAST(N'2024-06-11T23:28:00.520' AS DateTime), N'Victoria', N'P', N'Ashworth', 6, 140, N'0877', CAST(N'1990-09-13T00:00:00.000' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Employee_Sat] ([Employee_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [fname], [minit], [lname], [job_id], [job_lvl], [pub_id], [hire_date], [sourceSystem], [LoadProcessID]) VALUES (0x0A3A1AFD4763A69A7336B0BF53576DF9, CAST(N'2024-06-11T23:28:00.520' AS DateTime), NULL, CAST(N'2024-06-11T23:28:00.520' AS DateTime), N'Ann', N'M', N'Devon', 3, 200, N'9952', CAST(N'1991-07-16T00:00:00.000' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Employee_Sat] ([Employee_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [fname], [minit], [lname], [job_id], [job_lvl], [pub_id], [hire_date], [sourceSystem], [LoadProcessID]) VALUES (0x0C9A097EEE6FAD7794BF0BCCB88D3F52, CAST(N'2024-06-11T23:28:00.520' AS DateTime), NULL, CAST(N'2024-06-11T23:28:00.520' AS DateTime), N'Mary', N'M', N'Saveley', 8, 175, N'0736', CAST(N'1993-06-29T00:00:00.000' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Employee_Sat] ([Employee_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [fname], [minit], [lname], [job_id], [job_lvl], [pub_id], [hire_date], [sourceSystem], [LoadProcessID]) VALUES (0x11C80AB6B55A22DE0F1A3C5B5CA70014, CAST(N'2024-06-11T23:28:00.520' AS DateTime), NULL, CAST(N'2024-06-11T23:28:00.520' AS DateTime), N'Karin', N'F', N'Josephs', 14, 100, N'0736', CAST(N'1992-10-17T00:00:00.000' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Employee_Sat] ([Employee_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [fname], [minit], [lname], [job_id], [job_lvl], [pub_id], [hire_date], [sourceSystem], [LoadProcessID]) VALUES (0x14464BF073A782116FE06D0F2511872B, CAST(N'2024-06-11T23:28:00.520' AS DateTime), NULL, CAST(N'2024-06-11T23:28:00.520' AS DateTime), N'Annette', N' ', N'Roulet', 6, 152, N'9999', CAST(N'1990-02-21T00:00:00.000' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Employee_Sat] ([Employee_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [fname], [minit], [lname], [job_id], [job_lvl], [pub_id], [hire_date], [sourceSystem], [LoadProcessID]) VALUES (0x159E6ED3778F3477988ACD881798719D, CAST(N'2024-06-11T23:28:00.520' AS DateTime), NULL, CAST(N'2024-06-11T23:28:00.520' AS DateTime), N'Daniel', N'B', N'Tonini', 11, 75, N'0877', CAST(N'1990-01-01T00:00:00.000' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Employee_Sat] ([Employee_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [fname], [minit], [lname], [job_id], [job_lvl], [pub_id], [hire_date], [sourceSystem], [LoadProcessID]) VALUES (0x1992FF38A5DAA7673B5C6548E706FABE, CAST(N'2024-06-11T23:28:00.520' AS DateTime), NULL, CAST(N'2024-06-11T23:28:00.520' AS DateTime), N'Timothy', N'P', N'O''Rourke', 13, 100, N'0736', CAST(N'1988-06-19T00:00:00.000' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Employee_Sat] ([Employee_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [fname], [minit], [lname], [job_id], [job_lvl], [pub_id], [hire_date], [sourceSystem], [LoadProcessID]) VALUES (0x1B821DDF17487F590D58CCAAD953FA2B, CAST(N'2024-06-11T23:28:00.520' AS DateTime), NULL, CAST(N'2024-06-11T23:28:00.520' AS DateTime), N'Paul', N'X', N'Henriot', 5, 159, N'0877', CAST(N'1993-08-19T00:00:00.000' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Employee_Sat] ([Employee_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [fname], [minit], [lname], [job_id], [job_lvl], [pub_id], [hire_date], [sourceSystem], [LoadProcessID]) VALUES (0x27BFD214AE56A5831756609EF8B31255, CAST(N'2024-06-11T23:28:00.520' AS DateTime), NULL, CAST(N'2024-06-11T23:28:00.520' AS DateTime), N'Karla', N'J', N'Jablonski', 9, 170, N'9999', CAST(N'1994-03-11T00:00:00.000' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Employee_Sat] ([Employee_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [fname], [minit], [lname], [job_id], [job_lvl], [pub_id], [hire_date], [sourceSystem], [LoadProcessID]) VALUES (0x27E36389C4C84066EF46FDAF4E1CC3CC, CAST(N'2024-06-11T23:28:00.520' AS DateTime), NULL, CAST(N'2024-06-11T23:28:00.520' AS DateTime), N'Pirkko', N'O', N'Koskitalo', 10, 80, N'9999', CAST(N'1993-11-29T00:00:00.000' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Employee_Sat] ([Employee_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [fname], [minit], [lname], [job_id], [job_lvl], [pub_id], [hire_date], [sourceSystem], [LoadProcessID]) VALUES (0x3AAF47BC79825388A5916881846322D2, CAST(N'2024-06-11T23:28:00.520' AS DateTime), NULL, CAST(N'2024-06-11T23:28:00.520' AS DateTime), N'Yoshi', N' ', N'Latimer', 12, 32, N'1389', CAST(N'1989-06-11T00:00:00.000' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Employee_Sat] ([Employee_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [fname], [minit], [lname], [job_id], [job_lvl], [pub_id], [hire_date], [sourceSystem], [LoadProcessID]) VALUES (0x58C96CF5958CB2C32C419B082BAA9A13, CAST(N'2024-06-11T23:28:00.520' AS DateTime), NULL, CAST(N'2024-06-11T23:28:00.520' AS DateTime), N'Maria', N' ', N'Larsson', 7, 135, N'1389', CAST(N'1992-03-27T00:00:00.000' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Employee_Sat] ([Employee_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [fname], [minit], [lname], [job_id], [job_lvl], [pub_id], [hire_date], [sourceSystem], [LoadProcessID]) VALUES (0x594F883F5EA5A1508875B0EC10855CE8, CAST(N'2024-06-11T23:28:00.520' AS DateTime), NULL, CAST(N'2024-06-11T23:28:00.520' AS DateTime), N'Lesley', N' ', N'Brown', 7, 120, N'0877', CAST(N'1991-02-13T00:00:00.000' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Employee_Sat] ([Employee_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [fname], [minit], [lname], [job_id], [job_lvl], [pub_id], [hire_date], [sourceSystem], [LoadProcessID]) VALUES (0x5B18E3735398EB88D899359C9D99E6A7, CAST(N'2024-06-11T23:28:00.520' AS DateTime), NULL, CAST(N'2024-06-11T23:28:00.520' AS DateTime), N'Sven', N'K', N'Ottlieb', 5, 150, N'1389', CAST(N'1991-04-05T00:00:00.000' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Employee_Sat] ([Employee_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [fname], [minit], [lname], [job_id], [job_lvl], [pub_id], [hire_date], [sourceSystem], [LoadProcessID]) VALUES (0x61738A89C5AD89C409F6D99F7EBF0DF0, CAST(N'2024-06-11T23:28:00.520' AS DateTime), NULL, CAST(N'2024-06-11T23:28:00.520' AS DateTime), N'Gary', N'H', N'Thomas', 9, 170, N'0736', CAST(N'1988-08-09T00:00:00.000' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Employee_Sat] ([Employee_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [fname], [minit], [lname], [job_id], [job_lvl], [pub_id], [hire_date], [sourceSystem], [LoadProcessID]) VALUES (0x64FC2531290C0CD2E68AB2F690CE03A2, CAST(N'2024-06-11T23:28:00.520' AS DateTime), NULL, CAST(N'2024-06-11T23:28:00.520' AS DateTime), N'Philip', N'T', N'Cramer', 2, 215, N'9952', CAST(N'1989-11-11T00:00:00.000' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Employee_Sat] ([Employee_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [fname], [minit], [lname], [job_id], [job_lvl], [pub_id], [hire_date], [sourceSystem], [LoadProcessID]) VALUES (0x6726CD50F9A5848348695C1F906B2BC3, CAST(N'2024-06-11T23:28:00.520' AS DateTime), NULL, CAST(N'2024-06-11T23:28:00.520' AS DateTime), N'Laurence', N'A', N'Lebihan', 5, 175, N'0736', CAST(N'1990-06-03T00:00:00.000' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Employee_Sat] ([Employee_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [fname], [minit], [lname], [job_id], [job_lvl], [pub_id], [hire_date], [sourceSystem], [LoadProcessID]) VALUES (0x68CC72AA896B46B9A4CF592895D05A34, CAST(N'2024-06-11T23:28:00.520' AS DateTime), NULL, CAST(N'2024-06-11T23:28:00.520' AS DateTime), N'Helvetius', N'A', N'Nagy', 7, 120, N'9999', CAST(N'1993-03-19T00:00:00.000' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Employee_Sat] ([Employee_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [fname], [minit], [lname], [job_id], [job_lvl], [pub_id], [hire_date], [sourceSystem], [LoadProcessID]) VALUES (0x6C74F8A34FFB0B8AD5C3D67044864434, CAST(N'2024-06-11T23:28:00.520' AS DateTime), NULL, CAST(N'2024-06-11T23:28:00.520' AS DateTime), N'Carine', N'G', N'Schmitt', 13, 64, N'1389', CAST(N'1992-07-07T00:00:00.000' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Employee_Sat] ([Employee_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [fname], [minit], [lname], [job_id], [job_lvl], [pub_id], [hire_date], [sourceSystem], [LoadProcessID]) VALUES (0x7793E50AF8AFC2FF2449F58FD6243DE1, CAST(N'2024-06-11T23:28:00.520' AS DateTime), NULL, CAST(N'2024-06-11T23:28:00.520' AS DateTime), N'Diego', N'W', N'Roel', 6, 192, N'1389', CAST(N'1991-12-16T00:00:00.000' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Employee_Sat] ([Employee_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [fname], [minit], [lname], [job_id], [job_lvl], [pub_id], [hire_date], [sourceSystem], [LoadProcessID]) VALUES (0x7C55EB59319F777285B83FA5AB08D70B, CAST(N'2024-06-11T23:28:00.520' AS DateTime), NULL, CAST(N'2024-06-11T23:28:00.520' AS DateTime), N'Roland', N' ', N'Mendel', 11, 150, N'0736', CAST(N'1991-09-05T00:00:00.000' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Employee_Sat] ([Employee_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [fname], [minit], [lname], [job_id], [job_lvl], [pub_id], [hire_date], [sourceSystem], [LoadProcessID]) VALUES (0x86D7CEA1E79BB131C41218622142B77A, CAST(N'2024-06-11T23:28:00.520' AS DateTime), NULL, CAST(N'2024-06-11T23:28:00.520' AS DateTime), N'Elizabeth', N'N', N'Lincoln', 14, 35, N'0877', CAST(N'1990-07-24T00:00:00.000' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Employee_Sat] ([Employee_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [fname], [minit], [lname], [job_id], [job_lvl], [pub_id], [hire_date], [sourceSystem], [LoadProcessID]) VALUES (0x88067EB493372E1925D4C474213B1938, CAST(N'2024-06-11T23:28:00.520' AS DateTime), NULL, CAST(N'2024-06-11T23:28:00.520' AS DateTime), N'Martin', N'F', N'Sommer', 10, 165, N'0736', CAST(N'1990-04-13T00:00:00.000' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Employee_Sat] ([Employee_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [fname], [minit], [lname], [job_id], [job_lvl], [pub_id], [hire_date], [sourceSystem], [LoadProcessID]) VALUES (0x8E9AA2D3AF8D69C96350BA7CAE532B03, CAST(N'2024-06-11T23:28:00.520' AS DateTime), NULL, CAST(N'2024-06-11T23:28:00.520' AS DateTime), N'Janine', N'Y', N'Labrune', 5, 172, N'9901', CAST(N'1991-05-26T00:00:00.000' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Employee_Sat] ([Employee_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [fname], [minit], [lname], [job_id], [job_lvl], [pub_id], [hire_date], [sourceSystem], [LoadProcessID]) VALUES (0x98C87153C2B35880B779C0C85887CE5F, CAST(N'2024-06-11T23:28:00.520' AS DateTime), NULL, CAST(N'2024-06-11T23:28:00.520' AS DateTime), N'Howard', N'A', N'Snyder', 12, 100, N'0736', CAST(N'1988-11-19T00:00:00.000' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Employee_Sat] ([Employee_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [fname], [minit], [lname], [job_id], [job_lvl], [pub_id], [hire_date], [sourceSystem], [LoadProcessID]) VALUES (0x98EA798E2AAB9F69CE1345A6B1AA08F4, CAST(N'2024-06-11T23:28:00.520' AS DateTime), NULL, CAST(N'2024-06-11T23:28:00.520' AS DateTime), N'Manuel', N' ', N'Pereira', 8, 101, N'9999', CAST(N'1989-01-09T00:00:00.000' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Employee_Sat] ([Employee_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [fname], [minit], [lname], [job_id], [job_lvl], [pub_id], [hire_date], [sourceSystem], [LoadProcessID]) VALUES (0x9B461C7E57FD687A8D6CB24A0905D543, CAST(N'2024-06-11T23:28:00.520' AS DateTime), NULL, CAST(N'2024-06-11T23:28:00.520' AS DateTime), N'Matti', N'G', N'Karttunen', 6, 220, N'0736', CAST(N'1994-05-01T00:00:00.000' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Employee_Sat] ([Employee_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [fname], [minit], [lname], [job_id], [job_lvl], [pub_id], [hire_date], [sourceSystem], [LoadProcessID]) VALUES (0xA8A762CCAEE63F1B178B710B923C54B6, CAST(N'2024-06-11T23:28:00.520' AS DateTime), NULL, CAST(N'2024-06-11T23:28:00.520' AS DateTime), N'Peter', N'H', N'Franken', 10, 75, N'0877', CAST(N'1992-05-17T00:00:00.000' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Employee_Sat] ([Employee_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [fname], [minit], [lname], [job_id], [job_lvl], [pub_id], [hire_date], [sourceSystem], [LoadProcessID]) VALUES (0xB532ABFDB4AF42AB37A503BC24494697, CAST(N'2024-06-11T23:28:00.520' AS DateTime), NULL, CAST(N'2024-06-11T23:28:00.520' AS DateTime), N'Anabela', N'R', N'Domingues', 8, 100, N'0877', CAST(N'1993-01-27T00:00:00.000' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Employee_Sat] ([Employee_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [fname], [minit], [lname], [job_id], [job_lvl], [pub_id], [hire_date], [sourceSystem], [LoadProcessID]) VALUES (0xB5DC4348C1AFEFC85CC294F607FEE99E, CAST(N'2024-06-11T23:28:00.520' AS DateTime), NULL, CAST(N'2024-06-11T23:28:00.520' AS DateTime), N'dt', N'M', N'fd', 12, 35, N'0877', CAST(N'1992-08-27T00:00:00.000' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Employee_Sat] ([Employee_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [fname], [minit], [lname], [job_id], [job_lvl], [pub_id], [hire_date], [sourceSystem], [LoadProcessID]) VALUES (0xB8177984735156B2168AF2C8510521F7, CAST(N'2024-06-11T23:28:00.520' AS DateTime), NULL, CAST(N'2024-06-11T23:28:00.520' AS DateTime), N'Miguel', N'A', N'Paolino', 11, 112, N'1389', CAST(N'1992-12-07T00:00:00.000' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Employee_Sat] ([Employee_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [fname], [minit], [lname], [job_id], [job_lvl], [pub_id], [hire_date], [sourceSystem], [LoadProcessID]) VALUES (0xB9FDB01D315AB6B0D99E6C3F6A8CE936, CAST(N'2024-06-11T23:28:00.520' AS DateTime), NULL, CAST(N'2024-06-11T23:28:00.520' AS DateTime), N'Margaret', N'A', N'Smith', 9, 78, N'1389', CAST(N'1988-09-29T00:00:00.000' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Employee_Sat] ([Employee_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [fname], [minit], [lname], [job_id], [job_lvl], [pub_id], [hire_date], [sourceSystem], [LoadProcessID]) VALUES (0xBEF47A4565DE630EF6DE753F87FAA4FF, CAST(N'2024-06-11T23:28:00.520' AS DateTime), NULL, CAST(N'2024-06-11T23:28:00.520' AS DateTime), N'Francisco', N' ', N'Chang', 4, 227, N'9952', CAST(N'1990-11-03T00:00:00.000' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Employee_Sat] ([Employee_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [fname], [minit], [lname], [job_id], [job_lvl], [pub_id], [hire_date], [sourceSystem], [LoadProcessID]) VALUES (0xD284F3246B1C755E7730C45600EE0EB5, CAST(N'2024-06-11T23:28:00.520' AS DateTime), NULL, CAST(N'2024-06-11T23:28:00.520' AS DateTime), N'Paula', N'S', N'Parente', 8, 125, N'1389', CAST(N'1994-01-19T00:00:00.000' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Employee_Sat] ([Employee_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [fname], [minit], [lname], [job_id], [job_lvl], [pub_id], [hire_date], [sourceSystem], [LoadProcessID]) VALUES (0xD726697E90761A25184B9D3810240F77, CAST(N'2024-06-11T23:28:00.520' AS DateTime), NULL, CAST(N'2024-06-11T23:28:00.520' AS DateTime), N'Palle', N'D', N'Ibsen', 7, 195, N'0736', CAST(N'1993-05-09T00:00:00.000' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Employee_Sat] ([Employee_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [fname], [minit], [lname], [job_id], [job_lvl], [pub_id], [hire_date], [sourceSystem], [LoadProcessID]) VALUES (0xD982A8AF299DB0A144597CDCF00489E1, CAST(N'2024-06-11T23:28:00.520' AS DateTime), NULL, CAST(N'2024-06-11T23:28:00.520' AS DateTime), N'fg', N'M', N'cg', 2, 210, N'0877', CAST(N'2024-05-19T00:00:00.000' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Employee_Sat] ([Employee_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [fname], [minit], [lname], [job_id], [job_lvl], [pub_id], [hire_date], [sourceSystem], [LoadProcessID]) VALUES (0xDA42B8A6687C17EFCC38E0B132DBB24D, CAST(N'2024-06-11T23:28:00.520' AS DateTime), NULL, CAST(N'2024-06-11T23:28:00.520' AS DateTime), N'Helen', N' ', N'Bennett', 12, 35, N'0877', CAST(N'1989-09-21T00:00:00.000' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Employee_Sat] ([Employee_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [fname], [minit], [lname], [job_id], [job_lvl], [pub_id], [hire_date], [sourceSystem], [LoadProcessID]) VALUES (0xDD2F384F0BD342D29520E3D729E5274B, CAST(N'2024-06-11T23:28:00.520' AS DateTime), NULL, CAST(N'2024-06-11T23:28:00.520' AS DateTime), N'Aria', N' ', N'Cruz', 10, 87, N'1389', CAST(N'1991-10-26T00:00:00.000' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Employee_Sat] ([Employee_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [fname], [minit], [lname], [job_id], [job_lvl], [pub_id], [hire_date], [sourceSystem], [LoadProcessID]) VALUES (0xDDFA04D557C14F164A68022F328766F5, CAST(N'2024-06-11T23:28:00.520' AS DateTime), NULL, CAST(N'2024-06-11T23:28:00.520' AS DateTime), N'Rita', N'B', N'Muller', 5, 198, N'1622', CAST(N'1993-10-09T00:00:00.000' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Employee_Sat] ([Employee_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [fname], [minit], [lname], [job_id], [job_lvl], [pub_id], [hire_date], [sourceSystem], [LoadProcessID]) VALUES (0xE0F96CBE9A451B455C833BCB3193F357, CAST(N'2024-06-11T23:28:00.520' AS DateTime), NULL, CAST(N'2024-06-11T23:28:00.520' AS DateTime), N'Patricia', N'C', N'McKenna', 11, 150, N'9999', CAST(N'1989-08-01T00:00:00.000' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Employee_Sat] ([Employee_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [fname], [minit], [lname], [job_id], [job_lvl], [pub_id], [hire_date], [sourceSystem], [LoadProcessID]) VALUES (0xE2061C5276086326C4B4816763F95461, CAST(N'2024-06-11T23:28:00.520' AS DateTime), NULL, CAST(N'2024-06-11T23:28:00.520' AS DateTime), N'th', N'm', N'yg', 3, 190, N'0877', CAST(N'2024-06-07T00:00:00.000' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Employee_Sat] ([Employee_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [fname], [minit], [lname], [job_id], [job_lvl], [pub_id], [hire_date], [sourceSystem], [LoadProcessID]) VALUES (0xE6928824B6200DADCF29DC96233B89D8, CAST(N'2024-06-11T23:28:00.520' AS DateTime), NULL, CAST(N'2024-06-11T23:28:00.520' AS DateTime), N'Maria', N'J', N'Pontes', 5, 246, N'1756', CAST(N'1989-03-01T00:00:00.000' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Employee_Sat] ([Employee_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [fname], [minit], [lname], [job_id], [job_lvl], [pub_id], [hire_date], [sourceSystem], [LoadProcessID]) VALUES (0xEDB523332FE9FA9D5D19159A703EC24F, CAST(N'2024-06-11T23:28:00.520' AS DateTime), NULL, CAST(N'2024-06-11T23:28:00.520' AS DateTime), N'Carlos', N'F', N'Hernadez', 5, 211, N'9999', CAST(N'1989-04-21T00:00:00.000' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Employee_Sat] ([Employee_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [fname], [minit], [lname], [job_id], [job_lvl], [pub_id], [hire_date], [sourceSystem], [LoadProcessID]) VALUES (0xF31B9AF698A32B4C507EDE33F505D8BA, CAST(N'2024-06-11T23:28:00.520' AS DateTime), NULL, CAST(N'2024-06-11T23:28:00.520' AS DateTime), N'Martine', N' ', N'Rance', 9, 75, N'0877', CAST(N'1992-02-05T00:00:00.000' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Employee_Sat] ([Employee_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [fname], [minit], [lname], [job_id], [job_lvl], [pub_id], [hire_date], [sourceSystem], [LoadProcessID]) VALUES (0xF72C1ABB24879583103FB18FBAE130A9, CAST(N'2024-06-11T23:28:00.520' AS DateTime), NULL, CAST(N'2024-06-11T23:28:00.520' AS DateTime), N'Pedro', N'S', N'Afonso', 14, 89, N'1389', CAST(N'1990-12-24T00:00:00.000' AS DateTime), N'Pubs', N'1002')
GO
INSERT [dbo].[Jobs_Hub] ([Job_HSK], [Job_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x1679091C5A880FAF6FB5E6087EB1B2DC, 6, CAST(N'2024-06-11T20:25:01.940' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Jobs_Hub] ([Job_HSK], [Job_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x1F0E3DAD99908345F7439F8FFABDFFC4, 19, CAST(N'2024-06-11T20:25:01.940' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Jobs_Hub] ([Job_HSK], [Job_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x45C48CCE2E2D7FBDEA1AFC51C7C6AD26, 9, CAST(N'2024-06-11T20:25:01.940' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Jobs_Hub] ([Job_HSK], [Job_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x6512BD43D9CAA6E02C990B0A82652DCA, 11, CAST(N'2024-06-11T20:25:01.940' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Jobs_Hub] ([Job_HSK], [Job_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x8F14E45FCEEA167A5A36DEDD4BEA2543, 7, CAST(N'2024-06-11T20:25:01.940' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Jobs_Hub] ([Job_HSK], [Job_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x98F13708210194C475687BE6106A3B84, 20, CAST(N'2024-06-11T20:25:01.940' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Jobs_Hub] ([Job_HSK], [Job_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xA87FF679A2F3E71D9181A67B7542122C, 4, CAST(N'2024-06-11T20:25:01.940' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Jobs_Hub] ([Job_HSK], [Job_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xAAB3238922BCC25A6F606EB525FFDC56, 14, CAST(N'2024-06-11T20:25:01.940' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Jobs_Hub] ([Job_HSK], [Job_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xC20AD4D76FE97759AA27A0C99BFF6710, 12, CAST(N'2024-06-11T20:25:01.940' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Jobs_Hub] ([Job_HSK], [Job_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xC4CA4238A0B923820DCC509A6F75849B, 1, CAST(N'2024-06-11T20:25:01.940' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Jobs_Hub] ([Job_HSK], [Job_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xC51CE410C124A10E0DB5E4B97FC2AF39, 13, CAST(N'2024-06-11T20:25:01.940' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Jobs_Hub] ([Job_HSK], [Job_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xC81E728D9D4C2F636F067F89CC14862C, 2, CAST(N'2024-06-11T20:25:01.940' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Jobs_Hub] ([Job_HSK], [Job_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xC9F0F895FB98AB9159F51FD0297E236D, 8, CAST(N'2024-06-11T20:25:01.940' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Jobs_Hub] ([Job_HSK], [Job_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xD3D9446802A44259755D38E6D163E820, 10, CAST(N'2024-06-11T20:25:01.940' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Jobs_Hub] ([Job_HSK], [Job_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xE4DA3B7FBBCE2345D7772B0674A318D5, 5, CAST(N'2024-06-11T20:25:01.940' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Jobs_Hub] ([Job_HSK], [Job_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xECCBC87E4B5CE2FE28308FD9F2A7BAF3, 3, CAST(N'2024-06-11T20:25:01.940' AS DateTime), N'Pubs', N'1001')
GO
INSERT [dbo].[Jobs_Sat] ([Job_HSK], [StartDateTime], [EndDateTime], [job_desc], [min_lvl], [max_lvl], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x1679091C5A880FAF6FB5E6087EB1B2DC, CAST(N'2024-06-11T23:35:08.303' AS DateTime), NULL, N'Managing Editor', 140, 225, CAST(N'2024-06-11T23:35:08.303' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Jobs_Sat] ([Job_HSK], [StartDateTime], [EndDateTime], [job_desc], [min_lvl], [max_lvl], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x1F0E3DAD99908345F7439F8FFABDFFC4, CAST(N'2024-06-11T23:35:08.303' AS DateTime), NULL, N'yfu', 5, 20, CAST(N'2024-06-11T23:35:08.303' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Jobs_Sat] ([Job_HSK], [StartDateTime], [EndDateTime], [job_desc], [min_lvl], [max_lvl], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x45C48CCE2E2D7FBDEA1AFC51C7C6AD26, CAST(N'2024-06-11T23:35:08.303' AS DateTime), NULL, N'Acquisitions Manager', 75, 175, CAST(N'2024-06-11T23:35:08.303' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Jobs_Sat] ([Job_HSK], [StartDateTime], [EndDateTime], [job_desc], [min_lvl], [max_lvl], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x6512BD43D9CAA6E02C990B0A82652DCA, CAST(N'2024-06-11T23:35:08.303' AS DateTime), NULL, N'Operations Manager', 75, 150, CAST(N'2024-06-11T23:35:08.303' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Jobs_Sat] ([Job_HSK], [StartDateTime], [EndDateTime], [job_desc], [min_lvl], [max_lvl], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x8F14E45FCEEA167A5A36DEDD4BEA2543, CAST(N'2024-06-11T23:35:08.303' AS DateTime), NULL, N'Marketing Manager', 120, 200, CAST(N'2024-06-11T23:35:08.303' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Jobs_Sat] ([Job_HSK], [StartDateTime], [EndDateTime], [job_desc], [min_lvl], [max_lvl], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x98F13708210194C475687BE6106A3B84, CAST(N'2024-06-11T23:35:08.303' AS DateTime), NULL, N'ghuk', 2, 5, CAST(N'2024-06-11T23:35:08.303' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Jobs_Sat] ([Job_HSK], [StartDateTime], [EndDateTime], [job_desc], [min_lvl], [max_lvl], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xA87FF679A2F3E71D9181A67B7542122C, CAST(N'2024-06-11T23:35:08.303' AS DateTime), NULL, N'Chief Financial Officier', 175, 250, CAST(N'2024-06-11T23:35:08.303' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Jobs_Sat] ([Job_HSK], [StartDateTime], [EndDateTime], [job_desc], [min_lvl], [max_lvl], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xAAB3238922BCC25A6F606EB525FFDC56, CAST(N'2024-06-11T23:35:08.303' AS DateTime), NULL, N'Designer', 25, 100, CAST(N'2024-06-11T23:35:08.303' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Jobs_Sat] ([Job_HSK], [StartDateTime], [EndDateTime], [job_desc], [min_lvl], [max_lvl], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xC20AD4D76FE97759AA27A0C99BFF6710, CAST(N'2024-06-11T23:35:08.303' AS DateTime), NULL, N'Editor', 25, 100, CAST(N'2024-06-11T23:35:08.303' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Jobs_Sat] ([Job_HSK], [StartDateTime], [EndDateTime], [job_desc], [min_lvl], [max_lvl], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xC4CA4238A0B923820DCC509A6F75849B, CAST(N'2024-06-11T23:35:08.303' AS DateTime), NULL, N'New Hire - Job not specified', 10, 10, CAST(N'2024-06-11T23:35:08.303' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Jobs_Sat] ([Job_HSK], [StartDateTime], [EndDateTime], [job_desc], [min_lvl], [max_lvl], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xC51CE410C124A10E0DB5E4B97FC2AF39, CAST(N'2024-06-11T23:35:08.303' AS DateTime), NULL, N'Sales Representative', 25, 100, CAST(N'2024-06-11T23:35:08.303' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Jobs_Sat] ([Job_HSK], [StartDateTime], [EndDateTime], [job_desc], [min_lvl], [max_lvl], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xC81E728D9D4C2F636F067F89CC14862C, CAST(N'2024-06-11T23:35:08.303' AS DateTime), NULL, N'Chief Executive Officer', 200, 250, CAST(N'2024-06-11T23:35:08.303' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Jobs_Sat] ([Job_HSK], [StartDateTime], [EndDateTime], [job_desc], [min_lvl], [max_lvl], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xC9F0F895FB98AB9159F51FD0297E236D, CAST(N'2024-06-11T23:35:08.303' AS DateTime), NULL, N'Public Relations Manager', 100, 175, CAST(N'2024-06-11T23:35:08.303' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Jobs_Sat] ([Job_HSK], [StartDateTime], [EndDateTime], [job_desc], [min_lvl], [max_lvl], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xD3D9446802A44259755D38E6D163E820, CAST(N'2024-06-11T23:35:08.303' AS DateTime), NULL, N'Productions Manager', 75, 165, CAST(N'2024-06-11T23:35:08.303' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Jobs_Sat] ([Job_HSK], [StartDateTime], [EndDateTime], [job_desc], [min_lvl], [max_lvl], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xE4DA3B7FBBCE2345D7772B0674A318D5, CAST(N'2024-06-11T23:35:08.303' AS DateTime), NULL, N'Publisher', 150, 250, CAST(N'2024-06-11T23:35:08.303' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Jobs_Sat] ([Job_HSK], [StartDateTime], [EndDateTime], [job_desc], [min_lvl], [max_lvl], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xECCBC87E4B5CE2FE28308FD9F2A7BAF3, CAST(N'2024-06-11T23:35:08.303' AS DateTime), NULL, N'Business Operations Manager', 175, 225, CAST(N'2024-06-11T23:35:08.303' AS DateTime), N'Pubs', N'1002')
GO
INSERT [dbo].[PubInfo_Link] ([Pubinfo_HSK], [publishers_HSK], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0x1679091C5A880FAF6FB5E6087EB1B2DC, 0xFA60438AC1719D11EB95899AF86E27C600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-17T01:25:21.853' AS DateTime), N'Pubs', N'1003')
INSERT [dbo].[PubInfo_Link] ([Pubinfo_HSK], [publishers_HSK], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0x8F14E45FCEEA167A5A36DEDD4BEA2543, 0x74765968C67007219B197F4D9AAFB4E200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-17T01:25:21.853' AS DateTime), N'Pubs', N'1003')
INSERT [dbo].[PubInfo_Link] ([Pubinfo_HSK], [publishers_HSK], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0xA87FF679A2F3E71D9181A67B7542122C, 0xC7AF0926B294E47E52E46CFEBE173F2000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-17T01:25:21.853' AS DateTime), N'Pubs', N'1003')
INSERT [dbo].[PubInfo_Link] ([Pubinfo_HSK], [publishers_HSK], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0xC4CA4238A0B923820DCC509A6F75849B, 0xD631CD193BBB80D23115E0696295532000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-17T01:25:21.853' AS DateTime), N'Pubs', N'1003')
INSERT [dbo].[PubInfo_Link] ([Pubinfo_HSK], [publishers_HSK], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0xC81E728D9D4C2F636F067F89CC14862C, 0xE707124B7ACF5A2856B17899AFA99BB600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-17T01:25:21.853' AS DateTime), N'Pubs', N'1003')
INSERT [dbo].[PubInfo_Link] ([Pubinfo_HSK], [publishers_HSK], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0xC9F0F895FB98AB9159F51FD0297E236D, 0xFA246D0262C3925617B0C72BB20EEB1D00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-17T01:25:21.853' AS DateTime), N'Pubs', N'1003')
INSERT [dbo].[PubInfo_Link] ([Pubinfo_HSK], [publishers_HSK], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0xE4DA3B7FBBCE2345D7772B0674A318D5, 0xCEFAB442B1728A7C1B49C63F1A55781C00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-17T01:25:21.853' AS DateTime), N'Pubs', N'1003')
INSERT [dbo].[PubInfo_Link] ([Pubinfo_HSK], [publishers_HSK], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0xECCBC87E4B5CE2FE28308FD9F2A7BAF3, 0x2BD7F907B7F5B6BBD91822C0C7B835F600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-17T01:25:21.853' AS DateTime), N'Pubs', N'1003')
GO
INSERT [dbo].[PubInfo_Sat] ([Pubinfo_HSK], [StartDateTime], [EndDateTime], [logo], [pr_info], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0x1679091C5A880FAF6FB5E6087EB1B2DC, CAST(N'2024-06-17T01:21:15.077' AS DateTime), NULL, 0x4749463839615D002200B30F00000000800000008000808000000080800080008080808080C0C0C0FF000000FF00FFFF000000FFFF00FF00FFFFFFFFFF21F9040100000F002C000000005D0022004004FFF0C949ABBD38EBCDFB03DF078C249895A386AA68BB9E6E0ACE623ABD1BC9E9985DFFB89E8E366BED782C5332563ABA4245A6744AAD5AAF4D2276CBED5EA1D026C528B230CD38B2C92721D78CC4772526748F9F611EB28DE7AFE25E818283604A1E8788898A7385838E8F55856F6C2C1D86392F6B9730708D6C5477673758A3865E92627E94754E173697A6A975809368949BB2AE7B9A6865AA734F80A2A17DA576AA5BB667C290CDCE4379CFD2CE9ED3D6A7CCD7DAA4D9C79341C8B9DF5FC052A8DEBA9BB696767B9C7FD5B8BBF23EABB9706BCAE5F05AB7E6C4C7488DDAF7251BC062530EFE93638C5B3580ECD4951312C217C425E73E89D38709D79D810D393BD20A528CE0AA704AA2D4D3082E583C89BD2C2D720753E1C8922697D44CF6AE53BF6D4041750B4AD467C54548932A1D7374A9D3A789004400003B, N'This is sample text data for GGG&G, publisher 9901 in the pubs database. GGG&G is located in M?nchen, Germany.', CAST(N'2024-06-17T01:21:15.077' AS DateTime), N'Pubs', N'1003')
INSERT [dbo].[PubInfo_Sat] ([Pubinfo_HSK], [StartDateTime], [EndDateTime], [logo], [pr_info], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0x8F14E45FCEEA167A5A36DEDD4BEA2543, CAST(N'2024-06-17T01:21:15.077' AS DateTime), NULL, 0x47494638396107012800B30F00000000800000008000808000000080800080008080808080C0C0C0FF000000FF00FFFF000000FFFF00FF00FFFFFFFFFF21F9040100000F002C00000000070128004004FFF0C949ABBD38EBCDBBFF60288E6469660005AC2C7BB56D05A7D24C4F339E3F765FC716980C3824F28418E4D1A552DA8ACCA5517A7B526F275912690D2A9BD11D14AB8B8257E7E9776BDEE452C2279C47A5CBEDEF2B3C3FBF9FC85981821D7D76868588878A898C8B838F1C8D928E733890829399949B979D9E9FA074A1A3A4A5A6A7458F583E69803F53AF4C62AD5E6DB13B6B3DAEAC6EBA64B365B26BB7ABBEB5C07FB428BCC4C8C1CCC7BBB065637C7A9B7BBE8CDADBDA8B7C31D9E1D88E2FA89E9AE9E49AE7EDA48DA2EEF2F3F4F597AEF6F9FAFBFC805D6CD28C0164C64D18BE3AAD88D87AA5C1DBC07FD59CE54293F0E0882AC39ED9CA2886E3308FB3FF262EBC726D591823204F2E0C09A4A3B32CFEACBC24198D86C48FD3E208D43832E3C0671A2D89737167281AA333219AC048D061499A3C83BEC8090BD84E5A99DE808B730DE9516B727CE85AE7C122BF73EAD29255CB76ADDBB6EC549C8504F7AD5DB37343A98D97576EDDBF7CFB0AEE8457EF5D4E83132BAEB1B8B1E3C749204B9EACB830E5CB984DE1F339A4E1CC88C93CB7D989D72234D1D3A672FEF85055C483C80A06742ADB664F3563119E417D5A8F52DFB1512AEC5D82E9C8662A477FB19A72B6F2E714413F8D0654AA75A8C4C648FDBC346ACDCD5487AFC439BE8BC8E8AA7F6BD77D2B7DF4E6C5882E57DFBDE2F56AEE6D87DFB8BFE06BE7E8F1C6CBCE4D2DC15751803C5956567EFA1D47A041E5F1176183CC1D571D21C2850396565CF5B1D5571D8AC21D08E099A15E85269E87207B1736B31E6FE620324E582116F5215178C86763518A9068DF7FE8C9C6207DCD0104A47B6B717388901EFA27238E3482454E43BB61E8D388F7FD44DD32473E79D43A527633232561E6F86536660256891699D175989A6F1A020A9C75C9D5E68274C619D79D91B5C5189F7906CA67297129D88F9E881A3AA83E8AB623E85E8B0EDAE89C892216E9A584B80318A69C7E3269A7A046FA69A8A4B6094004003B, N'This is sample text data for Scootney Books, publisher 9952 in the pubs database. Scootney Books is located in New York City, New York.', CAST(N'2024-06-17T01:21:15.077' AS DateTime), N'Pubs', N'1003')
INSERT [dbo].[PubInfo_Sat] ([Pubinfo_HSK], [StartDateTime], [EndDateTime], [logo], [pr_info], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0xA87FF679A2F3E71D9181A67B7542122C, CAST(N'2024-06-17T01:21:15.077' AS DateTime), NULL, 0x474946383961F5003400B30F00000000800000008000808000000080800080008080808080C0C0C0FF000000FF00FFFF000000FFFF00FF00FFFFFFFFFF21F9040100000F002C00000000F50034004004FFF0C949ABBD38EBCDBBFF60288E64D90166AA016CEBBEB02ACF746D67E82DC2ACEEFFC0A02997B31027C521EF25698D8E42230E049D3E8AD8537385BC4179DB6B574C26637BE58BF38A1EB393DF2CE55CA52731F77918BE9FAFCD6180817F697F5F6E6C7A836D62876A817A79898A7E31524D708E7299159C9456929F9044777C6575A563A68E827D9D4C8D334BB3B051B6B7B83A8490B91EB4B3BDC1C251A1C24BC3C8C9C8C5C4BFCCCAD0D135ACC36B2E3BBCB655AD1CDB8F6921DEB8D48AA9ADA46046D7E0DC829B9D98E9988878D9AAE5AEF875BC6DEFF7E7A35C9943F18CCA3175C0A4295C48625F3B8610234A0C17D159C289189515CC7531A3C7891BFF9B59FA4812634820F24AAA94882EA50D8BBB3E8813598B8A3D7C0D6F12CB8710E5BA7536D9ED3C458F8B509CF17CE94CEA658F254D944889528306E83C245089629DDA4F8BD65885049ACBB7ADAB2A5364AFDAF344902752409A6085FA39105EBB3C2DAB2E52FA8611B7ACFA060956CB1370598176DB3E74FB956CCCA77207BB6B8CAAAADEA3FFBE01A48CD871D65569C37E25A458C5C9572E57AADE59F7F40A98B456CB36560F730967B3737B74ADBBB7EFDABF830BE70B11F6C8E1C82F31345E33B9F3A5C698FB7D4E9D779083D4B313D7985ABB77E0C9B07F1F0F3EFA71F2E8ED56EB98BEBD7559306FC72C6995EA7499F3B5DDA403FF17538AB6FD20C9FF7D463D531681971888E0104E45069D7C742D58DB7B29B45454811B381420635135B5D838D6E487612F876D98D984B73D2820877DFD871523F5E161D97DD7FCB4C82E31BEC8176856D9D8487D95E1E5D711401AE2448EF11074E47E9D69359382E8A8871391880C28E5861636399950FEFCA55E315D8279255C2C6AA89899B68588961C5B82C366693359F1CA89ACACB959971D76F6E6607B6E410E9D57B1A9196A52BDD56636CC08BA519C5E1EDA8743688906DA9D53F2E367999656A96292E2781397A6264E62A04E25FE49A59354696958409B11F527639DEAC84E7795553A9AACA85C68E8977D2A7919A5A7F83329A46F0D79698BF60D98688CCC118A6C3F8F38E6D89C8C12F635E49145F6132D69DCCE684725FC0546C3B40875D79E70A5867A8274E69E8BAEAC1FEEC02E92EE3AA7ADA015365BEFBE83F2EB6F351100003B, N'This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.

This is sample text data for Five Lakes Publishing, publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago, Illinois.', CAST(N'2024-06-17T01:21:15.077' AS DateTime), N'Pubs', N'1003')
INSERT [dbo].[PubInfo_Sat] ([Pubinfo_HSK], [StartDateTime], [EndDateTime], [logo], [pr_info], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0xC4CA4238A0B923820DCC509A6F75849B, CAST(N'2024-06-17T01:21:15.077' AS DateTime), NULL, 0x474946383961D3001F00B30F00000000800000008000808000000080800080008080808080C0C0C0FF000000FF00FFFF000000FFFF00FF00FFFFFFFFFF21F9040100000F002C00000000D3001F004004FFF0C949ABBD38EBCDBBFF60288E245001686792236ABAB03BC5B055B3F843D3B99DE2AB532A36FB15253B19E5A6231A934CA18CB75C1191D69BF62AAD467F5CF036D8243791369F516ADEF9304AF8F30A3563D7E54CFC04BF24377B5D697E6451333D8821757F898D8E8F1F76657877907259755E5493962081798D9F8A846D9B4A929385A7A5458CA0777362ACAF585E6C6A84AD429555BAA9A471A89D8E8BA2C3C7C82DC9C8AECBCECF1EC2D09143A66E80D3D9BC2C41D76AD28FB2CD509ADAA9AAC62594A3DF81C65FE0BDB5B0CDF4E276DEF6DD78EF6B86FA6C82C5A2648A54AB6AAAE4C1027864DE392E3AF4582BF582DFC07D9244ADA2480BD4C6767BFF32AE0BF3EF603B3907490A4427CE21A7330A6D0584B810664D7F383FA25932488FB96D0F37BDF9491448D1A348937A52CAB4A9D3784EF5E58B4A5545D54BC568FABC9A68DD526ED0A6B8AA17331BD91E5AD9D1D390CED23D88F54A3ACB0A955ADDAD9A50B50D87296E3EB9C76A7CDAABC86B2460040DF34D3995515AB9FF125F1AFA0DAB20A0972382CCB9F9E5AEBC368B21EEDB66EDA15F1347BE2DFDEBB44A7B7C6889240D9473EB73322F4E8D8DBBE14D960B6519BCE5724BB95789350E97EA4BF3718CDD64068D751A261D8B1539D6DCDE3C37F68E1FB58E5DCED8A44477537049852EFD253CEE38C973B7E9D97A488C2979FB936FBAFF2CF5CB79E35830400C31860F4A9BE925D4439F81B6A073BEF1575F593C01A25B26127255D45D4A45B65B851A36C56154678568A20E1100003B, N'This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.

This is sample text data for New Moon Books, publisher 0736 in the pubs database. New Moon Books is located in Boston, Massachusetts.', CAST(N'2024-06-17T01:21:15.077' AS DateTime), N'Pubs', N'1003')
INSERT [dbo].[PubInfo_Sat] ([Pubinfo_HSK], [StartDateTime], [EndDateTime], [logo], [pr_info], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0xC81E728D9D4C2F636F067F89CC14862C, CAST(N'2024-06-17T01:21:15.077' AS DateTime), NULL, 0x4749463839618B002F00B30F00000000800000008000808000000080800080008080808080C0C0C0FF000000FF00FFFF000000FFFF00FF00FFFFFFFFFF21F9040100000F002C000000008B002F004004FFF0C949ABBD38EBCDBBFFA0048464089CE384A62BD596309CC6F4F58A287EBA79ED73B3D26A482C1A8FC8A47249FCCD76BC1F3058D94135579C9345053D835768560CFE6A555D343A1B6D3FC6DC2A377E66DBA5F8DBEBF6EEE1FF2A805B463A47828269871F7A3D7C7C8A3E899093947F666A756567996E6C519E167692646E7D9C98A42295ABAC24A092AD364C737EB15EB61B8E8DB58FB81DB0BE8C6470A0BE58C618BAC365C5C836CEA1BCBBC4C0D0AAD6D14C85CDD86FDDDFAB5F43A580DCB519A25B9BAE989BC3EEA9A7EBD9BF54619A7DF8BBA87475EDA770D6C58B968C59A27402FB99E2378FC7187010D5558948B15CC58B4E20CE9A762E62B558CAB86839FC088D24AB90854662BCD60D653E832BBD7924F49226469327FDEC91C6AD2538972E6FFEE429720D4E63472901251A33A9D28DB47A5A731A7325D56D50B36ADDAA2463D5AF1EAE82F5F84FAA946656AA21AC31D0C4BF85CBA87912D6D194D4B535C5DDDBA93221CB226D022E9437D89C594305FD321C0CB7DFA5C58223036E088F3139B9032563DD0BE66D2ACD8B2BCB9283CEDEE3C6A53EE39BA7579A62C1294917DC473035E0B9E3183F9A3BB6F7ABDE608B018800003B, N'This is sample text data for Binnet & Hardley, publisher 0877 in the pubs database. Binnet & Hardley is located in Washington, D.C.

This is sample text data for Binnet & Hardley, publisher 0877 in the pubs database. Binnet & Hardley is located in Washington, D.C.

This is sample text data for Binnet & Hardley, publisher 0877 in the pubs database. Binnet & Hardley is located in Washington, D.C.

This is sample text data for Binnet & Hardley, publisher 0877 in the pubs database. Binnet & Hardley is located in Washington, D.C.

This is sample text data for Binnet & Hardley, publisher 0877 in the pubs database. Binnet & Hardley is located in Washington, D.C.', CAST(N'2024-06-17T01:21:15.077' AS DateTime), N'Pubs', N'1003')
INSERT [dbo].[PubInfo_Sat] ([Pubinfo_HSK], [StartDateTime], [EndDateTime], [logo], [pr_info], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0xC9F0F895FB98AB9159F51FD0297E236D, CAST(N'2024-06-17T01:21:15.077' AS DateTime), NULL, 0x474946383961A9002400B30F00000000800000008000808000000080800080008080808080C0C0C0FF000000FF00FFFF000000FFFF00FF00FFFFFFFFFF21F9040100000F002C00000000A90024004004FFF0C949ABBD38EBCDBBFF60F8011A609E67653EA8D48A702CCFF44566689ED67CEFFF23D58E7513B686444A6EA26B126FC8E74AC82421A7ABE5F4594D61B7BBF0D6F562719A68A07ACDC6389925749AFC6EDBEFBCA24D3E96E2FF803D7A1672468131736E494A8B5C848D8633834B916E598B657E4A83905F7D9B7B56986064A09BA2A68D63603A2E717C9487B2B3209CA7AD52594751B4BD80B65D75B799BEC5BFAF7CC6CACB6638852ACC409F901BD33EB6BCCDC1D1CEA9967B23C082C3709662A69FA4A591E7AE84D87A5FA0AB502F43AC5D74EB9367B0624593FA5CB101ED144173E5F4315AE8485B4287FCBE39E446B1624173FEAC59DC2809594623D9C3388A54E4ACD59C642353E2F098E919319530DD61C405C7CBCB9831C5E5A2192C244E983A3FFE1CDA21282CA248ABB18C25336952A389D689E489B0D24483243B66CD8775A315801AA5A60A6B2DAC074E3741D6BBA8902BA687E9A6D1A3B6D6D15C7460C77AA3E3E556D79EBAF4AAAAB2CFCF578671DFDE657598305D51F7BE5E5A25361ED3388EED0A84B2B7535D6072C1D62DB5588BE5CCA5B1BDA377B99E3CBE9EDA31944A951ADF7DB15263A1429B37BB7E429D8EC4D754B87164078F2B87012002003B, N'This is sample text data for Lucerne Publishing, publisher 9999 in the pubs database. Lucerne publishing is located in Paris, France.

This is sample text data for Lucerne Publishing, publisher 9999 in the pubs database. Lucerne publishing is located in Paris, France.

This is sample text data for Lucerne Publishing, publisher 9999 in the pubs database. Lucerne publishing is located in Paris, France.

This is sample text data for Lucerne Publishing, publisher 9999 in the pubs database. Lucerne publishing is located in Paris, France.', CAST(N'2024-06-17T01:21:15.077' AS DateTime), N'Pubs', N'1003')
INSERT [dbo].[PubInfo_Sat] ([Pubinfo_HSK], [StartDateTime], [EndDateTime], [logo], [pr_info], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0xE4DA3B7FBBCE2345D7772B0674A318D5, CAST(N'2024-06-17T01:21:15.077' AS DateTime), NULL, 0x474946383961E3002500B30F00000000800000008000808000000080800080008080808080C0C0C0FF000000FF00FFFF000000FFFF00FF00FFFFFFFFFF21F9040100000F002C00000000E30025004004FFF0C949ABBD38EBCDBBFF60288E240858E705A4D2EA4E6E0CC7324DD1EB9CDBBAFCE1AC878DE7ABBD84476452C963369F2F288E933A595B404DB27834E67A5FEC37ACEC517D4EB24E5C8D069966361A5E8ED3C3DCA5AA54B9B2AE2D423082817F848286898386858754887B8A8D939094947E918B7D8780959E9D817C18986FA2A6A75A7B22A59B378E1DACAEB18F1940B6A8B8A853727AB5BD4E76676A37BFB9AF2A564D6BC0776E635BCE6DCFD2C3C873716879D4746C6053DA76E0DAB3A133D6D5B290929F9CEAEDEB6FA0C435EF9E97F59896EC28EEFA9DFF69A21C1BB4CA1E3E63084DB42B970FD6407D05C9E59298B0A2C58B18337AA0E88DA3468DC3FFD0692187A7982F5F2271B152162DE54795CEB0F0DAF8EBDA2A932F1FF203B38C484B6ED07674194ACD639679424B4EDB36279B4D3852FE1095266743955138C5209ADA6D5CB26DCDFC644DD351EACF804BCD32421A562DB6965F25AADD11B056BD7BA436C903E82A1D4A3D024769BAE777B0BB7887F51A0E022E9589BCFCE0DD6527597223C4917502ACBCF8D5E6C49F0B6FA60751A7C2748A3EE7DD6B70B5628F9A5873C6DB5936E57EB843C726043B95EBDE394F3584EC7096ED8DA60D86001EBCB9F3E72F99439F0E7DEC7297BA84D9924EFDB11A65566B8EFB510C7CC258DBB7779F7834A9756E6C97D114F95E5429F13CE5F7F9AAF51C996928604710FF544AFDC79717C10CD85157C6EDD75F7EB49C81D45C5EA9674E5BBBA065941BFB45F3D62D5E99E11488516568A15D1292255F635E8045E0520F3E15A0798DB5C5A08105EE52E3884C05255778E6F5C4A287CCB4D84D1D41CE08CD913C56656482EAEDE8E38D71B974553C199EC324573C3669237C585588E52D1ACE049F85521648659556CD83445D27C9F4D68501CE580E31748ED4948C0E3E88959B257C87E39D0A8EC5D812559234996A9EE5B6E864FE31BA5262971DE40FA5B75D9A487A9A79975C6AB5DD06EA6CCA9DB94FA6A1568AD8A4C33DBA6A5995EE5450AC0AA24A9C6DBAE9F6883CB48976D0ABA8D90AA9A88D6246C2ABA3FE8A1B43CA229B9C58AFC11E071AB1D1BE366DB5C9AE85DCA48595466B83AC95C61DA60D1146EEB3BB817ADA40A08CFBDBB2EB9972EB6EDB66D26D71768D5B2B1FEFC65B11AFA5FA96C93AF50AA6AFBEFE263C1DC0FCA2AB8AC210472C310A1100003B, N'This is sample text data for Ramona Publishers, publisher 1756 in the pubs database. Ramona Publishers is located in Dallas, Texas.', CAST(N'2024-06-17T01:21:15.077' AS DateTime), N'Pubs', N'1003')
INSERT [dbo].[PubInfo_Sat] ([Pubinfo_HSK], [StartDateTime], [EndDateTime], [logo], [pr_info], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0xECCBC87E4B5CE2FE28308FD9F2A7BAF3, CAST(N'2024-06-17T01:21:15.077' AS DateTime), NULL, 0x474946383961C2001D00B30F00000000800000008000808000000080800080008080808080C0C0C0FF000000FF00FFFF000000FFFF00FF00FFFFFFFFFF21F9040100000F002C00000000C2001D004004FFF0C949ABBD38EBCDBBFF60288E1C609E2840AE2C969E6D2CCFB339D90F2CE1F8AEE6BC9FEF26EC01413AA3F2D76BAA96C7A154EA7CC29C449AC7A8ED7A2FDC2FED25149B29E4D479FD55A7CBD931DC35CFA4916171BEFDAABC51546541684C8285847151537F898A588D89806045947491757B6C9A9B9C9D9E9FA0A1A2A3A4A5A6A7A8A95A6A3E64169923B0901A775B7566B25D7F8C888A5150BE7B8F93847D8DC3C07983BEBDC1878BCFAF6F44BBD0AD71C9CBD653BFD5CEC7D1C3DFDB8197D8959CB9AAB8B7EBEEEFF0BA92F1B6B5F4A0F6F776D3FA9EBCFD748C01DCB4AB5DBF7C03CF1454070F61423D491C326BA18E211081250C7AB12867619825F37F2ECE1168AC242B6A274556D121D28FA46C11E78564C5B295308F21BBF5CAD6CCE52C7018813932C4ED5C517346B7C1C2683368349D49A19D0439D31538A452A916135A0B19A59AAB9E6A835A0EABD00E5CD11D1D478C1C59714053AA4C4955AB4B9956879AB497F62E1CBA2373DA25B752239F8787119390AB5806C74E1100003B, N'This is sample text data for Algodata Infosystems, publisher 1389 in the pubs database. Algodata Infosystems is located in Berkeley, California.

This is sample text data for Algodata Infosystems, publisher 1389 in the pubs database. Algodata Infosystems is located in Berkeley, California.

This is sample text data for Algodata Infosystems, publisher 1389 in the pubs database. Algodata Infosystems is located in Berkeley, California.

This is sample text data for Algodata Infosystems, publisher 1389 in the pubs database. Algodata Infosystems is located in Berkeley, California.

This is sample text data for Algodata Infosystems, publisher 1389 in the pubs database. Algodata Infosystems is located in Berkeley, California.

This is sample text data for Algodata Infosystems, publisher 1389 in the pubs database. Algodata Infosystems is located in Berkeley, California.

This is sample text data for Algodata Infosystems, publisher 1389 in the pubs database. Algodata Infosystems is located in Berkeley, California.

This is sample text data for Algodata Infosystems, publisher 1389 in the pubs database. Algodata Infosystems is located in Berkeley, California.

This is sample text data for Algodata Infosystems, publisher 1389 in the pubs database. Algodata Infosystems is located in Berkeley, California.

This is sample text data for Algodata Infosystems, publisher 1389 in the pubs database. Algodata Infosystems is located in Berkeley, California.', CAST(N'2024-06-17T01:21:15.077' AS DateTime), N'Pubs', N'1003')
GO
INSERT [dbo].[Publishers_Hub] ([publishers_HSK], [publishers_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x2A36C1876D54FE4533C3EFEB6DC2CFBA, N'hjkh', CAST(N'2024-06-19T00:04:35.620' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Publishers_Hub] ([publishers_HSK], [publishers_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x2BD7F907B7F5B6BBD91822C0C7B835F6, N'1389', CAST(N'2024-06-11T20:28:08.610' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Publishers_Hub] ([publishers_HSK], [publishers_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x37BF8BB245C5AE952FB107153F18958F, N'4524', CAST(N'2024-06-11T20:28:08.610' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Publishers_Hub] ([publishers_HSK], [publishers_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x74765968C67007219B197F4D9AAFB4E2, N'9952', CAST(N'2024-06-11T20:28:08.610' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Publishers_Hub] ([publishers_HSK], [publishers_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x884CE4BB65D328ECB03C598409E2B168, N'1254', CAST(N'2024-06-11T20:28:08.610' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Publishers_Hub] ([publishers_HSK], [publishers_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xC7AF0926B294E47E52E46CFEBE173F20, N'1622', CAST(N'2024-06-11T20:28:08.610' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Publishers_Hub] ([publishers_HSK], [publishers_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xCEFAB442B1728A7C1B49C63F1A55781C, N'1756', CAST(N'2024-06-11T20:28:08.610' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Publishers_Hub] ([publishers_HSK], [publishers_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xD631CD193BBB80D23115E06962955320, N'0736', CAST(N'2024-06-11T20:28:08.610' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Publishers_Hub] ([publishers_HSK], [publishers_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xE707124B7ACF5A2856B17899AFA99BB6, N'0877', CAST(N'2024-06-11T20:28:08.610' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Publishers_Hub] ([publishers_HSK], [publishers_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xFA246D0262C3925617B0C72BB20EEB1D, N'9999', CAST(N'2024-06-11T20:28:08.610' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Publishers_Hub] ([publishers_HSK], [publishers_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xFA60438AC1719D11EB95899AF86E27C6, N'9901', CAST(N'2024-06-11T20:28:08.610' AS DateTime), N'Pubs', N'1001')
GO
INSERT [dbo].[Publishers_Sat] ([publishers_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [pub_name], [city], [state], [country], [sourceSystem], [LoadProcessID]) VALUES (0x2A36C1876D54FE4533C3EFEB6DC2CFBA, CAST(N'2024-06-19T00:04:36.103' AS DateTime), NULL, CAST(N'2024-06-19T00:04:36.103' AS DateTime), N'hjk', N'hj                  ', N'IN', N'France', N'Pubs', N'1002')
INSERT [dbo].[Publishers_Sat] ([publishers_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [pub_name], [city], [state], [country], [sourceSystem], [LoadProcessID]) VALUES (0x2BD7F907B7F5B6BBD91822C0C7B835F6, CAST(N'2024-06-11T23:47:19.163' AS DateTime), NULL, CAST(N'2024-06-11T23:47:19.163' AS DateTime), N'Algodata Infosystems', N'Berkeley', N'CA', N'USA', N'Pubs', N'1002')
INSERT [dbo].[Publishers_Sat] ([publishers_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [pub_name], [city], [state], [country], [sourceSystem], [LoadProcessID]) VALUES (0x37BF8BB245C5AE952FB107153F18958F, CAST(N'2024-06-11T23:47:19.163' AS DateTime), NULL, CAST(N'2024-06-11T23:47:19.163' AS DateTime), N'h', N'h                   ', N'IN', N'France', N'Pubs', N'1002')
INSERT [dbo].[Publishers_Sat] ([publishers_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [pub_name], [city], [state], [country], [sourceSystem], [LoadProcessID]) VALUES (0x74765968C67007219B197F4D9AAFB4E2, CAST(N'2024-06-11T23:47:19.163' AS DateTime), NULL, CAST(N'2024-06-11T23:47:19.163' AS DateTime), N'Scootney Books', N'New York', N'NY', N'USA', N'Pubs', N'1002')
INSERT [dbo].[Publishers_Sat] ([publishers_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [pub_name], [city], [state], [country], [sourceSystem], [LoadProcessID]) VALUES (0x884CE4BB65D328ECB03C598409E2B168, CAST(N'2024-06-11T23:47:19.163' AS DateTime), NULL, CAST(N'2024-06-11T23:47:19.163' AS DateTime), N'yj', N'ty                  ', N'ca', N'france', N'Pubs', N'1002')
INSERT [dbo].[Publishers_Sat] ([publishers_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [pub_name], [city], [state], [country], [sourceSystem], [LoadProcessID]) VALUES (0xC7AF0926B294E47E52E46CFEBE173F20, CAST(N'2024-06-11T23:47:19.163' AS DateTime), NULL, CAST(N'2024-06-11T23:47:19.163' AS DateTime), N'Five Lakes Publishing', N'Chicago', N'IL', N'USA', N'Pubs', N'1002')
INSERT [dbo].[Publishers_Sat] ([publishers_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [pub_name], [city], [state], [country], [sourceSystem], [LoadProcessID]) VALUES (0xCEFAB442B1728A7C1B49C63F1A55781C, CAST(N'2024-06-11T23:47:19.163' AS DateTime), NULL, CAST(N'2024-06-11T23:47:19.163' AS DateTime), N'Ramona Publishers', N'Dallas', N'TX', N'USA', N'Pubs', N'1002')
INSERT [dbo].[Publishers_Sat] ([publishers_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [pub_name], [city], [state], [country], [sourceSystem], [LoadProcessID]) VALUES (0xD631CD193BBB80D23115E06962955320, CAST(N'2024-06-11T23:47:19.163' AS DateTime), NULL, CAST(N'2024-06-11T23:47:19.163' AS DateTime), N'New Moon Books', N'Boston', N'MA', N'USA', N'Pubs', N'1002')
INSERT [dbo].[Publishers_Sat] ([publishers_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [pub_name], [city], [state], [country], [sourceSystem], [LoadProcessID]) VALUES (0xE707124B7ACF5A2856B17899AFA99BB6, CAST(N'2024-06-11T23:47:19.163' AS DateTime), NULL, CAST(N'2024-06-11T23:47:19.163' AS DateTime), N'Binnet & Hardley', N'Washington', N'DC', N'USA', N'Pubs', N'1002')
INSERT [dbo].[Publishers_Sat] ([publishers_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [pub_name], [city], [state], [country], [sourceSystem], [LoadProcessID]) VALUES (0xFA246D0262C3925617B0C72BB20EEB1D, CAST(N'2024-06-11T23:47:19.163' AS DateTime), NULL, CAST(N'2024-06-11T23:47:19.163' AS DateTime), N'Lucerne Publishing', N'Paris', NULL, N'France', N'Pubs', N'1002')
INSERT [dbo].[Publishers_Sat] ([publishers_HSK], [StartDateTime], [EndDateTime], [LoadDateTime], [pub_name], [city], [state], [country], [sourceSystem], [LoadProcessID]) VALUES (0xFA60438AC1719D11EB95899AF86E27C6, CAST(N'2024-06-11T23:47:19.163' AS DateTime), NULL, CAST(N'2024-06-11T23:47:19.163' AS DateTime), N'GGG&G', N'M?nchen', NULL, N'Germany', N'Pubs', N'1002')
GO
INSERT [dbo].[Sale_Link] ([Sale_HSK], [stores_HSK], [titles_HSK], [loadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x081477F079AFF1501CE75237A3BCD260, 0x8718DEA05BC1DC95810363685CEF0B8E00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0xD5210F873D0AFE85C032B8387D52258600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-16T23:34:20.107' AS DateTime), N'SourcePubs', N'1003')
INSERT [dbo].[Sale_Link] ([Sale_HSK], [stores_HSK], [titles_HSK], [loadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x08EA602A2EEC2EC8DD3812980FC2E854, 0x50E207AB6946B5D78B377AE0144B9E0700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0x59236DBDDBE9EB299206C2C13B9EB22D00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-16T23:34:20.107' AS DateTime), N'SourcePubs', N'1003')
INSERT [dbo].[Sale_Link] ([Sale_HSK], [stores_HSK], [titles_HSK], [loadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x0B8BF5245296E71086DDA09648153330, 0x1109F8734E117143A570A8BF9F8C47B200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0x0F7FB6E8C1EDF6D0CBCDBABC051E322F00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-16T23:34:20.107' AS DateTime), N'SourcePubs', N'1003')
INSERT [dbo].[Sale_Link] ([Sale_HSK], [stores_HSK], [titles_HSK], [loadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x0FEA6B724685CEA5C039A534BFDD133E, 0x50E207AB6946B5D78B377AE0144B9E0700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0x7984F5BB4DE8A182043ACA923EA390D300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-16T23:34:20.107' AS DateTime), N'SourcePubs', N'1003')
INSERT [dbo].[Sale_Link] ([Sale_HSK], [stores_HSK], [titles_HSK], [loadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x16715CCC991DF0045962501AA25B6E10, 0x8718DEA05BC1DC95810363685CEF0B8E00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0x356EA815E5D65D06D0E52F57887CFCDC00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-16T23:34:20.107' AS DateTime), N'SourcePubs', N'1003')
INSERT [dbo].[Sale_Link] ([Sale_HSK], [stores_HSK], [titles_HSK], [loadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x1D61122F9EA10F1234C7CE44FB49396D, 0x2F635A9FE4A4D8D1EC9E3A111CC02F4B00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0x59106B1F491ECD2017BEEED8A4D070BF00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-16T23:34:20.107' AS DateTime), N'SourcePubs', N'1003')
INSERT [dbo].[Sale_Link] ([Sale_HSK], [stores_HSK], [titles_HSK], [loadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x2721C9B2285B57A7B396D40562C7C3FA, 0x6EBB69FFBEBE9FD95D160FFC29E0FE5D00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0x59236DBDDBE9EB299206C2C13B9EB22D00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-16T23:34:20.107' AS DateTime), N'SourcePubs', N'1003')
INSERT [dbo].[Sale_Link] ([Sale_HSK], [stores_HSK], [titles_HSK], [loadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x28526940039D764827727B007679EC9C, 0x6EBB69FFBEBE9FD95D160FFC29E0FE5D00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0xDF00E80E9F87BF0854FE22CBC345E53500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-16T23:34:20.107' AS DateTime), N'SourcePubs', N'1003')
INSERT [dbo].[Sale_Link] ([Sale_HSK], [stores_HSK], [titles_HSK], [loadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x292427D54B148D3A5DCFEAEA031D8EC1, 0x8718DEA05BC1DC95810363685CEF0B8E00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0xBD47B9EC1F45570C5C7B01F0C968B6B500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-16T23:34:20.107' AS DateTime), N'SourcePubs', N'1003')
INSERT [dbo].[Sale_Link] ([Sale_HSK], [stores_HSK], [titles_HSK], [loadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x48850686EEBE6AC3EACE74A44B79EEAC, 0x50E207AB6946B5D78B377AE0144B9E0700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0x3CF5B67727C17F7A97C7EF9A92FF919E00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-16T23:34:20.107' AS DateTime), N'SourcePubs', N'1003')
INSERT [dbo].[Sale_Link] ([Sale_HSK], [stores_HSK], [titles_HSK], [loadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x6B21CD78DD1731761B01D5B3B25D2CDD, 0x50E207AB6946B5D78B377AE0144B9E0700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0x0F7FB6E8C1EDF6D0CBCDBABC051E322F00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-16T23:34:20.107' AS DateTime), N'SourcePubs', N'1003')
INSERT [dbo].[Sale_Link] ([Sale_HSK], [stores_HSK], [titles_HSK], [loadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x809CFE89A11918CF832D07872E54827D, 0x1109F8734E117143A570A8BF9F8C47B200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0xA14A72165DC5BDAFBF36936C9276A4A700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-16T23:34:20.107' AS DateTime), N'SourcePubs', N'1003')
INSERT [dbo].[Sale_Link] ([Sale_HSK], [stores_HSK], [titles_HSK], [loadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x8C4670E8B4C170694696358D5BCAE38F, 0x50E207AB6946B5D78B377AE0144B9E0700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0x2BF44DF35739F5A5B5B257029DF1F50700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-16T23:34:20.107' AS DateTime), N'SourcePubs', N'1003')
INSERT [dbo].[Sale_Link] ([Sale_HSK], [stores_HSK], [titles_HSK], [loadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x90B502F5428120451E19CCF651BE5E68, 0x50E207AB6946B5D78B377AE0144B9E0700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0xFAFCB0CEDAE52893C50B66EBEFA26F8400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-16T23:34:20.107' AS DateTime), N'SourcePubs', N'1003')
INSERT [dbo].[Sale_Link] ([Sale_HSK], [stores_HSK], [titles_HSK], [loadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x9437855EB17F373DC71F808FF70643BE, 0x57E5CB96E22546001F1D6520FF11D9BA00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0x1AABCE7F272EA0D999265C7AD5BDF53C00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-16T23:34:20.107' AS DateTime), N'SourcePubs', N'1003')
INSERT [dbo].[Sale_Link] ([Sale_HSK], [stores_HSK], [titles_HSK], [loadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xA341B8E31B6E0A86C853D5D0B80B22C5, 0x1109F8734E117143A570A8BF9F8C47B200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0x5CA09E09F70BA65FBA0560335FCDDC4600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-16T23:34:20.107' AS DateTime), N'SourcePubs', N'1003')
INSERT [dbo].[Sale_Link] ([Sale_HSK], [stores_HSK], [titles_HSK], [loadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xCB7C103733F573E53819CF6FECDAFE48, 0x1109F8734E117143A570A8BF9F8C47B200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0x3CF5B67727C17F7A97C7EF9A92FF919E00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-16T23:34:20.107' AS DateTime), N'SourcePubs', N'1003')
INSERT [dbo].[Sale_Link] ([Sale_HSK], [stores_HSK], [titles_HSK], [loadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xD0774039AD843871BDCF4C3AEE2EAFE5, 0x2F635A9FE4A4D8D1EC9E3A111CC02F4B00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0x3CF5B67727C17F7A97C7EF9A92FF919E00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-16T23:34:20.107' AS DateTime), N'SourcePubs', N'1003')
INSERT [dbo].[Sale_Link] ([Sale_HSK], [stores_HSK], [titles_HSK], [loadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xD7E8A7EBB61F1543BF599071C13A2166, 0x6EBB69FFBEBE9FD95D160FFC29E0FE5D00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0x59106B1F491ECD2017BEEED8A4D070BF00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-16T23:34:20.107' AS DateTime), N'SourcePubs', N'1003')
INSERT [dbo].[Sale_Link] ([Sale_HSK], [stores_HSK], [titles_HSK], [loadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xDD00EBB1C5E6CC80B6F28A33AC8136FD, 0x1109F8734E117143A570A8BF9F8C47B200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0xC56AC57A93F373750D1C36D44FA07D8F00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-16T23:34:20.107' AS DateTime), N'SourcePubs', N'1003')
INSERT [dbo].[Sale_Link] ([Sale_HSK], [stores_HSK], [titles_HSK], [loadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xEA9CAFF1CDF99E148426DDA6732EF8E5, 0x57E5CB96E22546001F1D6520FF11D9BA00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0x3CF5B67727C17F7A97C7EF9A92FF919E00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-16T23:34:20.107' AS DateTime), N'SourcePubs', N'1003')
INSERT [dbo].[Sale_Link] ([Sale_HSK], [stores_HSK], [titles_HSK], [loadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xF009E37D42BC0DD3F0A4C492660FB355, 0x2F635A9FE4A4D8D1EC9E3A111CC02F4B00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0x2BF44DF35739F5A5B5B257029DF1F50700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-16T23:34:20.107' AS DateTime), N'SourcePubs', N'1003')
INSERT [dbo].[Sale_Link] ([Sale_HSK], [stores_HSK], [titles_HSK], [loadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xFE83FB6849241BEF62B09582FDBEBD55, 0x6EBB69FFBEBE9FD95D160FFC29E0FE5D00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0xD39049A7C4AEB4342A7D27EFE1BDC56900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-16T23:34:20.107' AS DateTime), N'SourcePubs', N'1003')
GO
INSERT [dbo].[Sale_Sat] ([Sale_HSK], [startDateTime], [EndDateTime], [ord_num], [ord_date], [qty], [payterms], [loadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x081477F079AFF1501CE75237A3BCD260, CAST(N'2024-06-16T23:38:05.960' AS DateTime), NULL, N'X999', CAST(N'1993-02-21T00:00:00.000' AS DateTime), 35, N'ON invoice', CAST(N'2024-06-16T23:38:05.960' AS DateTime), N'SourcePubs', N'1002')
INSERT [dbo].[Sale_Sat] ([Sale_HSK], [startDateTime], [EndDateTime], [ord_num], [ord_date], [qty], [payterms], [loadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x08EA602A2EEC2EC8DD3812980FC2E854, CAST(N'2024-06-16T23:38:05.960' AS DateTime), NULL, N'N914014', CAST(N'1994-09-14T00:00:00.000' AS DateTime), 25, N'Net 30', CAST(N'2024-06-16T23:38:05.960' AS DateTime), N'SourcePubs', N'1002')
INSERT [dbo].[Sale_Sat] ([Sale_HSK], [startDateTime], [EndDateTime], [ord_num], [ord_date], [qty], [payterms], [loadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x0B8BF5245296E71086DDA09648153330, CAST(N'2024-06-16T23:38:05.960' AS DateTime), NULL, N'1252', CAST(N'2024-06-10T00:00:00.000' AS DateTime), 5, N'Net 60', CAST(N'2024-06-16T23:38:05.960' AS DateTime), N'SourcePubs', N'1002')
INSERT [dbo].[Sale_Sat] ([Sale_HSK], [startDateTime], [EndDateTime], [ord_num], [ord_date], [qty], [payterms], [loadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x0FEA6B724685CEA5C039A534BFDD133E, CAST(N'2024-06-16T23:38:05.960' AS DateTime), NULL, N'P3087a', CAST(N'1993-05-29T00:00:00.000' AS DateTime), 15, N'Net 60', CAST(N'2024-06-16T23:38:05.960' AS DateTime), N'SourcePubs', N'1002')
INSERT [dbo].[Sale_Sat] ([Sale_HSK], [startDateTime], [EndDateTime], [ord_num], [ord_date], [qty], [payterms], [loadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x16715CCC991DF0045962501AA25B6E10, CAST(N'2024-06-16T23:38:05.960' AS DateTime), NULL, N'TQ456', CAST(N'1993-12-12T00:00:00.000' AS DateTime), 10, N'Net 60', CAST(N'2024-06-16T23:38:05.960' AS DateTime), N'SourcePubs', N'1002')
INSERT [dbo].[Sale_Sat] ([Sale_HSK], [startDateTime], [EndDateTime], [ord_num], [ord_date], [qty], [payterms], [loadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x1D61122F9EA10F1234C7CE44FB49396D, CAST(N'2024-06-16T23:38:05.960' AS DateTime), NULL, N'6871', CAST(N'1994-09-14T00:00:00.000' AS DateTime), 5, N'Net 60', CAST(N'2024-06-16T23:38:05.960' AS DateTime), N'SourcePubs', N'1002')
INSERT [dbo].[Sale_Sat] ([Sale_HSK], [startDateTime], [EndDateTime], [ord_num], [ord_date], [qty], [payterms], [loadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x2721C9B2285B57A7B396D40562C7C3FA, CAST(N'2024-06-16T23:38:05.960' AS DateTime), NULL, N'423LL922', CAST(N'1994-09-14T00:00:00.000' AS DateTime), 15, N'ON invoice', CAST(N'2024-06-16T23:38:05.960' AS DateTime), N'SourcePubs', N'1002')
INSERT [dbo].[Sale_Sat] ([Sale_HSK], [startDateTime], [EndDateTime], [ord_num], [ord_date], [qty], [payterms], [loadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x28526940039D764827727B007679EC9C, CAST(N'2024-06-16T23:38:05.960' AS DateTime), NULL, N'P723', CAST(N'1993-03-11T00:00:00.000' AS DateTime), 25, N'Net 30', CAST(N'2024-06-16T23:38:05.960' AS DateTime), N'SourcePubs', N'1002')
INSERT [dbo].[Sale_Sat] ([Sale_HSK], [startDateTime], [EndDateTime], [ord_num], [ord_date], [qty], [payterms], [loadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x292427D54B148D3A5DCFEAEA031D8EC1, CAST(N'2024-06-16T23:38:05.960' AS DateTime), NULL, N'QQ2299', CAST(N'1993-10-28T00:00:00.000' AS DateTime), 15, N'Net 60', CAST(N'2024-06-16T23:38:05.960' AS DateTime), N'SourcePubs', N'1002')
INSERT [dbo].[Sale_Sat] ([Sale_HSK], [startDateTime], [EndDateTime], [ord_num], [ord_date], [qty], [payterms], [loadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x48850686EEBE6AC3EACE74A44B79EEAC, CAST(N'2024-06-16T23:38:05.960' AS DateTime), NULL, N'N914008', CAST(N'1994-09-14T00:00:00.000' AS DateTime), 20, N'Net 30', CAST(N'2024-06-16T23:38:05.960' AS DateTime), N'SourcePubs', N'1002')
INSERT [dbo].[Sale_Sat] ([Sale_HSK], [startDateTime], [EndDateTime], [ord_num], [ord_date], [qty], [payterms], [loadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x6B21CD78DD1731761B01D5B3B25D2CDD, CAST(N'2024-06-16T23:38:05.960' AS DateTime), NULL, N'P3087a', CAST(N'1993-05-29T00:00:00.000' AS DateTime), 25, N'Net 60', CAST(N'2024-06-16T23:38:05.960' AS DateTime), N'SourcePubs', N'1002')
INSERT [dbo].[Sale_Sat] ([Sale_HSK], [startDateTime], [EndDateTime], [ord_num], [ord_date], [qty], [payterms], [loadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x809CFE89A11918CF832D07872E54827D, CAST(N'2024-06-16T23:38:05.960' AS DateTime), NULL, N'P2121', CAST(N'1992-06-15T00:00:00.000' AS DateTime), 40, N'Net 30', CAST(N'2024-06-16T23:38:05.960' AS DateTime), N'SourcePubs', N'1002')
INSERT [dbo].[Sale_Sat] ([Sale_HSK], [startDateTime], [EndDateTime], [ord_num], [ord_date], [qty], [payterms], [loadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x8C4670E8B4C170694696358D5BCAE38F, CAST(N'2024-06-16T23:38:05.960' AS DateTime), NULL, N'P3087a', CAST(N'1993-05-29T00:00:00.000' AS DateTime), 20, N'Net 60', CAST(N'2024-06-16T23:38:05.960' AS DateTime), N'SourcePubs', N'1002')
INSERT [dbo].[Sale_Sat] ([Sale_HSK], [startDateTime], [EndDateTime], [ord_num], [ord_date], [qty], [payterms], [loadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x90B502F5428120451E19CCF651BE5E68, CAST(N'2024-06-16T23:38:05.960' AS DateTime), NULL, N'P3087a', CAST(N'1993-05-29T00:00:00.000' AS DateTime), 25, N'Net 60', CAST(N'2024-06-16T23:38:05.960' AS DateTime), N'SourcePubs', N'1002')
INSERT [dbo].[Sale_Sat] ([Sale_HSK], [startDateTime], [EndDateTime], [ord_num], [ord_date], [qty], [payterms], [loadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x9437855EB17F373DC71F808FF70643BE, CAST(N'2024-06-16T23:38:05.960' AS DateTime), NULL, N'A2976', CAST(N'1993-05-24T00:00:00.000' AS DateTime), 50, N'Net 30', CAST(N'2024-06-16T23:38:05.960' AS DateTime), N'SourcePubs', N'1002')
INSERT [dbo].[Sale_Sat] ([Sale_HSK], [startDateTime], [EndDateTime], [ord_num], [ord_date], [qty], [payterms], [loadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xA341B8E31B6E0A86C853D5D0B80B22C5, CAST(N'2024-06-16T23:38:05.960' AS DateTime), NULL, N'P2121', CAST(N'1992-06-15T00:00:00.000' AS DateTime), 20, N'Net 30', CAST(N'2024-06-16T23:38:05.960' AS DateTime), N'SourcePubs', N'1002')
INSERT [dbo].[Sale_Sat] ([Sale_HSK], [startDateTime], [EndDateTime], [ord_num], [ord_date], [qty], [payterms], [loadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xCB7C103733F573E53819CF6FECDAFE48, CAST(N'2024-06-16T23:38:05.960' AS DateTime), NULL, N'D4482', CAST(N'1994-09-14T00:00:00.000' AS DateTime), 10, N'Net 60', CAST(N'2024-06-16T23:38:05.960' AS DateTime), N'SourcePubs', N'1002')
INSERT [dbo].[Sale_Sat] ([Sale_HSK], [startDateTime], [EndDateTime], [ord_num], [ord_date], [qty], [payterms], [loadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xD0774039AD843871BDCF4C3AEE2EAFE5, CAST(N'2024-06-16T23:38:05.960' AS DateTime), NULL, N'722a', CAST(N'1994-09-13T00:00:00.000' AS DateTime), 3, N'Net 60', CAST(N'2024-06-16T23:38:05.960' AS DateTime), N'SourcePubs', N'1002')
INSERT [dbo].[Sale_Sat] ([Sale_HSK], [startDateTime], [EndDateTime], [ord_num], [ord_date], [qty], [payterms], [loadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xD7E8A7EBB61F1543BF599071C13A2166, CAST(N'2024-06-16T23:38:05.960' AS DateTime), NULL, N'423LL930', CAST(N'1994-09-14T00:00:00.000' AS DateTime), 10, N'ON invoice', CAST(N'2024-06-16T23:38:05.960' AS DateTime), N'SourcePubs', N'1002')
INSERT [dbo].[Sale_Sat] ([Sale_HSK], [startDateTime], [EndDateTime], [ord_num], [ord_date], [qty], [payterms], [loadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xDD00EBB1C5E6CC80B6F28A33AC8136FD, CAST(N'2024-06-16T23:38:05.960' AS DateTime), NULL, N'P2121', CAST(N'1992-06-15T00:00:00.000' AS DateTime), 20, N'Net 30', CAST(N'2024-06-16T23:38:05.960' AS DateTime), N'SourcePubs', N'1002')
INSERT [dbo].[Sale_Sat] ([Sale_HSK], [startDateTime], [EndDateTime], [ord_num], [ord_date], [qty], [payterms], [loadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xEA9CAFF1CDF99E148426DDA6732EF8E5, CAST(N'2024-06-16T23:38:05.960' AS DateTime), NULL, N'QA7442.3', CAST(N'1994-09-13T00:00:00.000' AS DateTime), 75, N'ON invoice', CAST(N'2024-06-16T23:38:05.960' AS DateTime), N'SourcePubs', N'1002')
INSERT [dbo].[Sale_Sat] ([Sale_HSK], [startDateTime], [EndDateTime], [ord_num], [ord_date], [qty], [payterms], [loadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xF009E37D42BC0DD3F0A4C492660FB355, CAST(N'2024-06-16T23:38:05.960' AS DateTime), NULL, N'25142', CAST(N'2024-06-09T00:00:00.000' AS DateTime), 5, N'Net 60', CAST(N'2024-06-16T23:38:05.960' AS DateTime), N'SourcePubs', N'1002')
INSERT [dbo].[Sale_Sat] ([Sale_HSK], [startDateTime], [EndDateTime], [ord_num], [ord_date], [qty], [payterms], [loadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xFE83FB6849241BEF62B09582FDBEBD55, CAST(N'2024-06-16T23:38:05.960' AS DateTime), NULL, N'QA879.1', CAST(N'1993-05-22T00:00:00.000' AS DateTime), 30, N'Net 30', CAST(N'2024-06-16T23:38:05.960' AS DateTime), N'SourcePubs', N'1002')
GO
INSERT [dbo].[Stores_Hub] ([stores_HSK], [stors_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x1109F8734E117143A570A8BF9F8C47B2, N'7067', CAST(N'2024-06-11T22:42:02.180' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Stores_Hub] ([stores_HSK], [stors_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x11A403C26457E5328D9827A6285BE1E5, N'd   ', CAST(N'2024-06-11T22:42:02.180' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Stores_Hub] ([stores_HSK], [stors_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x2F635A9FE4A4D8D1EC9E3A111CC02F4B, N'6380', CAST(N'2024-06-11T22:42:02.180' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Stores_Hub] ([stores_HSK], [stors_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x471C75EE6643A10934502BDAFEE198FB, N'1524', CAST(N'2024-06-11T22:42:02.180' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Stores_Hub] ([stores_HSK], [stors_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x50E207AB6946B5D78B377AE0144B9E07, N'7131', CAST(N'2024-06-11T22:42:02.180' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Stores_Hub] ([stores_HSK], [stors_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x57E5CB96E22546001F1D6520FF11D9BA, N'7066', CAST(N'2024-06-11T22:42:02.180' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Stores_Hub] ([stores_HSK], [stors_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x6EBB69FFBEBE9FD95D160FFC29E0FE5D, N'8042', CAST(N'2024-06-11T22:42:02.180' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Stores_Hub] ([stores_HSK], [stors_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x8718DEA05BC1DC95810363685CEF0B8E, N'7896', CAST(N'2024-06-11T22:42:02.180' AS DateTime), N'Pubs', N'1001')
GO
INSERT [dbo].[Stores_Sat] ([stores_HSK], [StartDateTime], [EndDateTime], [stor_name], [stor_address], [city], [state], [zip], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x1109F8734E117143A570A8BF9F8C47B2, CAST(N'2024-06-11T23:39:26.607' AS DateTime), NULL, N'News & Brews', N'577 First St.', N'Los Gatos', N'CA', N'96745', CAST(N'2024-06-11T23:39:26.607' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Stores_Sat] ([stores_HSK], [StartDateTime], [EndDateTime], [stor_name], [stor_address], [city], [state], [zip], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x11A403C26457E5328D9827A6285BE1E5, CAST(N'2024-06-11T23:39:26.607' AS DateTime), NULL, N'df', N'df', N'dfb', N'CA', N'1    ', CAST(N'2024-06-11T23:39:26.607' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Stores_Sat] ([stores_HSK], [StartDateTime], [EndDateTime], [stor_name], [stor_address], [city], [state], [zip], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x2F635A9FE4A4D8D1EC9E3A111CC02F4B, CAST(N'2024-06-11T23:39:26.607' AS DateTime), NULL, N'Eric the Read Books', N'788 Catamaugus Ave.', N'Seattle', N'WA', N'98056', CAST(N'2024-06-11T23:39:26.607' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Stores_Sat] ([stores_HSK], [StartDateTime], [EndDateTime], [stor_name], [stor_address], [city], [state], [zip], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x471C75EE6643A10934502BDAFEE198FB, CAST(N'2024-06-11T23:39:26.607' AS DateTime), NULL, N'tujt', N'yj', N'tyj', N'IN', N'14253', CAST(N'2024-06-11T23:39:26.607' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Stores_Sat] ([stores_HSK], [StartDateTime], [EndDateTime], [stor_name], [stor_address], [city], [state], [zip], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x50E207AB6946B5D78B377AE0144B9E07, CAST(N'2024-06-11T23:39:26.607' AS DateTime), NULL, N'Doc-U-Mat: Quality Laundry and Books', N'24-A Avogadro Way', N'Remulade', N'WA', N'98014', CAST(N'2024-06-11T23:39:26.607' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Stores_Sat] ([stores_HSK], [StartDateTime], [EndDateTime], [stor_name], [stor_address], [city], [state], [zip], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x57E5CB96E22546001F1D6520FF11D9BA, CAST(N'2024-06-11T23:39:26.607' AS DateTime), NULL, N'Barnum''s', N'567 Pasadena Ave.', N'Tustin', N'CA', N'92789', CAST(N'2024-06-11T23:39:26.607' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Stores_Sat] ([stores_HSK], [StartDateTime], [EndDateTime], [stor_name], [stor_address], [city], [state], [zip], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x6EBB69FFBEBE9FD95D160FFC29E0FE5D, CAST(N'2024-06-11T23:39:26.607' AS DateTime), NULL, N'Bookbeat', N'679 Carson St.', N'Portland', N'OR', N'89076', CAST(N'2024-06-11T23:39:26.607' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Stores_Sat] ([stores_HSK], [StartDateTime], [EndDateTime], [stor_name], [stor_address], [city], [state], [zip], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x8718DEA05BC1DC95810363685CEF0B8E, CAST(N'2024-06-11T23:39:26.607' AS DateTime), NULL, N'Fricative Bookshop', N'89 Madison St.', N'Fremont', N'CA', N'90019', CAST(N'2024-06-11T23:39:26.607' AS DateTime), N'Pubs', N'1002')
GO
INSERT [dbo].[TitleAuthors_Link] ([TitleAuthor_HSK], [titles_HSK], [Author_HSK], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0x1D1F2B84EAF17820301C1CBAEF72D423, 0xA14A72165DC5BDAFBF36936C9276A4A700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0xED3F8246430AAA86EED2FC9F29CF4CFC00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-16T23:55:24.143' AS DateTime), N'Pubs', N'1003')
INSERT [dbo].[TitleAuthors_Link] ([TitleAuthor_HSK], [titles_HSK], [Author_HSK], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0x1F1C15AFDAA94FB41CE6FC98B06200CC, 0x5CA09E09F70BA65FBA0560335FCDDC4600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0x94DE798E6797D0B7B0FC143D170ADB0200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-16T23:55:24.143' AS DateTime), N'Pubs', N'1003')
INSERT [dbo].[TitleAuthors_Link] ([TitleAuthor_HSK], [titles_HSK], [Author_HSK], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0x2C8675A658DD3976664F1270FD301C9A, 0x3CF5B67727C17F7A97C7EF9A92FF919E00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0x0ADC2145D77C0E766611B0083423143900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-16T23:55:24.143' AS DateTime), N'Pubs', N'1003')
INSERT [dbo].[TitleAuthors_Link] ([TitleAuthor_HSK], [titles_HSK], [Author_HSK], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0x3431C747C153142B9085BD7E43C85BBF, 0xDF00E80E9F87BF0854FE22CBC345E53500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0xECF4803005BBAF6E00E9B966820E9F7C00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-16T23:55:24.143' AS DateTime), N'Pubs', N'1003')
INSERT [dbo].[TitleAuthors_Link] ([TitleAuthor_HSK], [titles_HSK], [Author_HSK], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0x3D2E62DD031CAFDBF3D7A4D4B2C51B48, 0x1AABCE7F272EA0D999265C7AD5BDF53C00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0xD9E364B71491ABEF30BC3B705FCE127C00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-16T23:55:24.143' AS DateTime), N'Pubs', N'1003')
INSERT [dbo].[TitleAuthors_Link] ([TitleAuthor_HSK], [titles_HSK], [Author_HSK], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0x5B1ABDCD044E160CFAAD6D88239FE531, 0x7984F5BB4DE8A182043ACA923EA390D300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0x4DDA8A5D35947B12B948EFF6EF14579A00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-16T23:55:24.143' AS DateTime), N'Pubs', N'1003')
INSERT [dbo].[TitleAuthors_Link] ([TitleAuthor_HSK], [titles_HSK], [Author_HSK], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0x5CAC56CD5CB15CDFC3007EAB3838B9F8, 0xFAFCB0CEDAE52893C50B66EBEFA26F8400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0x85C0253DE4F73450F18B3178F27BED6700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-16T23:55:24.143' AS DateTime), N'Pubs', N'1003')
INSERT [dbo].[TitleAuthors_Link] ([TitleAuthor_HSK], [titles_HSK], [Author_HSK], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0x63E5084E5451F8AC90EB79F8F85936C4, 0x3CF5B67727C17F7A97C7EF9A92FF919E00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0x85C0253DE4F73450F18B3178F27BED6700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-16T23:55:24.143' AS DateTime), N'Pubs', N'1003')
INSERT [dbo].[TitleAuthors_Link] ([TitleAuthor_HSK], [titles_HSK], [Author_HSK], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0x702AE5C80ABCBAB05587174B44185D65, 0x0F7FB6E8C1EDF6D0CBCDBABC051E322F00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0x26BCE8956F85C718FBF3F0B896AA918700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-16T23:55:24.143' AS DateTime), N'Pubs', N'1003')
INSERT [dbo].[TitleAuthors_Link] ([TitleAuthor_HSK], [titles_HSK], [Author_HSK], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0x7C3D705FEB79C017597794656609EA9D, 0x59106B1F491ECD2017BEEED8A4D070BF00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0x09E29B4584C902854A920BF2EF18FDB200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-16T23:55:24.143' AS DateTime), N'Pubs', N'1003')
INSERT [dbo].[TitleAuthors_Link] ([TitleAuthor_HSK], [titles_HSK], [Author_HSK], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0x7C705D1EAC84EEE121E8357CC3188AB0, 0xC56AC57A93F373750D1C36D44FA07D8F00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0x73706F147720ADA6C6504B637858E22600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-16T23:55:24.143' AS DateTime), N'Pubs', N'1003')
INSERT [dbo].[TitleAuthors_Link] ([TitleAuthor_HSK], [titles_HSK], [Author_HSK], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0x7CBFB624B8364BE4C1BFBCC96E43C304, 0x1AABCE7F272EA0D999265C7AD5BDF53C00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0x36B9295607CDCB120EE40F39C6DF45A100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-16T23:55:24.143' AS DateTime), N'Pubs', N'1003')
INSERT [dbo].[TitleAuthors_Link] ([TitleAuthor_HSK], [titles_HSK], [Author_HSK], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0x810D8859F1CD4F2393D91D2C2A14C0ED, 0x2BF44DF35739F5A5B5B257029DF1F50700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0x851618951AC154307F7FCA30661E885200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-16T23:55:24.143' AS DateTime), N'Pubs', N'1003')
INSERT [dbo].[TitleAuthors_Link] ([TitleAuthor_HSK], [titles_HSK], [Author_HSK], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0x97255AA3659BC11B953BCA20CE2649B0, 0xBD47B9EC1F45570C5C7B01F0C968B6B500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0x3F7B25C3C2CDA4EFD412B87DE8E4242C00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-16T23:55:24.143' AS DateTime), N'Pubs', N'1003')
INSERT [dbo].[TitleAuthors_Link] ([TitleAuthor_HSK], [titles_HSK], [Author_HSK], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0xA0AE7F96EBAEF42A3483045C59A38BC8, 0x59106B1F491ECD2017BEEED8A4D070BF00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0x1510403E23A69CF50BF1C28E47DCD1E000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-16T23:55:24.143' AS DateTime), N'Pubs', N'1003')
INSERT [dbo].[TitleAuthors_Link] ([TitleAuthor_HSK], [titles_HSK], [Author_HSK], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0xA3DC47D0C07B3905A2C302E497E73A53, 0xD5210F873D0AFE85C032B8387D52258600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0x1510403E23A69CF50BF1C28E47DCD1E000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-16T23:55:24.143' AS DateTime), N'Pubs', N'1003')
INSERT [dbo].[TitleAuthors_Link] ([TitleAuthor_HSK], [titles_HSK], [Author_HSK], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0xA4606C40182AFD954B0A0749CC203E41, 0x356EA815E5D65D06D0E52F57887CFCDC00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0xC581BE69DCD9457AE9724C654016923300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-16T23:55:24.143' AS DateTime), N'Pubs', N'1003')
INSERT [dbo].[TitleAuthors_Link] ([TitleAuthor_HSK], [titles_HSK], [Author_HSK], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0xA92450C6F1ACD7DEDA9DA85CC351A4C0, 0x5CA09E09F70BA65FBA0560335FCDDC4600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0xE276EB753BAC82A5F19D065E2CEF488B00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-16T23:55:24.143' AS DateTime), N'Pubs', N'1003')
INSERT [dbo].[TitleAuthors_Link] ([TitleAuthor_HSK], [titles_HSK], [Author_HSK], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0xBF46180F13B97E9A1C0693FCA145F809, 0x5CA09E09F70BA65FBA0560335FCDDC4600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0x516418EC8F01C02E09CF6AEA5889009E00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-16T23:55:24.143' AS DateTime), N'Pubs', N'1003')
INSERT [dbo].[TitleAuthors_Link] ([TitleAuthor_HSK], [titles_HSK], [Author_HSK], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0xC4E6CAF3B7DE834189F7048A9D2EAC14, 0x59236DBDDBE9EB299206C2C13B9EB22D00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0x0ADC2145D77C0E766611B0083423143900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-16T23:55:24.143' AS DateTime), N'Pubs', N'1003')
INSERT [dbo].[TitleAuthors_Link] ([TitleAuthor_HSK], [titles_HSK], [Author_HSK], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0xC88749F91A7F480AA823D71A0721C434, 0xDF00E80E9F87BF0854FE22CBC345E53500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0x94DE798E6797D0B7B0FC143D170ADB0200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-16T23:55:24.143' AS DateTime), N'Pubs', N'1003')
INSERT [dbo].[TitleAuthors_Link] ([TitleAuthor_HSK], [titles_HSK], [Author_HSK], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0xEC78DA52EF118B42C8158FB59F932152, 0x2BF44DF35739F5A5B5B257029DF1F50700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0xECF4803005BBAF6E00E9B966820E9F7C00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-16T23:55:24.143' AS DateTime), N'Pubs', N'1003')
INSERT [dbo].[TitleAuthors_Link] ([TitleAuthor_HSK], [titles_HSK], [Author_HSK], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0xEE5894E29B3374E5B4F196F1E75D7943, 0x59236DBDDBE9EB299206C2C13B9EB22D00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0xA35BFDD11989C282161A6FCECBD391F400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-16T23:55:24.143' AS DateTime), N'Pubs', N'1003')
INSERT [dbo].[TitleAuthors_Link] ([TitleAuthor_HSK], [titles_HSK], [Author_HSK], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0xF33AB4BCE61E40F1C72460A9E1598025, 0x1114709248632028619411BD94E5663E00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0x26BCE8956F85C718FBF3F0B896AA918700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-16T23:55:24.143' AS DateTime), N'Pubs', N'1003')
INSERT [dbo].[TitleAuthors_Link] ([TitleAuthor_HSK], [titles_HSK], [Author_HSK], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0xF5DB4CED4A2E3C5BB1A95B5C131221CB, 0xD39049A7C4AEB4342A7D27EFE1BDC56900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0x0F651D26FEB2BA958384B3D55E2256C400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, CAST(N'2024-06-16T23:55:24.143' AS DateTime), N'Pubs', N'1003')
GO
INSERT [dbo].[TitleAuthors_Sat] ([TitleAuthor_HSK], [StartDateTime], [EndDateTime], [au_ord], [royaltyper], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0x1D1F2B84EAF17820301C1CBAEF72D423, CAST(N'2024-06-17T00:00:25.717' AS DateTime), NULL, 1, 100, CAST(N'2024-06-17T00:00:25.717' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[TitleAuthors_Sat] ([TitleAuthor_HSK], [StartDateTime], [EndDateTime], [au_ord], [royaltyper], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0x1F1C15AFDAA94FB41CE6FC98B06200CC, CAST(N'2024-06-17T00:00:25.717' AS DateTime), NULL, 2, 30, CAST(N'2024-06-17T00:00:25.717' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[TitleAuthors_Sat] ([TitleAuthor_HSK], [StartDateTime], [EndDateTime], [au_ord], [royaltyper], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0x2C8675A658DD3976664F1270FD301C9A, CAST(N'2024-06-17T00:00:25.717' AS DateTime), NULL, 2, 50, CAST(N'2024-06-17T00:00:25.717' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[TitleAuthors_Sat] ([TitleAuthor_HSK], [StartDateTime], [EndDateTime], [au_ord], [royaltyper], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0x3431C747C153142B9085BD7E43C85BBF, CAST(N'2024-06-17T00:00:25.717' AS DateTime), NULL, 1, 60, CAST(N'2024-06-17T00:00:25.717' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[TitleAuthors_Sat] ([TitleAuthor_HSK], [StartDateTime], [EndDateTime], [au_ord], [royaltyper], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0x3D2E62DD031CAFDBF3D7A4D4B2C51B48, CAST(N'2024-06-17T00:00:25.717' AS DateTime), NULL, 1, 50, CAST(N'2024-06-17T00:00:25.717' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[TitleAuthors_Sat] ([TitleAuthor_HSK], [StartDateTime], [EndDateTime], [au_ord], [royaltyper], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0x5B1ABDCD044E160CFAAD6D88239FE531, CAST(N'2024-06-17T00:00:25.717' AS DateTime), NULL, 1, 100, CAST(N'2024-06-17T00:00:25.717' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[TitleAuthors_Sat] ([TitleAuthor_HSK], [StartDateTime], [EndDateTime], [au_ord], [royaltyper], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0x5CAC56CD5CB15CDFC3007EAB3838B9F8, CAST(N'2024-06-17T00:00:25.717' AS DateTime), NULL, 1, 100, CAST(N'2024-06-17T00:00:25.717' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[TitleAuthors_Sat] ([TitleAuthor_HSK], [StartDateTime], [EndDateTime], [au_ord], [royaltyper], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0x63E5084E5451F8AC90EB79F8F85936C4, CAST(N'2024-06-17T00:00:25.717' AS DateTime), NULL, 1, 50, CAST(N'2024-06-17T00:00:25.717' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[TitleAuthors_Sat] ([TitleAuthor_HSK], [StartDateTime], [EndDateTime], [au_ord], [royaltyper], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0x702AE5C80ABCBAB05587174B44185D65, CAST(N'2024-06-17T00:00:25.717' AS DateTime), NULL, 1, 100, CAST(N'2024-06-17T00:00:25.717' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[TitleAuthors_Sat] ([TitleAuthor_HSK], [StartDateTime], [EndDateTime], [au_ord], [royaltyper], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0x7C3D705FEB79C017597794656609EA9D, CAST(N'2024-06-17T00:00:25.717' AS DateTime), NULL, 1, 60, CAST(N'2024-06-17T00:00:25.717' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[TitleAuthors_Sat] ([TitleAuthor_HSK], [StartDateTime], [EndDateTime], [au_ord], [royaltyper], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0x7C705D1EAC84EEE121E8357CC3188AB0, CAST(N'2024-06-17T00:00:25.717' AS DateTime), NULL, 1, 100, CAST(N'2024-06-17T00:00:25.717' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[TitleAuthors_Sat] ([TitleAuthor_HSK], [StartDateTime], [EndDateTime], [au_ord], [royaltyper], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0x7CBFB624B8364BE4C1BFBCC96E43C304, CAST(N'2024-06-17T00:00:25.717' AS DateTime), NULL, 2, 50, CAST(N'2024-06-17T00:00:25.717' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[TitleAuthors_Sat] ([TitleAuthor_HSK], [StartDateTime], [EndDateTime], [au_ord], [royaltyper], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0x810D8859F1CD4F2393D91D2C2A14C0ED, CAST(N'2024-06-17T00:00:25.717' AS DateTime), NULL, 1, 75, CAST(N'2024-06-17T00:00:25.717' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[TitleAuthors_Sat] ([TitleAuthor_HSK], [StartDateTime], [EndDateTime], [au_ord], [royaltyper], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0x97255AA3659BC11B953BCA20CE2649B0, CAST(N'2024-06-17T00:00:25.717' AS DateTime), NULL, 1, 100, CAST(N'2024-06-17T00:00:25.717' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[TitleAuthors_Sat] ([TitleAuthor_HSK], [StartDateTime], [EndDateTime], [au_ord], [royaltyper], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0xA0AE7F96EBAEF42A3483045C59A38BC8, CAST(N'2024-06-17T00:00:25.717' AS DateTime), NULL, 2, 40, CAST(N'2024-06-17T00:00:25.717' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[TitleAuthors_Sat] ([TitleAuthor_HSK], [StartDateTime], [EndDateTime], [au_ord], [royaltyper], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0xA3DC47D0C07B3905A2C302E497E73A53, CAST(N'2024-06-17T00:00:25.717' AS DateTime), NULL, 1, 100, CAST(N'2024-06-17T00:00:25.717' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[TitleAuthors_Sat] ([TitleAuthor_HSK], [StartDateTime], [EndDateTime], [au_ord], [royaltyper], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0xA4606C40182AFD954B0A0749CC203E41, CAST(N'2024-06-17T00:00:25.717' AS DateTime), NULL, 1, 100, CAST(N'2024-06-17T00:00:25.717' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[TitleAuthors_Sat] ([TitleAuthor_HSK], [StartDateTime], [EndDateTime], [au_ord], [royaltyper], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0xA92450C6F1ACD7DEDA9DA85CC351A4C0, CAST(N'2024-06-17T00:00:25.717' AS DateTime), NULL, 1, 40, CAST(N'2024-06-17T00:00:25.717' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[TitleAuthors_Sat] ([TitleAuthor_HSK], [StartDateTime], [EndDateTime], [au_ord], [royaltyper], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0xBF46180F13B97E9A1C0693FCA145F809, CAST(N'2024-06-17T00:00:25.717' AS DateTime), NULL, 3, 30, CAST(N'2024-06-17T00:00:25.717' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[TitleAuthors_Sat] ([TitleAuthor_HSK], [StartDateTime], [EndDateTime], [au_ord], [royaltyper], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0xC4E6CAF3B7DE834189F7048A9D2EAC14, CAST(N'2024-06-17T00:00:25.717' AS DateTime), NULL, 2, 25, CAST(N'2024-06-17T00:00:25.717' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[TitleAuthors_Sat] ([TitleAuthor_HSK], [StartDateTime], [EndDateTime], [au_ord], [royaltyper], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0xC88749F91A7F480AA823D71A0721C434, CAST(N'2024-06-17T00:00:25.717' AS DateTime), NULL, 2, 40, CAST(N'2024-06-17T00:00:25.717' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[TitleAuthors_Sat] ([TitleAuthor_HSK], [StartDateTime], [EndDateTime], [au_ord], [royaltyper], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0xEC78DA52EF118B42C8158FB59F932152, CAST(N'2024-06-17T00:00:25.717' AS DateTime), NULL, 2, 25, CAST(N'2024-06-17T00:00:25.717' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[TitleAuthors_Sat] ([TitleAuthor_HSK], [StartDateTime], [EndDateTime], [au_ord], [royaltyper], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0xEE5894E29B3374E5B4F196F1E75D7943, CAST(N'2024-06-17T00:00:25.717' AS DateTime), NULL, 1, 75, CAST(N'2024-06-17T00:00:25.717' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[TitleAuthors_Sat] ([TitleAuthor_HSK], [StartDateTime], [EndDateTime], [au_ord], [royaltyper], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0xF33AB4BCE61E40F1C72460A9E1598025, CAST(N'2024-06-17T00:00:25.717' AS DateTime), NULL, 1, 100, CAST(N'2024-06-17T00:00:25.717' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[TitleAuthors_Sat] ([TitleAuthor_HSK], [StartDateTime], [EndDateTime], [au_ord], [royaltyper], [LoadDateTime], [SourceSystem], [LoadProcessID]) VALUES (0xF5DB4CED4A2E3C5BB1A95B5C131221CB, CAST(N'2024-06-17T00:00:25.717' AS DateTime), NULL, 1, 100, CAST(N'2024-06-17T00:00:25.717' AS DateTime), N'Pubs', N'1002')
GO
INSERT [dbo].[Titles_Hub] ([titles_HSK], [titles_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x0F7FB6E8C1EDF6D0CBCDBABC051E322F, N'PS7777', CAST(N'2024-06-11T22:45:17.677' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Titles_Hub] ([titles_HSK], [titles_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x1114709248632028619411BD94E5663E, N'PC9999', CAST(N'2024-06-11T22:45:17.677' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Titles_Hub] ([titles_HSK], [titles_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x1AABCE7F272EA0D999265C7AD5BDF53C, N'PC8888', CAST(N'2024-06-11T22:45:17.677' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Titles_Hub] ([titles_HSK], [titles_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x2BF44DF35739F5A5B5B257029DF1F507, N'PS1372', CAST(N'2024-06-11T22:45:17.677' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Titles_Hub] ([titles_HSK], [titles_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x356EA815E5D65D06D0E52F57887CFCDC, N'MC2222', CAST(N'2024-06-11T22:45:17.677' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Titles_Hub] ([titles_HSK], [titles_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x3CF5B67727C17F7A97C7EF9A92FF919E, N'PS2091', CAST(N'2024-06-11T22:45:17.677' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Titles_Hub] ([titles_HSK], [titles_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x59106B1F491ECD2017BEEED8A4D070BF, N'BU1032', CAST(N'2024-06-11T22:45:17.677' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Titles_Hub] ([titles_HSK], [titles_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x59236DBDDBE9EB299206C2C13B9EB22D, N'MC3021', CAST(N'2024-06-11T22:45:17.677' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Titles_Hub] ([titles_HSK], [titles_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x5CA09E09F70BA65FBA0560335FCDDC46, N'TC7777', CAST(N'2024-06-11T22:45:17.677' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Titles_Hub] ([titles_HSK], [titles_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x7984F5BB4DE8A182043ACA923EA390D3, N'PS3333', CAST(N'2024-06-11T22:45:17.677' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Titles_Hub] ([titles_HSK], [titles_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x9D5DEA19D7C42E88C3466BBBE2163CD3, N'MC3026', CAST(N'2024-06-11T22:45:17.677' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Titles_Hub] ([titles_HSK], [titles_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xA14A72165DC5BDAFBF36936C9276A4A7, N'TC3218', CAST(N'2024-06-11T22:45:17.677' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Titles_Hub] ([titles_HSK], [titles_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xBD47B9EC1F45570C5C7B01F0C968B6B5, N'BU7832', CAST(N'2024-06-11T22:45:17.677' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Titles_Hub] ([titles_HSK], [titles_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xC56AC57A93F373750D1C36D44FA07D8F, N'TC4203', CAST(N'2024-06-11T22:45:17.677' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Titles_Hub] ([titles_HSK], [titles_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xD39049A7C4AEB4342A7D27EFE1BDC569, N'PC1035', CAST(N'2024-06-11T22:45:17.677' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Titles_Hub] ([titles_HSK], [titles_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xD5210F873D0AFE85C032B8387D522586, N'BU2075', CAST(N'2024-06-11T22:45:17.677' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Titles_Hub] ([titles_HSK], [titles_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xDF00E80E9F87BF0854FE22CBC345E535, N'BU1111', CAST(N'2024-06-11T22:45:17.677' AS DateTime), N'Pubs', N'1001')
INSERT [dbo].[Titles_Hub] ([titles_HSK], [titles_BK], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xFAFCB0CEDAE52893C50B66EBEFA26F84, N'PS2106', CAST(N'2024-06-11T22:45:17.677' AS DateTime), N'Pubs', N'1001')
GO
INSERT [dbo].[Titles_Sat] ([titles_HSK], [StartDateTime], [EndDateTime], [title], [type], [pub_id], [price], [advance], [royalty], [ytd_sales], [notes], [pubdate], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x0F7FB6E8C1EDF6D0CBCDBABC051E322F, CAST(N'2024-06-11T23:43:21.197' AS DateTime), NULL, N'Emotional Security: A New Algorithm', N'psychology  ', N'0736', 7.9900, 4000.0000, 10, 3336, N'Protecting yourself and your loved ones from undue emotional stress in the modern world. Use of computer and nutritional aids emphasized.', CAST(N'1991-06-12T00:00:00.000' AS DateTime), CAST(N'2024-06-11T23:43:21.197' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Titles_Sat] ([titles_HSK], [StartDateTime], [EndDateTime], [title], [type], [pub_id], [price], [advance], [royalty], [ytd_sales], [notes], [pubdate], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x1114709248632028619411BD94E5663E, CAST(N'2024-06-11T23:43:21.197' AS DateTime), NULL, N'Net Etiquette', N'popular_comp', N'1389', NULL, NULL, NULL, NULL, N'A must-read for computer conferencing.', CAST(N'2024-02-04T00:36:23.907' AS DateTime), CAST(N'2024-06-11T23:43:21.197' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Titles_Sat] ([titles_HSK], [StartDateTime], [EndDateTime], [title], [type], [pub_id], [price], [advance], [royalty], [ytd_sales], [notes], [pubdate], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x1AABCE7F272EA0D999265C7AD5BDF53C, CAST(N'2024-06-11T23:43:21.197' AS DateTime), NULL, N'Secrets of Silicon Valley', N'popular_comp', N'1389', 20.0000, 8000.0000, 10, 4095, N'Muckraking reporting on the world''s largest computer hardware and software manufacturers.', CAST(N'1994-06-12T00:00:00.000' AS DateTime), CAST(N'2024-06-11T23:43:21.197' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Titles_Sat] ([titles_HSK], [StartDateTime], [EndDateTime], [title], [type], [pub_id], [price], [advance], [royalty], [ytd_sales], [notes], [pubdate], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x2BF44DF35739F5A5B5B257029DF1F507, CAST(N'2024-06-11T23:43:21.197' AS DateTime), NULL, N'Computer Phobic AND Non-Phobic Individuals: Behavior Variations', N'psychology  ', N'0877', 21.5900, 7000.0000, 10, 375, N'A must for the specialist, this book examines the difference between those who hate and fear computers and those who don''t.', CAST(N'1991-10-21T00:00:00.000' AS DateTime), CAST(N'2024-06-11T23:43:21.197' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Titles_Sat] ([titles_HSK], [StartDateTime], [EndDateTime], [title], [type], [pub_id], [price], [advance], [royalty], [ytd_sales], [notes], [pubdate], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x356EA815E5D65D06D0E52F57887CFCDC, CAST(N'2024-06-11T23:43:21.197' AS DateTime), NULL, N'Silicon Valley Gastronomic Treats', N'mod_cook    ', N'0877', 19.9900, 0.0000, 12, 2032, N'Favorite recipes for quick, easy, and elegant meals.', CAST(N'1991-06-09T00:00:00.000' AS DateTime), CAST(N'2024-06-11T23:43:21.197' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Titles_Sat] ([titles_HSK], [StartDateTime], [EndDateTime], [title], [type], [pub_id], [price], [advance], [royalty], [ytd_sales], [notes], [pubdate], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x3CF5B67727C17F7A97C7EF9A92FF919E, CAST(N'2024-06-11T23:43:21.197' AS DateTime), NULL, N'Is Anger the Enemy?', N'psychology  ', N'0736', 10.9500, 2275.0000, 12, 2045, N'Carefully researched study of the effects of strong emotions on the body. Metabolic charts included.', CAST(N'1991-06-15T00:00:00.000' AS DateTime), CAST(N'2024-06-11T23:43:21.197' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Titles_Sat] ([titles_HSK], [StartDateTime], [EndDateTime], [title], [type], [pub_id], [price], [advance], [royalty], [ytd_sales], [notes], [pubdate], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x59106B1F491ECD2017BEEED8A4D070BF, CAST(N'2024-06-11T23:43:21.197' AS DateTime), NULL, N'The Busy Executive''s Database Guide', N'business    ', N'1389', 19.9900, 5000.0000, 10, 4095, N'An overview of available database systems with emphasis on common business applications. Illustrated.', CAST(N'1991-06-12T00:00:00.000' AS DateTime), CAST(N'2024-06-11T23:43:21.197' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Titles_Sat] ([titles_HSK], [StartDateTime], [EndDateTime], [title], [type], [pub_id], [price], [advance], [royalty], [ytd_sales], [notes], [pubdate], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x59236DBDDBE9EB299206C2C13B9EB22D, CAST(N'2024-06-11T23:43:21.197' AS DateTime), NULL, N'The Gourmet Microwave', N'mod_cook    ', N'0877', 2.9900, 15000.0000, 24, 22246, N'Traditional French gourmet recipes adapted for modern microwave cooking.', CAST(N'1991-06-18T00:00:00.000' AS DateTime), CAST(N'2024-06-11T23:43:21.197' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Titles_Sat] ([titles_HSK], [StartDateTime], [EndDateTime], [title], [type], [pub_id], [price], [advance], [royalty], [ytd_sales], [notes], [pubdate], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x5CA09E09F70BA65FBA0560335FCDDC46, CAST(N'2024-06-11T23:43:21.197' AS DateTime), NULL, N'Sushi, Anyone?', N'trad_cook   ', N'0877', 14.9900, 8000.0000, 10, 4095, N'Detailed instructions on how to make authentic Japanese sushi in your spare time.', CAST(N'1991-06-12T00:00:00.000' AS DateTime), CAST(N'2024-06-11T23:43:21.197' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Titles_Sat] ([titles_HSK], [StartDateTime], [EndDateTime], [title], [type], [pub_id], [price], [advance], [royalty], [ytd_sales], [notes], [pubdate], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x7984F5BB4DE8A182043ACA923EA390D3, CAST(N'2024-06-11T23:43:21.197' AS DateTime), NULL, N'Prolonged Data Deprivation: Four Case Studies', N'psychology  ', N'0736', 19.9900, 2000.0000, 10, 4072, N'What happens when the data runs dry?  Searching evaluations of information-shortage effects.', CAST(N'1991-06-12T00:00:00.000' AS DateTime), CAST(N'2024-06-11T23:43:21.197' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Titles_Sat] ([titles_HSK], [StartDateTime], [EndDateTime], [title], [type], [pub_id], [price], [advance], [royalty], [ytd_sales], [notes], [pubdate], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0x9D5DEA19D7C42E88C3466BBBE2163CD3, CAST(N'2024-06-11T23:43:21.197' AS DateTime), NULL, N'The Psychology of Computer Cooking', N'UNDECIDED   ', N'0877', NULL, NULL, NULL, NULL, NULL, CAST(N'2024-02-04T00:36:23.907' AS DateTime), CAST(N'2024-06-11T23:43:21.197' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Titles_Sat] ([titles_HSK], [StartDateTime], [EndDateTime], [title], [type], [pub_id], [price], [advance], [royalty], [ytd_sales], [notes], [pubdate], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xA14A72165DC5BDAFBF36936C9276A4A7, CAST(N'2024-06-11T23:43:21.197' AS DateTime), NULL, N'Onions, Leeks, and Garlic: Cooking Secrets of the Mediterranean', N'trad_cook   ', N'0877', 20.9500, 7000.0000, 10, 375, N'Profusely illustrated in color, this makes a wonderful gift book for a cuisine-oriented friend.', CAST(N'1991-10-21T00:00:00.000' AS DateTime), CAST(N'2024-06-11T23:43:21.197' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Titles_Sat] ([titles_HSK], [StartDateTime], [EndDateTime], [title], [type], [pub_id], [price], [advance], [royalty], [ytd_sales], [notes], [pubdate], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xBD47B9EC1F45570C5C7B01F0C968B6B5, CAST(N'2024-06-11T23:43:21.197' AS DateTime), NULL, N'Straight Talk About Computers', N'business    ', N'1389', 19.9900, 5000.0000, 10, 4095, N'Annotated analysis of what computers can do for you: a no-hype guide for the critical user.', CAST(N'1991-06-22T00:00:00.000' AS DateTime), CAST(N'2024-06-11T23:43:21.197' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Titles_Sat] ([titles_HSK], [StartDateTime], [EndDateTime], [title], [type], [pub_id], [price], [advance], [royalty], [ytd_sales], [notes], [pubdate], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xC56AC57A93F373750D1C36D44FA07D8F, CAST(N'2024-06-11T23:43:21.197' AS DateTime), NULL, N'Fifty Years in Buckingham Palace Kitchens', N'trad_cook   ', N'0877', 11.9500, 4000.0000, 14, 15096, N'More anecdotes from the Queen''s favorite cook describing life among English royalty. Recipes, techniques, tender vignettes.', CAST(N'1991-06-12T00:00:00.000' AS DateTime), CAST(N'2024-06-11T23:43:21.197' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Titles_Sat] ([titles_HSK], [StartDateTime], [EndDateTime], [title], [type], [pub_id], [price], [advance], [royalty], [ytd_sales], [notes], [pubdate], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xD39049A7C4AEB4342A7D27EFE1BDC569, CAST(N'2024-06-11T23:43:21.197' AS DateTime), NULL, N'But Is It User Friendly?', N'popular_comp', N'1389', 22.9500, 7000.0000, 16, 8780, N'A survey of software for the naive user, focusing on the ''friendliness'' of each.', CAST(N'1991-06-30T00:00:00.000' AS DateTime), CAST(N'2024-06-11T23:43:21.197' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Titles_Sat] ([titles_HSK], [StartDateTime], [EndDateTime], [title], [type], [pub_id], [price], [advance], [royalty], [ytd_sales], [notes], [pubdate], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xD5210F873D0AFE85C032B8387D522586, CAST(N'2024-06-11T23:43:21.197' AS DateTime), NULL, N'You Can Combat Computer Stress!', N'business    ', N'0736', 2.9900, 10125.0000, 24, 18722, N'The latest medical and psychological techniques for living with the electronic office. Easy-to-understand explanations.', CAST(N'1991-06-30T00:00:00.000' AS DateTime), CAST(N'2024-06-11T23:43:21.197' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Titles_Sat] ([titles_HSK], [StartDateTime], [EndDateTime], [title], [type], [pub_id], [price], [advance], [royalty], [ytd_sales], [notes], [pubdate], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xDF00E80E9F87BF0854FE22CBC345E535, CAST(N'2024-06-11T23:43:21.197' AS DateTime), NULL, N'Cooking with Computers: Surreptitious Balance Sheets', N'business    ', N'1389', 11.9500, 5000.0000, 10, 3876, N'Helpful hints on how to use your electronic resources to the best advantage.', CAST(N'1991-06-09T00:00:00.000' AS DateTime), CAST(N'2024-06-11T23:43:21.197' AS DateTime), N'Pubs', N'1002')
INSERT [dbo].[Titles_Sat] ([titles_HSK], [StartDateTime], [EndDateTime], [title], [type], [pub_id], [price], [advance], [royalty], [ytd_sales], [notes], [pubdate], [LoadDateTime], [sourceSystem], [LoadProcessID]) VALUES (0xFAFCB0CEDAE52893C50B66EBEFA26F84, CAST(N'2024-06-11T23:43:21.197' AS DateTime), NULL, N'Life Without Fear', N'psychology  ', N'0736', 7.0000, 6000.0000, 10, 111, N'New exercise, meditation, and nutritional techniques that can reduce the shock of daily interactions. Popular audience. Sample menus included, exercise video available separately.', CAST(N'1991-10-05T00:00:00.000' AS DateTime), CAST(N'2024-06-11T23:43:21.197' AS DateTime), N'Pubs', N'1002')
GO
ALTER TABLE [dbo].[Employee_Sat]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Sat_Employee_Hub] FOREIGN KEY([Employee_HSK])
REFERENCES [dbo].[Employee_Hub] ([Employee_HSK])
GO
ALTER TABLE [dbo].[Employee_Sat] CHECK CONSTRAINT [FK_Employee_Sat_Employee_Hub]
GO
ALTER TABLE [dbo].[Jobs_Sat]  WITH CHECK ADD  CONSTRAINT [FK_Jobs_Sat_Jobs_Hub] FOREIGN KEY([Job_HSK])
REFERENCES [dbo].[Jobs_Hub] ([Job_HSK])
GO
ALTER TABLE [dbo].[Jobs_Sat] CHECK CONSTRAINT [FK_Jobs_Sat_Jobs_Hub]
GO
ALTER TABLE [dbo].[Publishers_Sat]  WITH CHECK ADD  CONSTRAINT [FK_Publishers_Sat_Publishers_Hub] FOREIGN KEY([publishers_HSK])
REFERENCES [dbo].[Publishers_Hub] ([publishers_HSK])
GO
ALTER TABLE [dbo].[Publishers_Sat] CHECK CONSTRAINT [FK_Publishers_Sat_Publishers_Hub]
GO
ALTER TABLE [dbo].[Sale_Link]  WITH CHECK ADD  CONSTRAINT [FK_Sale_Link_Sale_Sat] FOREIGN KEY([Sale_HSK])
REFERENCES [dbo].[Sale_Sat] ([Sale_HSK])
GO
ALTER TABLE [dbo].[Sale_Link] CHECK CONSTRAINT [FK_Sale_Link_Sale_Sat]
GO
ALTER TABLE [dbo].[Sale_Link]  WITH CHECK ADD  CONSTRAINT [FK_Sale_Link_Titles_Hub] FOREIGN KEY([titles_HSK])
REFERENCES [dbo].[Titles_Hub] ([titles_HSK])
GO
ALTER TABLE [dbo].[Sale_Link] CHECK CONSTRAINT [FK_Sale_Link_Titles_Hub]
GO
ALTER TABLE [dbo].[Stores_Sat]  WITH CHECK ADD  CONSTRAINT [FK_Stores_Sat_Stores_Hub] FOREIGN KEY([stores_HSK])
REFERENCES [dbo].[Stores_Hub] ([stores_HSK])
GO
ALTER TABLE [dbo].[Stores_Sat] CHECK CONSTRAINT [FK_Stores_Sat_Stores_Hub]
GO
ALTER TABLE [dbo].[TitleAuthors_Link]  WITH CHECK ADD  CONSTRAINT [FK_TitleAuthors_Link_Titles_Hub] FOREIGN KEY([titles_HSK])
REFERENCES [dbo].[Titles_Hub] ([titles_HSK])
GO
ALTER TABLE [dbo].[TitleAuthors_Link] CHECK CONSTRAINT [FK_TitleAuthors_Link_Titles_Hub]
GO
ALTER TABLE [dbo].[TitleAuthors_Sat]  WITH CHECK ADD  CONSTRAINT [FK_TitleAuthors_Sat_TitleAuthors_Link] FOREIGN KEY([TitleAuthor_HSK])
REFERENCES [dbo].[TitleAuthors_Link] ([TitleAuthor_HSK])
GO
ALTER TABLE [dbo].[TitleAuthors_Sat] CHECK CONSTRAINT [FK_TitleAuthors_Sat_TitleAuthors_Link]
GO
ALTER TABLE [dbo].[Titles_Sat]  WITH CHECK ADD  CONSTRAINT [FK_Titles_Sat_Titles_Hub] FOREIGN KEY([titles_HSK])
REFERENCES [dbo].[Titles_Hub] ([titles_HSK])
GO
ALTER TABLE [dbo].[Titles_Sat] CHECK CONSTRAINT [FK_Titles_Sat_Titles_Hub]
GO
USE [master]
GO
ALTER DATABASE [Pubs_DV] SET  READ_WRITE 
GO
