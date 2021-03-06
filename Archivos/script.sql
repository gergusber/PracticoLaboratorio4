USE [master]
GO
/****** Object:  Database [PracticoBerteaQuiroga]    Script Date: 11/09/2014 19:53:15 ******/
CREATE DATABASE [PracticoBerteaQuiroga] ON  PRIMARY 
( NAME = N'PracticoBerteaQuiroga', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\PracticoBerteaQuiroga.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PracticoBerteaQuiroga_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\PracticoBerteaQuiroga_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PracticoBerteaQuiroga] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PracticoBerteaQuiroga].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PracticoBerteaQuiroga] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [PracticoBerteaQuiroga] SET ANSI_NULLS OFF
GO
ALTER DATABASE [PracticoBerteaQuiroga] SET ANSI_PADDING OFF
GO
ALTER DATABASE [PracticoBerteaQuiroga] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [PracticoBerteaQuiroga] SET ARITHABORT OFF
GO
ALTER DATABASE [PracticoBerteaQuiroga] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [PracticoBerteaQuiroga] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [PracticoBerteaQuiroga] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [PracticoBerteaQuiroga] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [PracticoBerteaQuiroga] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [PracticoBerteaQuiroga] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [PracticoBerteaQuiroga] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [PracticoBerteaQuiroga] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [PracticoBerteaQuiroga] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [PracticoBerteaQuiroga] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [PracticoBerteaQuiroga] SET  DISABLE_BROKER
GO
ALTER DATABASE [PracticoBerteaQuiroga] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [PracticoBerteaQuiroga] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [PracticoBerteaQuiroga] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [PracticoBerteaQuiroga] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [PracticoBerteaQuiroga] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [PracticoBerteaQuiroga] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [PracticoBerteaQuiroga] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [PracticoBerteaQuiroga] SET  READ_WRITE
GO
ALTER DATABASE [PracticoBerteaQuiroga] SET RECOVERY FULL
GO
ALTER DATABASE [PracticoBerteaQuiroga] SET  MULTI_USER
GO
ALTER DATABASE [PracticoBerteaQuiroga] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [PracticoBerteaQuiroga] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'PracticoBerteaQuiroga', N'ON'
GO
USE [PracticoBerteaQuiroga]
GO
/****** Object:  Table [dbo].[Temporadas]    Script Date: 11/09/2014 19:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Temporadas](
	[idTemporada] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
	[porcentaje] [float] NULL,
 CONSTRAINT [PK_Temporadas] PRIMARY KEY CLUSTERED 
(
	[idTemporada] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Casas]    Script Date: 11/09/2014 19:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Casas](
	[idCasa] [int] IDENTITY(1,1) NOT NULL,
	[cantPersonas] [int] NULL,
	[cantHabitaciones] [int] NULL,
	[cantBanios] [int] NULL,
	[patio] [bit] NULL,
	[cochera] [bit] NULL,
	[superficie] [float] NULL,
	[cantAutos] [int] NULL,
	[valoracion] [int] NULL,
 CONSTRAINT [PK_Casas] PRIMARY KEY CLUSTERED 
(
	[idCasa] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Alquileres]    Script Date: 11/09/2014 19:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alquileres](
	[idAlquiler] [int] IDENTITY(1,1) NOT NULL,
	[idCasa] [int] NOT NULL,
	[idTemporada] [int] NOT NULL,
	[fechaDesde] [smalldatetime] NULL,
	[fechaHasta] [smalldatetime] NULL,
	[cantidadDias] [int] NULL,
	[precioPorDia] [float] NULL,
	[precioReal] [float] NULL,
 CONSTRAINT [PK_Alquileres] PRIMARY KEY CLUSTERED 
(
	[idAlquiler] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Alquileres_Casas]    Script Date: 11/09/2014 19:53:17 ******/
ALTER TABLE [dbo].[Alquileres]  WITH CHECK ADD  CONSTRAINT [FK_Alquileres_Casas] FOREIGN KEY([idCasa])
REFERENCES [dbo].[Casas] ([idCasa])
GO
ALTER TABLE [dbo].[Alquileres] CHECK CONSTRAINT [FK_Alquileres_Casas]
GO
/****** Object:  ForeignKey [FK_Alquileres_Temporadas]    Script Date: 11/09/2014 19:53:17 ******/
ALTER TABLE [dbo].[Alquileres]  WITH CHECK ADD  CONSTRAINT [FK_Alquileres_Temporadas] FOREIGN KEY([idTemporada])
REFERENCES [dbo].[Temporadas] ([idTemporada])
GO
ALTER TABLE [dbo].[Alquileres] CHECK CONSTRAINT [FK_Alquileres_Temporadas]
GO
