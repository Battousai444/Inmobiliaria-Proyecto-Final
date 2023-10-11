USE [master]
GO
/****** Object:  Database [DBInmobiliaria]    Script Date: 03/12/2021 18:02:41 ******/
CREATE DATABASE [DBInmobiliaria]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBInmobiliaria', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.FELIPE\MSSQL\DATA\DBInmobiliaria.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBInmobiliaria_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.FELIPE\MSSQL\DATA\DBInmobiliaria_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DBInmobiliaria] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBInmobiliaria].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBInmobiliaria] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBInmobiliaria] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBInmobiliaria] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBInmobiliaria] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBInmobiliaria] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBInmobiliaria] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBInmobiliaria] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBInmobiliaria] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBInmobiliaria] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBInmobiliaria] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBInmobiliaria] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBInmobiliaria] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBInmobiliaria] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBInmobiliaria] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBInmobiliaria] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBInmobiliaria] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBInmobiliaria] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBInmobiliaria] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBInmobiliaria] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBInmobiliaria] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBInmobiliaria] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBInmobiliaria] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBInmobiliaria] SET RECOVERY FULL 
GO
ALTER DATABASE [DBInmobiliaria] SET  MULTI_USER 
GO
ALTER DATABASE [DBInmobiliaria] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBInmobiliaria] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBInmobiliaria] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBInmobiliaria] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBInmobiliaria] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBInmobiliaria] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBInmobiliaria', N'ON'
GO
ALTER DATABASE [DBInmobiliaria] SET QUERY_STORE = OFF
GO
USE [DBInmobiliaria]
GO
/****** Object:  Table [dbo].[tblTipoTelefono]    Script Date: 03/12/2021 18:02:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTipoTelefono](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[NombreTipoTelefono] [varchar](20) NOT NULL,
	[Activo] [varchar](20) NOT NULL,
 CONSTRAINT [PK_tblTipoTelefono] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCliente]    Script Date: 03/12/2021 18:02:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCliente](
	[Documento] [varchar](20) NOT NULL,
	[PrimerNombre] [varchar](20) NOT NULL,
	[PrimerApellido] [varchar](20) NOT NULL,
	[SegundoApellido] [varchar](20) NULL,
	[Edad] [varchar](20) NOT NULL,
	[Direccion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblCliente] PRIMARY KEY CLUSTERED 
(
	[Documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTelefonoCliente]    Script Date: 03/12/2021 18:02:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTelefonoCliente](
	[CodTelCliente] [int] IDENTITY(1,1) NOT NULL,
	[NumTelCliente] [varchar](50) NOT NULL,
	[DocumentoCliente] [varchar](20) NOT NULL,
	[CodigoTipoTelefono] [int] NOT NULL,
 CONSTRAINT [PK_tblTelefonoCliente] PRIMARY KEY CLUSTERED 
(
	[CodTelCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_1]    Script Date: 03/12/2021 18:02:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT        dbo.tblTelefonoCliente.CodTelCliente AS [CODIGO TELEFONO], dbo.tblTipoTelefono.NombreTipoTelefono AS [NOMBRE TIPO TELEFONO], dbo.tblTipoTelefono.Codigo AS [CODIGO TIPO TELEFONO], 
                         dbo.tblTelefonoCliente.NumTelCliente AS TELEFONO, dbo.tblCliente.Documento AS DOCUMENTO
FROM            dbo.tblCliente CROSS JOIN
                         dbo.tblTelefonoCliente CROSS JOIN
                         dbo.tblTipoTelefono
GO
/****** Object:  Table [dbo].[tblEmpleado]    Script Date: 03/12/2021 18:02:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmpleado](
	[Documento] [varchar](50) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[PrimerApellido] [varchar](50) NOT NULL,
	[SegundoApellido] [varchar](50) NULL,
	[Correo] [varchar](50) NOT NULL,
	[Direccion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblEmpleado] PRIMARY KEY CLUSTERED 
(
	[Documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblResidencias]    Script Date: 03/12/2021 18:02:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblResidencias](
	[codigo_Residencia] [int] IDENTITY(1,1) NOT NULL,
	[Direccion] [varchar](50) NOT NULL,
	[tamaño] [varchar](50) NOT NULL,
	[codUbicacion] [int] NOT NULL,
	[codGarage] [int] NOT NULL,
	[codAmueblado] [int] NOT NULL,
	[codPisina] [int] NOT NULL,
	[codInternet] [int] NOT NULL,
	[codPatio] [int] NOT NULL,
	[codterraza] [int] NOT NULL,
	[codTipoResidencia] [int] NOT NULL,
	[precio] [int] NOT NULL,
	[estado] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblResidencias] PRIMARY KEY CLUSTERED 
(
	[codigo_Residencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_2]    Script Date: 03/12/2021 18:02:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_2]
AS
SELECT        dbo.tblEmpleado.Documento AS [DOCUMENTO EMPLEADO], dbo.tblEmpleado.Nombre
FROM            dbo.tblCliente INNER JOIN
                         dbo.tblEmpleado ON dbo.tblCliente.Documento = dbo.tblEmpleado.Documento CROSS JOIN
                         dbo.tblResidencias
GO
/****** Object:  View [dbo].[View_3]    Script Date: 03/12/2021 18:02:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_3]
AS
SELECT        TOP (100) PERCENT dbo.tblTipoTelefono.Codigo, dbo.tblTelefonoCliente1.CodTelCliente, dbo.tblTelefonoCliente1.NumTelCliente, dbo.tblTelefonoCliente1.DocumentoCliente, dbo.tblTipoTelefono.NombreTipoTelefono
FROM            dbo.tblCliente INNER JOIN
                         dbo.tblTelefonoCliente1 ON dbo.tblCliente.Documento = dbo.tblTelefonoCliente1.DocumentoCliente INNER JOIN
                         dbo.tblTipoTelefono ON dbo.tblTelefonoCliente1.CodigoTipoTelefono = dbo.tblTipoTelefono.Codigo
WHERE        (dbo.tblTelefonoCliente1.DocumentoCliente = 'h')
ORDER BY dbo.tblTipoTelefono.NombreTipoTelefono
GO
/****** Object:  View [dbo].[View_4]    Script Date: 03/12/2021 18:02:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_4]
AS
SELECT        dbo.tblCliente.Documento, dbo.tblTipoTelefono.Codigo
FROM            dbo.tblCliente INNER JOIN
                         dbo.tblTelefonoCliente ON dbo.tblCliente.Documento = dbo.tblTelefonoCliente.DocumentoCliente INNER JOIN
                         dbo.tblTipoTelefono ON dbo.tblTelefonoCliente.CodigoTipoTelefono = dbo.tblTipoTelefono.Codigo
GO
/****** Object:  Table [dbo].[tblAmueblado]    Script Date: 03/12/2021 18:02:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAmueblado](
	[codAmueblado1] [int] IDENTITY(1,1) NOT NULL,
	[Amueblacion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblAmueblado] PRIMARY KEY CLUSTERED 
(
	[codAmueblado1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblGarage]    Script Date: 03/12/2021 18:02:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGarage](
	[codGarage1] [int] IDENTITY(1,1) NOT NULL,
	[EspacioGarage] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblGarage] PRIMARY KEY CLUSTERED 
(
	[codGarage1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblInternet]    Script Date: 03/12/2021 18:02:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblInternet](
	[codInternet1] [int] IDENTITY(1,1) NOT NULL,
	[NombreInternet] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblInternet] PRIMARY KEY CLUSTERED 
(
	[codInternet1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPatio]    Script Date: 03/12/2021 18:02:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPatio](
	[codPatio1] [int] IDENTITY(1,1) NOT NULL,
	[TipoPatio] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblPatio] PRIMARY KEY CLUSTERED 
(
	[codPatio1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPisina]    Script Date: 03/12/2021 18:02:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPisina](
	[codPisina1] [int] IDENTITY(1,1) NOT NULL,
	[tamanoPisina] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblPisina] PRIMARY KEY CLUSTERED 
(
	[codPisina1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTerraza]    Script Date: 03/12/2021 18:02:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTerraza](
	[codTerraza1] [int] IDENTITY(1,1) NOT NULL,
	[TipoTerraza] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblTerraza] PRIMARY KEY CLUSTERED 
(
	[codTerraza1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTipoResidencia]    Script Date: 03/12/2021 18:02:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTipoResidencia](
	[codTipoResidencia1] [int] IDENTITY(1,1) NOT NULL,
	[TipoResidencia] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblTipoResidencia] PRIMARY KEY CLUSTERED 
(
	[codTipoResidencia1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUbicacion]    Script Date: 03/12/2021 18:02:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUbicacion](
	[codUbicacion1] [int] IDENTITY(1,1) NOT NULL,
	[NombreUbicacion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblUbicacion] PRIMARY KEY CLUSTERED 
(
	[codUbicacion1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_7]    Script Date: 03/12/2021 18:02:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_7]
AS
SELECT        TOP (100) PERCENT dbo.tblResidencias.codigo_Residencia AS CODIGO, dbo.tblResidencias.Direccion AS DIRRECCION, dbo.tblResidencias.tamaño AS TAMAÑO, dbo.tblAmueblado.Amueblacion AS AMUEBLADO, 
                         dbo.tblGarage.EspacioGarage AS GARAGE, dbo.tblInternet.NombreInternet AS [COMPAÑIA INTERNET], dbo.tblPatio.TipoPatio AS PATIO, dbo.tblPisina.tamanoPisina AS PISINA, dbo.tblTerraza.TipoTerraza AS TERRAZA, 
                         dbo.tblTipoResidencia.TipoResidencia AS [TIPO DE RESIDENCIA], dbo.tblUbicacion.NombreUbicacion AS UBICACION, dbo.tblResidencias.precio AS PRECIO
FROM            dbo.tblAmueblado INNER JOIN
                         dbo.tblResidencias ON dbo.tblAmueblado.codAmueblado1 = dbo.tblResidencias.codAmueblado INNER JOIN
                         dbo.tblGarage ON dbo.tblResidencias.codGarage = dbo.tblGarage.codGarage1 INNER JOIN
                         dbo.tblInternet ON dbo.tblResidencias.codInternet = dbo.tblInternet.codInternet1 INNER JOIN
                         dbo.tblPatio ON dbo.tblResidencias.codPatio = dbo.tblPatio.codPatio1 INNER JOIN
                         dbo.tblPisina ON dbo.tblResidencias.codPisina = dbo.tblPisina.codPisina1 INNER JOIN
                         dbo.tblTerraza ON dbo.tblResidencias.codterraza = dbo.tblTerraza.codTerraza1 INNER JOIN
                         dbo.tblTipoResidencia ON dbo.tblResidencias.codTipoResidencia = dbo.tblTipoResidencia.codTipoResidencia1 INNER JOIN
                         dbo.tblUbicacion ON dbo.tblResidencias.codUbicacion = dbo.tblUbicacion.codUbicacion1
WHERE        (dbo.tblResidencias.estado = 'DESOCUPADO')
ORDER BY CODIGO
GO
/****** Object:  Table [dbo].[tblAlquilerVenta]    Script Date: 03/12/2021 18:02:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAlquilerVenta](
	[CodigoVentaAlquiler] [int] IDENTITY(1,1) NOT NULL,
	[DocumentoEmpleado] [varchar](50) NOT NULL,
	[CodigoResidencia] [int] NOT NULL,
	[DocumentoCliente] [varchar](20) NOT NULL,
	[MetodoPago] [int] NOT NULL,
 CONSTRAINT [PK_tblAlquilerVenta] PRIMARY KEY CLUSTERED 
(
	[CodigoVentaAlquiler] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_6]    Script Date: 03/12/2021 18:02:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_6]
AS
SELECT        DocumentoEmpleado, CodigoResidencia, DocumentoCliente, MetodoPago
FROM            dbo.tblAlquilerVenta
GO
/****** Object:  Table [dbo].[tblMetodoPago]    Script Date: 03/12/2021 18:02:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMetodoPago](
	[CodigoPago] [int] IDENTITY(1,1) NOT NULL,
	[NombrePago] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblMetodoPago] PRIMARY KEY CLUSTERED 
(
	[CodigoPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_5]    Script Date: 03/12/2021 18:02:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_5]
AS
SELECT        TOP (100) PERCENT dbo.tblAlquilerVenta.CodigoVentaAlquiler, dbo.tblEmpleado.Documento AS [DOCUMENTO EMPLEADO], dbo.tblEmpleado.Nombre AS [NOMBRE EMPLEADO], 
                         dbo.tblCliente.Documento AS [DOCUMENTO CLIENTE], dbo.tblCliente.PrimerNombre AS [NOMBRE CLIENTE], dbo.tblMetodoPago.NombrePago AS [TIPO DE PAGO], dbo.tblResidencias.Direccion, dbo.tblResidencias.estado
FROM            dbo.tblAlquilerVenta INNER JOIN
                         dbo.tblCliente ON dbo.tblAlquilerVenta.DocumentoCliente = dbo.tblCliente.Documento INNER JOIN
                         dbo.tblEmpleado ON dbo.tblAlquilerVenta.DocumentoEmpleado = dbo.tblEmpleado.Documento INNER JOIN
                         dbo.tblMetodoPago ON dbo.tblAlquilerVenta.MetodoPago = dbo.tblMetodoPago.CodigoPago INNER JOIN
                         dbo.tblResidencias ON dbo.tblAlquilerVenta.CodigoResidencia = dbo.tblResidencias.codigo_Residencia
ORDER BY dbo.tblAlquilerVenta.CodigoVentaAlquiler
GO
/****** Object:  Table [dbo].[tblCon_Empleado_Telefono]    Script Date: 03/12/2021 18:02:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCon_Empleado_Telefono](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Numero] [varchar](20) NOT NULL,
	[DocumentoEmpleado] [varchar](50) NOT NULL,
	[CodigoTelefono] [int] NOT NULL,
 CONSTRAINT [PK_tblCon_Empleado_Telefono] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTelefonoEmpleado]    Script Date: 03/12/2021 18:02:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTelefonoEmpleado](
	[Codigo_Telefono_empleado] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Tipo_telefono] [varchar](50) NOT NULL,
	[blnActivo] [bit] NOT NULL,
 CONSTRAINT [PK_tblTelefonoEmpleado] PRIMARY KEY CLUSTERED 
(
	[Codigo_Telefono_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAlquilerVenta]  WITH CHECK ADD  CONSTRAINT [FK_tblAlquilerVenta_tblCliente] FOREIGN KEY([DocumentoCliente])
REFERENCES [dbo].[tblCliente] ([Documento])
GO
ALTER TABLE [dbo].[tblAlquilerVenta] CHECK CONSTRAINT [FK_tblAlquilerVenta_tblCliente]
GO
ALTER TABLE [dbo].[tblAlquilerVenta]  WITH CHECK ADD  CONSTRAINT [FK_tblAlquilerVenta_tblEmpleado] FOREIGN KEY([DocumentoEmpleado])
REFERENCES [dbo].[tblEmpleado] ([Documento])
GO
ALTER TABLE [dbo].[tblAlquilerVenta] CHECK CONSTRAINT [FK_tblAlquilerVenta_tblEmpleado]
GO
ALTER TABLE [dbo].[tblAlquilerVenta]  WITH CHECK ADD  CONSTRAINT [FK_tblAlquilerVenta_tblMetodoPago] FOREIGN KEY([MetodoPago])
REFERENCES [dbo].[tblMetodoPago] ([CodigoPago])
GO
ALTER TABLE [dbo].[tblAlquilerVenta] CHECK CONSTRAINT [FK_tblAlquilerVenta_tblMetodoPago]
GO
ALTER TABLE [dbo].[tblAlquilerVenta]  WITH CHECK ADD  CONSTRAINT [FK_tblAlquilerVenta_tblResidencias] FOREIGN KEY([CodigoResidencia])
REFERENCES [dbo].[tblResidencias] ([codigo_Residencia])
GO
ALTER TABLE [dbo].[tblAlquilerVenta] CHECK CONSTRAINT [FK_tblAlquilerVenta_tblResidencias]
GO
ALTER TABLE [dbo].[tblCon_Empleado_Telefono]  WITH CHECK ADD  CONSTRAINT [FK_tblCon_Empleado_Telefono_tblEmpleado] FOREIGN KEY([DocumentoEmpleado])
REFERENCES [dbo].[tblEmpleado] ([Documento])
GO
ALTER TABLE [dbo].[tblCon_Empleado_Telefono] CHECK CONSTRAINT [FK_tblCon_Empleado_Telefono_tblEmpleado]
GO
ALTER TABLE [dbo].[tblCon_Empleado_Telefono]  WITH CHECK ADD  CONSTRAINT [FK_tblCon_Empleado_Telefono_tblTelefonoEmpleado] FOREIGN KEY([CodigoTelefono])
REFERENCES [dbo].[tblTelefonoEmpleado] ([Codigo_Telefono_empleado])
GO
ALTER TABLE [dbo].[tblCon_Empleado_Telefono] CHECK CONSTRAINT [FK_tblCon_Empleado_Telefono_tblTelefonoEmpleado]
GO
ALTER TABLE [dbo].[tblResidencias]  WITH CHECK ADD  CONSTRAINT [FK_tblResidencias_tblAmueblado] FOREIGN KEY([codAmueblado])
REFERENCES [dbo].[tblAmueblado] ([codAmueblado1])
GO
ALTER TABLE [dbo].[tblResidencias] CHECK CONSTRAINT [FK_tblResidencias_tblAmueblado]
GO
ALTER TABLE [dbo].[tblResidencias]  WITH CHECK ADD  CONSTRAINT [FK_tblResidencias_tblGarage] FOREIGN KEY([codGarage])
REFERENCES [dbo].[tblGarage] ([codGarage1])
GO
ALTER TABLE [dbo].[tblResidencias] CHECK CONSTRAINT [FK_tblResidencias_tblGarage]
GO
ALTER TABLE [dbo].[tblResidencias]  WITH CHECK ADD  CONSTRAINT [FK_tblResidencias_tblInternet] FOREIGN KEY([codInternet])
REFERENCES [dbo].[tblInternet] ([codInternet1])
GO
ALTER TABLE [dbo].[tblResidencias] CHECK CONSTRAINT [FK_tblResidencias_tblInternet]
GO
ALTER TABLE [dbo].[tblResidencias]  WITH CHECK ADD  CONSTRAINT [FK_tblResidencias_tblPatio] FOREIGN KEY([codPatio])
REFERENCES [dbo].[tblPatio] ([codPatio1])
GO
ALTER TABLE [dbo].[tblResidencias] CHECK CONSTRAINT [FK_tblResidencias_tblPatio]
GO
ALTER TABLE [dbo].[tblResidencias]  WITH CHECK ADD  CONSTRAINT [FK_tblResidencias_tblPisina] FOREIGN KEY([codPisina])
REFERENCES [dbo].[tblPisina] ([codPisina1])
GO
ALTER TABLE [dbo].[tblResidencias] CHECK CONSTRAINT [FK_tblResidencias_tblPisina]
GO
ALTER TABLE [dbo].[tblResidencias]  WITH CHECK ADD  CONSTRAINT [FK_tblResidencias_tblTerraza] FOREIGN KEY([codterraza])
REFERENCES [dbo].[tblTerraza] ([codTerraza1])
GO
ALTER TABLE [dbo].[tblResidencias] CHECK CONSTRAINT [FK_tblResidencias_tblTerraza]
GO
ALTER TABLE [dbo].[tblResidencias]  WITH CHECK ADD  CONSTRAINT [FK_tblResidencias_tblTipoResidencia] FOREIGN KEY([codTipoResidencia])
REFERENCES [dbo].[tblTipoResidencia] ([codTipoResidencia1])
GO
ALTER TABLE [dbo].[tblResidencias] CHECK CONSTRAINT [FK_tblResidencias_tblTipoResidencia]
GO
ALTER TABLE [dbo].[tblResidencias]  WITH CHECK ADD  CONSTRAINT [FK_tblResidencias_tblUbicacion] FOREIGN KEY([codUbicacion])
REFERENCES [dbo].[tblUbicacion] ([codUbicacion1])
GO
ALTER TABLE [dbo].[tblResidencias] CHECK CONSTRAINT [FK_tblResidencias_tblUbicacion]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblCliente"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 218
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblTelefonoCliente"
            Begin Extent = 
               Top = 6
               Left = 256
               Bottom = 136
               Right = 453
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblTipoTelefono"
            Begin Extent = 
               Top = 6
               Left = 491
               Bottom = 119
               Right = 693
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 2100
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblCliente"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 170
               Right = 218
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblEmpleado"
            Begin Extent = 
               Top = 6
               Left = 256
               Bottom = 170
               Right = 436
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblResidencias"
            Begin Extent = 
               Top = 6
               Left = 474
               Bottom = 136
               Right = 662
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 1650
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblCliente"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 185
               Right = 218
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblTelefonoCliente1"
            Begin Extent = 
               Top = 6
               Left = 256
               Bottom = 193
               Right = 453
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblTipoTelefono"
            Begin Extent = 
               Top = 6
               Left = 491
               Bottom = 150
               Right = 693
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblCliente"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 173
               Right = 218
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblTelefonoCliente"
            Begin Extent = 
               Top = 6
               Left = 256
               Bottom = 161
               Right = 453
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblTipoTelefono"
            Begin Extent = 
               Top = 6
               Left = 491
               Bottom = 142
               Right = 693
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_4'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_4'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[44] 4[26] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblAlquilerVenta"
            Begin Extent = 
               Top = 150
               Left = 232
               Bottom = 302
               Right = 437
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCliente"
            Begin Extent = 
               Top = 6
               Left = 281
               Bottom = 136
               Right = 461
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblEmpleado"
            Begin Extent = 
               Top = 6
               Left = 499
               Bottom = 136
               Right = 679
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblMetodoPago"
            Begin Extent = 
               Top = 6
               Left = 717
               Bottom = 129
               Right = 887
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblResidencias"
            Begin Extent = 
               Top = 6
               Left = 925
               Bottom = 291
               Right = 1113
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 1635
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
        ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_5'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_5'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_5'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblAlquilerVenta"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 162
               Right = 243
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_6'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_6'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[4] 2[33] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblAmueblado"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 215
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblResidencias"
            Begin Extent = 
               Top = 6
               Left = 253
               Bottom = 277
               Right = 441
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "tblGarage"
            Begin Extent = 
               Top = 6
               Left = 479
               Bottom = 102
               Right = 649
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblInternet"
            Begin Extent = 
               Top = 6
               Left = 687
               Bottom = 102
               Right = 861
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblPatio"
            Begin Extent = 
               Top = 6
               Left = 899
               Bottom = 102
               Right = 1069
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblPisina"
            Begin Extent = 
               Top = 102
               Left = 38
               Bottom = 198
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblTerraza"
            Begin Extent = 
               Top = 102
               Left = 479
               Bottom = 198
               Right = 649
            End
            ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_7'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblTipoResidencia"
            Begin Extent = 
               Top = 102
               Left = 687
               Bottom = 198
               Right = 881
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblUbicacion"
            Begin Extent = 
               Top = 102
               Left = 919
               Bottom = 198
               Right = 1105
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_7'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_7'
GO
USE [master]
GO
ALTER DATABASE [DBInmobiliaria] SET  READ_WRITE 
GO
