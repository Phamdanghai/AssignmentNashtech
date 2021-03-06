USE [master]
GO
/****** Object:  Database [Assigment_Nashtech]    Script Date: 6/16/2022 9:11:12 PM ******/
CREATE DATABASE [Assigment_Nashtech]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Assigment_Nashtech', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Assigment_Nashtech.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Assigment_Nashtech_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Assigment_Nashtech_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Assigment_Nashtech] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assigment_Nashtech].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assigment_Nashtech] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Assigment_Nashtech] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Assigment_Nashtech] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Assigment_Nashtech] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Assigment_Nashtech] SET ARITHABORT OFF 
GO
ALTER DATABASE [Assigment_Nashtech] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Assigment_Nashtech] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Assigment_Nashtech] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Assigment_Nashtech] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Assigment_Nashtech] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Assigment_Nashtech] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Assigment_Nashtech] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Assigment_Nashtech] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Assigment_Nashtech] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Assigment_Nashtech] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Assigment_Nashtech] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Assigment_Nashtech] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Assigment_Nashtech] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Assigment_Nashtech] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Assigment_Nashtech] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Assigment_Nashtech] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Assigment_Nashtech] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Assigment_Nashtech] SET RECOVERY FULL 
GO
ALTER DATABASE [Assigment_Nashtech] SET  MULTI_USER 
GO
ALTER DATABASE [Assigment_Nashtech] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Assigment_Nashtech] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Assigment_Nashtech] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Assigment_Nashtech] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Assigment_Nashtech] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Assigment_Nashtech', N'ON'
GO
ALTER DATABASE [Assigment_Nashtech] SET QUERY_STORE = OFF
GO
USE [Assigment_Nashtech]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Assigment_Nashtech]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 6/16/2022 9:11:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[ad_id] [int] IDENTITY(1,1) NOT NULL,
	[ad_name] [nvarchar](50) NOT NULL,
	[ad_phone] [nvarchar](200) NULL,
	[ad_address] [nvarchar](150) NULL,
	[role_id] [int] NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[ad_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/16/2022 9:11:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[category_ID] [int] NOT NULL,
	[category_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[category_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 6/16/2022 9:11:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[fb_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[fb_email] [nvarchar](150) NOT NULL,
	[fb_comment] [nvarchar](150) NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[fb_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 6/16/2022 9:11:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[or_id] [int] NOT NULL,
	[or_fullname] [nvarchar](150) NULL,
	[or_phone] [nvarchar](20) NULL,
	[or_email] [nvarchar](350) NULL,
	[or_address] [nvarchar](250) NULL,
	[or_date] [nchar](10) NULL,
	[or_status] [int] NULL,
	[user_id] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[or_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 6/16/2022 9:11:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ord_id] [int] IDENTITY(1,1) NOT NULL,
	[or_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[price] [int] NOT NULL,
	[amount] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[ord_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 6/16/2022 9:11:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[pro_id] [int] IDENTITY(1,1) NOT NULL,
	[pro_name] [nvarchar](350) NOT NULL,
	[pro_price] [int] NOT NULL,
	[product_Image] [nvarchar](1000) NULL,
	[product_Discreption] [nvarchar](50) NULL,
	[product_Quantity] [int] NOT NULL,
	[categaries_id] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[pro_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/16/2022 9:11:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[role_id] [int] NOT NULL,
	[role_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 6/16/2022 9:11:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [nvarchar](50) NOT NULL,
	[user_password] [nvarchar](150) NOT NULL,
	[user_fullname] [nvarchar](50) NULL,
	[user_email] [nvarchar](150) NULL,
	[user_phone] [nvarchar](50) NULL,
	[user_address] [nvarchar](250) NULL,
	[role_id] [int] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD  CONSTRAINT [FK_Admin_Role] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([role_id])
GO
ALTER TABLE [dbo].[Admin] CHECK CONSTRAINT [FK_Admin_Role]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_User]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([or_id])
REFERENCES [dbo].[Order] ([or_id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([pro_id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Categories] FOREIGN KEY([categaries_id])
REFERENCES [dbo].[Categories] ([category_ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Categories]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([role_id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [Assigment_Nashtech] SET  READ_WRITE 
GO
