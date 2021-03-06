USE [master]
GO
/****** Object:  Database [CorsoEurisMarzio]    Script Date: 01/02/2018 09:47:49 ******/
CREATE DATABASE [CorsoEurisMarzio]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CorsoEurisMarzio', FILENAME = N'c:\_tmp\CorsoEurisMarzio.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CorsoEurisMarzio_log', FILENAME = N'c:\_tmp\CorsoEurisMarzio_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CorsoEurisMarzio] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CorsoEurisMarzio].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CorsoEurisMarzio] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CorsoEurisMarzio] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CorsoEurisMarzio] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CorsoEurisMarzio] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CorsoEurisMarzio] SET ARITHABORT OFF 
GO
ALTER DATABASE [CorsoEurisMarzio] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CorsoEurisMarzio] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CorsoEurisMarzio] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CorsoEurisMarzio] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CorsoEurisMarzio] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CorsoEurisMarzio] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CorsoEurisMarzio] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CorsoEurisMarzio] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CorsoEurisMarzio] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CorsoEurisMarzio] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CorsoEurisMarzio] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CorsoEurisMarzio] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CorsoEurisMarzio] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CorsoEurisMarzio] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CorsoEurisMarzio] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CorsoEurisMarzio] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CorsoEurisMarzio] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CorsoEurisMarzio] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CorsoEurisMarzio] SET  MULTI_USER 
GO
ALTER DATABASE [CorsoEurisMarzio] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CorsoEurisMarzio] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CorsoEurisMarzio] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CorsoEurisMarzio] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [CorsoEurisMarzio]
GO
/****** Object:  User [DanieleC]    Script Date: 01/02/2018 09:47:49 ******/
CREATE USER [DanieleC] FOR LOGIN [DanieleC] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [corso2018]    Script Date: 01/02/2018 09:47:49 ******/
CREATE USER [corso2018] FOR LOGIN [corso2018] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [corso2018]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 01/02/2018 09:47:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[PayCalculatorType] [nvarchar](50) NULL,
	[MonthlySalary] [decimal](18, 2) NULL,
	[HourlySalary] [decimal](18, 2) NULL,
	[CommissionPercentage] [decimal](18, 2) NULL,
	[TotalPay] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Schedulations]    Script Date: 01/02/2018 09:47:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedulations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[WorkedHours] [int] NOT NULL,
 CONSTRAINT [PK_Schedulations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tiles]    Script Date: 01/02/2018 09:47:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tiles](
	[meters] [decimal](18, 2) NOT NULL,
	[pack] [decimal](18, 2) NOT NULL,
	[packPrice] [decimal](18, 2) NOT NULL,
	[customer] [nvarchar](50) NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Tiles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Schedulations]  WITH CHECK ADD  CONSTRAINT [FK_Schedulations_Employees] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Schedulations] CHECK CONSTRAINT [FK_Schedulations_Employees]
GO
USE [master]
GO
ALTER DATABASE [CorsoEurisMarzio] SET  READ_WRITE 
GO
