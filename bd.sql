USE [master]
GO
/****** Object:  Database [Datatable]    Script Date: 28/01/2020 01:49:28 a. m. ******/
CREATE DATABASE [Datatable]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Datatable', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Datatable.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Datatable_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Datatable_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Datatable] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Datatable].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Datatable] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Datatable] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Datatable] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Datatable] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Datatable] SET ARITHABORT OFF 
GO
ALTER DATABASE [Datatable] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Datatable] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Datatable] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Datatable] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Datatable] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Datatable] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Datatable] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Datatable] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Datatable] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Datatable] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Datatable] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Datatable] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Datatable] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Datatable] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Datatable] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Datatable] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Datatable] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Datatable] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Datatable] SET  MULTI_USER 
GO
ALTER DATABASE [Datatable] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Datatable] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Datatable] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Datatable] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Datatable] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Datatable]
GO
/****** Object:  Table [dbo].[persona]    Script Date: 28/01/2020 01:49:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[persona](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[edad] [int] NOT NULL,
 CONSTRAINT [PK_persona] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[persona] ON 

INSERT [dbo].[persona] ([id], [nombre], [edad]) VALUES (1, N'Paco', 10)
INSERT [dbo].[persona] ([id], [nombre], [edad]) VALUES (2, N'Pepe', 20)
INSERT [dbo].[persona] ([id], [nombre], [edad]) VALUES (3, N'Ana', 15)
INSERT [dbo].[persona] ([id], [nombre], [edad]) VALUES (4, N'Pancho', 12)
INSERT [dbo].[persona] ([id], [nombre], [edad]) VALUES (6, N'A', 2)
INSERT [dbo].[persona] ([id], [nombre], [edad]) VALUES (7, N'B', 8)
INSERT [dbo].[persona] ([id], [nombre], [edad]) VALUES (8, N'C', 8)
INSERT [dbo].[persona] ([id], [nombre], [edad]) VALUES (9, N'D', 8)
INSERT [dbo].[persona] ([id], [nombre], [edad]) VALUES (10, N'E', 81)
INSERT [dbo].[persona] ([id], [nombre], [edad]) VALUES (11, N'F', 89)
INSERT [dbo].[persona] ([id], [nombre], [edad]) VALUES (12, N'G', 9)
INSERT [dbo].[persona] ([id], [nombre], [edad]) VALUES (13, N'H', 9)
SET IDENTITY_INSERT [dbo].[persona] OFF
USE [master]
GO
ALTER DATABASE [Datatable] SET  READ_WRITE 
GO
