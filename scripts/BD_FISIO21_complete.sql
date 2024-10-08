USE [master]
GO
/****** Object:  Database [BD_FISIO21]    Script Date: 24/09/2024 13:50:30 ******/
CREATE DATABASE [BD_FISIO21]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BD_FISIO21', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.AZTIRMA\MSSQL\DATA\BD_FISIO21.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BD_FISIO21_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.AZTIRMA\MSSQL\DATA\BD_FISIO21_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BD_FISIO21] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BD_FISIO21].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BD_FISIO21] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BD_FISIO21] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BD_FISIO21] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BD_FISIO21] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BD_FISIO21] SET ARITHABORT OFF 
GO
ALTER DATABASE [BD_FISIO21] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BD_FISIO21] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BD_FISIO21] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BD_FISIO21] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BD_FISIO21] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BD_FISIO21] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BD_FISIO21] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BD_FISIO21] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BD_FISIO21] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BD_FISIO21] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BD_FISIO21] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BD_FISIO21] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BD_FISIO21] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BD_FISIO21] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BD_FISIO21] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BD_FISIO21] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BD_FISIO21] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BD_FISIO21] SET RECOVERY FULL 
GO
ALTER DATABASE [BD_FISIO21] SET  MULTI_USER 
GO
ALTER DATABASE [BD_FISIO21] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BD_FISIO21] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BD_FISIO21] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BD_FISIO21] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BD_FISIO21] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BD_FISIO21] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BD_FISIO21', N'ON'
GO
ALTER DATABASE [BD_FISIO21] SET QUERY_STORE = OFF
GO
USE [BD_FISIO21]
GO
/****** Object:  Table [dbo].[FISIOTERAPEUTAS]    Script Date: 24/09/2024 13:50:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FISIOTERAPEUTAS](
	[id_fisioteapeuta] [int] IDENTITY(1,1) NOT NULL,
	[numero_documento] [varchar](15) NOT NULL,
	[nombres] [varchar](255) NOT NULL,
	[apellido_paterno] [varchar](255) NOT NULL,
	[apellido_materno] [varchar](255) NOT NULL,
	[celular] [varchar](15) NOT NULL,
	[estado] [varchar](15) NOT NULL,
	[fecha_ingreso] [date] NOT NULL,
	[fecha_cese] [date] NULL,
	[grado_academico] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_fisioteapeuta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HORARIOS]    Script Date: 24/09/2024 13:50:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HORARIOS](
	[id_horario] [int] IDENTITY(1,1) NOT NULL,
	[id_fisioteapeuta] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[turno] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_horario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PACIENTES]    Script Date: 24/09/2024 13:50:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PACIENTES](
	[id_paciente] [int] IDENTITY(1,1) NOT NULL,
	[numero_documento] [varchar](15) NOT NULL,
	[nombres] [varchar](255) NOT NULL,
	[apellido_paterno] [varchar](255) NOT NULL,
	[apellido_materno] [varchar](255) NOT NULL,
	[celular] [varchar](15) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[fecha_de_nacimiento] [date] NOT NULL,
	[distrito] [varchar](255) NOT NULL,
	[estado_civil] [varchar](15) NOT NULL,
	[ocupacion] [varchar](255) NOT NULL,
	[numero_hijos] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_paciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PAGOS]    Script Date: 24/09/2024 13:50:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAGOS](
	[id_pago] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[id_paciente] [int] NOT NULL,
	[id_valorizacion] [int] NOT NULL,
	[numero_cuotas] [int] NOT NULL,
	[monto] [money] NOT NULL,
	[tipo_doc] [varchar](15) NOT NULL,
	[numero_doc] [varchar](15) NOT NULL,
	[estado] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROGRAMAS]    Script Date: 24/09/2024 13:50:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROGRAMAS](
	[id_programa] [int] IDENTITY(1,1) NOT NULL,
	[nombre_programa] [varchar](255) NOT NULL,
	[descripcion_programa] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_programa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RESERVAS]    Script Date: 24/09/2024 13:50:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RESERVAS](
	[id_reserva] [int] IDENTITY(1,1) NOT NULL,
	[id_paciente] [int] NOT NULL,
	[id_servicio] [int] NOT NULL,
	[id_programa] [int] NOT NULL,
	[id_fisioteapeuta] [int] NOT NULL,
	[id_valorizacion] [int] NOT NULL,
	[fecha_registro] [date] NULL,
	[fecha_reserva] [date] NOT NULL,
	[hora_reserva] [time](7) NOT NULL,
	[estado] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_reserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SERVICIOS]    Script Date: 24/09/2024 13:50:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SERVICIOS](
	[id_servicio] [int] IDENTITY(1,1) NOT NULL,
	[nombre_servicio] [varchar](255) NOT NULL,
	[descripcion_servicio] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_servicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VALORIZACION]    Script Date: 24/09/2024 13:50:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VALORIZACION](
	[id_valorizacion] [int] IDENTITY(1,1) NOT NULL,
	[id_servicio] [int] NOT NULL,
	[id_programa] [int] NOT NULL,
	[valorizacion] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_valorizacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[FISIOTERAPEUTAS] ON 

INSERT [dbo].[FISIOTERAPEUTAS] ([id_fisioteapeuta], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [celular], [estado], [fecha_ingreso], [fecha_cese], [grado_academico]) VALUES (10, N'70264102', N'María Esther', N'Castro', N'Miranda', N'983234542', N'S', CAST(N'2022-03-05' AS Date), NULL, N'Universitario')
INSERT [dbo].[FISIOTERAPEUTAS] ([id_fisioteapeuta], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [celular], [estado], [fecha_ingreso], [fecha_cese], [grado_academico]) VALUES (11, N'73142608', N'Milagros Rosmery', N'Condori', N'Quiroz', N'983232342', N'S', CAST(N'2024-05-10' AS Date), NULL, N'Tecnico')
INSERT [dbo].[FISIOTERAPEUTAS] ([id_fisioteapeuta], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [celular], [estado], [fecha_ingreso], [fecha_cese], [grado_academico]) VALUES (12, N'70207217', N'Jean Paul', N'Ruiz', N'Manosalva', N'983232344', N'S', CAST(N'2024-04-15' AS Date), NULL, N'Universitario')
INSERT [dbo].[FISIOTERAPEUTAS] ([id_fisioteapeuta], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [celular], [estado], [fecha_ingreso], [fecha_cese], [grado_academico]) VALUES (13, N'74849048', N'Lorena Selene', N'Blas', N'Herrera', N'983223421', N'S', CAST(N'2022-06-12' AS Date), NULL, N'Universitario')
INSERT [dbo].[FISIOTERAPEUTAS] ([id_fisioteapeuta], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [celular], [estado], [fecha_ingreso], [fecha_cese], [grado_academico]) VALUES (14, N'70514545', N'Esther Karolay', N'Quilca', N'Leon', N'983268732', N'S', CAST(N'2023-02-20' AS Date), NULL, N'Universitario')
INSERT [dbo].[FISIOTERAPEUTAS] ([id_fisioteapeuta], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [celular], [estado], [fecha_ingreso], [fecha_cese], [grado_academico]) VALUES (15, N'72628306', N'Claudia Lucero', N'Roman', N'Cotrina', N'983231234', N'S', CAST(N'2023-02-08' AS Date), NULL, N'Universitario')
SET IDENTITY_INSERT [dbo].[FISIOTERAPEUTAS] OFF
GO
SET IDENTITY_INSERT [dbo].[HORARIOS] ON 

INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (1, 10, CAST(N'2024-09-09' AS Date), N'Mañana')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (2, 11, CAST(N'2024-09-09' AS Date), N'Mañana')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (3, 12, CAST(N'2024-09-09' AS Date), N'Mañana')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (4, 13, CAST(N'2024-09-09' AS Date), N'Tarde')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (5, 14, CAST(N'2024-09-09' AS Date), N'Tarde')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (6, 15, CAST(N'2024-09-09' AS Date), N'Tarde')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (7, 10, CAST(N'2024-09-10' AS Date), N'Mañana')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (8, 11, CAST(N'2024-09-10' AS Date), N'Mañana')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (9, 12, CAST(N'2024-09-10' AS Date), N'Mañana')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (10, 13, CAST(N'2024-09-10' AS Date), N'Tarde')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (11, 14, CAST(N'2024-09-10' AS Date), N'Tarde')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (12, 15, CAST(N'2024-09-10' AS Date), N'Tarde')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (13, 10, CAST(N'2024-09-11' AS Date), N'Mañana')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (14, 11, CAST(N'2024-09-11' AS Date), N'Mañana')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (15, 12, CAST(N'2024-09-11' AS Date), N'Mañana')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (16, 13, CAST(N'2024-09-11' AS Date), N'Tarde')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (17, 14, CAST(N'2024-09-11' AS Date), N'Tarde')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (18, 15, CAST(N'2024-09-11' AS Date), N'Tarde')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (19, 10, CAST(N'2024-09-12' AS Date), N'Mañana')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (20, 11, CAST(N'2024-09-12' AS Date), N'Mañana')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (21, 12, CAST(N'2024-09-12' AS Date), N'Mañana')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (22, 13, CAST(N'2024-09-12' AS Date), N'Tarde')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (23, 14, CAST(N'2024-09-12' AS Date), N'Tarde')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (24, 15, CAST(N'2024-09-12' AS Date), N'Tarde')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (25, 10, CAST(N'2024-09-13' AS Date), N'Mañana')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (26, 11, CAST(N'2024-09-13' AS Date), N'Mañana')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (27, 12, CAST(N'2024-09-13' AS Date), N'Mañana')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (28, 13, CAST(N'2024-09-13' AS Date), N'Tarde')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (29, 14, CAST(N'2024-09-13' AS Date), N'Tarde')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (30, 15, CAST(N'2024-09-13' AS Date), N'Tarde')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (31, 10, CAST(N'2024-09-16' AS Date), N'Mañana')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (32, 11, CAST(N'2024-09-16' AS Date), N'Mañana')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (33, 12, CAST(N'2024-09-16' AS Date), N'Mañana')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (34, 13, CAST(N'2024-09-16' AS Date), N'Tarde')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (35, 14, CAST(N'2024-09-16' AS Date), N'Tarde')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (36, 15, CAST(N'2024-09-16' AS Date), N'Tarde')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (37, 10, CAST(N'2024-09-17' AS Date), N'Mañana')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (38, 11, CAST(N'2024-09-17' AS Date), N'Mañana')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (39, 12, CAST(N'2024-09-17' AS Date), N'Mañana')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (40, 13, CAST(N'2024-09-17' AS Date), N'Tarde')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (41, 14, CAST(N'2024-09-17' AS Date), N'Tarde')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (42, 15, CAST(N'2024-09-17' AS Date), N'Tarde')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (43, 10, CAST(N'2024-09-18' AS Date), N'Mañana')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (44, 11, CAST(N'2024-09-18' AS Date), N'Mañana')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (45, 12, CAST(N'2024-09-18' AS Date), N'Mañana')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (46, 13, CAST(N'2024-09-18' AS Date), N'Tarde')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (47, 14, CAST(N'2024-09-18' AS Date), N'Tarde')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (48, 15, CAST(N'2024-09-18' AS Date), N'Tarde')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (49, 10, CAST(N'2024-09-19' AS Date), N'Mañana')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (50, 11, CAST(N'2024-09-19' AS Date), N'Mañana')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (51, 12, CAST(N'2024-09-19' AS Date), N'Mañana')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (52, 13, CAST(N'2024-09-19' AS Date), N'Tarde')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (53, 14, CAST(N'2024-09-19' AS Date), N'Tarde')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (54, 15, CAST(N'2024-09-19' AS Date), N'Tarde')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (55, 10, CAST(N'2024-09-20' AS Date), N'Mañana')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (56, 11, CAST(N'2024-09-20' AS Date), N'Mañana')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (57, 12, CAST(N'2024-09-20' AS Date), N'Mañana')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (58, 13, CAST(N'2024-09-20' AS Date), N'Tarde')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (59, 14, CAST(N'2024-09-20' AS Date), N'Tarde')
INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) VALUES (60, 15, CAST(N'2024-09-20' AS Date), N'Tarde')
SET IDENTITY_INSERT [dbo].[HORARIOS] OFF
GO
SET IDENTITY_INSERT [dbo].[PACIENTES] ON 

INSERT [dbo].[PACIENTES] ([id_paciente], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [celular], [email], [fecha_de_nacimiento], [distrito], [estado_civil], [ocupacion], [numero_hijos]) VALUES (1, N'001103695', N'Giulio', N'Rotoli', N'Límaco', N'940499986', N'giuliort10@gmail.com', CAST(N'1996-05-05' AS Date), N'Miraflores', N'C', N'Independiente', 3)
INSERT [dbo].[PACIENTES] ([id_paciente], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [celular], [email], [fecha_de_nacimiento], [distrito], [estado_civil], [ocupacion], [numero_hijos]) VALUES (2, N'09273929', N'Manuel Antonio', N'Rodríguez', N'Vargas', N'954174037', N'tonyrodrigv@gmail.com', CAST(N'1961-08-07' AS Date), N'San Miguel', N'S', N'Independiente', 0)
INSERT [dbo].[PACIENTES] ([id_paciente], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [celular], [email], [fecha_de_nacimiento], [distrito], [estado_civil], [ocupacion], [numero_hijos]) VALUES (3, N'10766340', N'Maria', N'Ramos', N'Labrin', N'950120097', N'mperlar81@gmail.com', CAST(N'1955-01-05' AS Date), N'Ate', N'C', N'Ama de casa', 3)
INSERT [dbo].[PACIENTES] ([id_paciente], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [celular], [email], [fecha_de_nacimiento], [distrito], [estado_civil], [ocupacion], [numero_hijos]) VALUES (4, N'41839744', N'Gunther', N'Paredes', N'Romero', N'942149149', N'gunther.pa.ro@gmail.com', CAST(N'1983-02-08' AS Date), N'San Martín de Porres', N'S', N'Analista de compras', 0)
INSERT [dbo].[PACIENTES] ([id_paciente], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [celular], [email], [fecha_de_nacimiento], [distrito], [estado_civil], [ocupacion], [numero_hijos]) VALUES (5, N'10058293', N'Wolkmer', N'Ampuero', N'Valdivia', N'986918544', N'wolkmer22002@gmail.com', CAST(N'1972-11-19' AS Date), N'San Borja', N'S', N'Tecnico contratista', 1)
INSERT [dbo].[PACIENTES] ([id_paciente], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [celular], [email], [fecha_de_nacimiento], [distrito], [estado_civil], [ocupacion], [numero_hijos]) VALUES (6, N'40627075', N'Percy', N'Herrera', N'Reyna', N'991344652', N'percyherrera80@gmail.com', CAST(N'1980-05-29' AS Date), N'Miraflores', N'S', N'Ingeniero civil', 1)
INSERT [dbo].[PACIENTES] ([id_paciente], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [celular], [email], [fecha_de_nacimiento], [distrito], [estado_civil], [ocupacion], [numero_hijos]) VALUES (7, N'08891367', N'Felix', N'Arellano', N'Melgarejo', N'998089239', N'fharellano1@hotmail.com', CAST(N'1975-11-08' AS Date), N'Surquillo', N'S', N'ingeniero industrial', 1)
INSERT [dbo].[PACIENTES] ([id_paciente], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [celular], [email], [fecha_de_nacimiento], [distrito], [estado_civil], [ocupacion], [numero_hijos]) VALUES (8, N'76919929', N'Alvaro', N'Penin', N'Aso', N'929741757', N'alvaro.peñin@ap-r.net', CAST(N'1978-04-05' AS Date), N'Miraflores', N'S', N'Empresario', 0)
INSERT [dbo].[PACIENTES] ([id_paciente], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [celular], [email], [fecha_de_nacimiento], [distrito], [estado_civil], [ocupacion], [numero_hijos]) VALUES (9, N'07283250', N'Jaime Ricardo', N'Montalvan', N'Lozada', N'990342588', N'mcsalomo3@hotmail.com', CAST(N'1963-06-11' AS Date), N'La Victoria', N'C', N'Empresario', 2)
INSERT [dbo].[PACIENTES] ([id_paciente], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [celular], [email], [fecha_de_nacimiento], [distrito], [estado_civil], [ocupacion], [numero_hijos]) VALUES (10, N'47200027', N'Rocio', N'Huarcaya', N'Vilca', N'943501770', N'rociohuarcaya@gmail.com', CAST(N'1991-05-13' AS Date), N'Chorrillos', N'S', N'Analista de Marketing', 0)
SET IDENTITY_INSERT [dbo].[PACIENTES] OFF
GO
SET IDENTITY_INSERT [dbo].[PAGOS] ON 

INSERT [dbo].[PAGOS] ([id_pago], [fecha], [id_paciente], [id_valorizacion], [numero_cuotas], [monto], [tipo_doc], [numero_doc], [estado]) VALUES (1, CAST(N'2024-09-16T00:00:00.000' AS DateTime), 1, 2, 1, 288.0000, N'boleta', N'0011-459983', N'cancelado')
INSERT [dbo].[PAGOS] ([id_pago], [fecha], [id_paciente], [id_valorizacion], [numero_cuotas], [monto], [tipo_doc], [numero_doc], [estado]) VALUES (2, CAST(N'2024-09-17T00:00:00.000' AS DateTime), 2, 4, 1, 352.0000, N'boleta', N'0011-463322', N'cancelado')
INSERT [dbo].[PAGOS] ([id_pago], [fecha], [id_paciente], [id_valorizacion], [numero_cuotas], [monto], [tipo_doc], [numero_doc], [estado]) VALUES (3, CAST(N'2024-09-18T00:00:00.000' AS DateTime), 3, 6, 3, 138.0000, N'boleta', N'0011-445444', N'pendiente')
INSERT [dbo].[PAGOS] ([id_pago], [fecha], [id_paciente], [id_valorizacion], [numero_cuotas], [monto], [tipo_doc], [numero_doc], [estado]) VALUES (4, CAST(N'2024-09-19T00:00:00.000' AS DateTime), 4, 8, 3, 181.0000, N'factura', N'FC-002123123', N'pendiente')
INSERT [dbo].[PAGOS] ([id_pago], [fecha], [id_paciente], [id_valorizacion], [numero_cuotas], [monto], [tipo_doc], [numero_doc], [estado]) VALUES (5, CAST(N'2024-09-20T00:00:00.000' AS DateTime), 5, 10, 2, 400.0000, N'boleta', N'0011-423332', N'pendiente')
SET IDENTITY_INSERT [dbo].[PAGOS] OFF
GO
SET IDENTITY_INSERT [dbo].[PROGRAMAS] ON 

INSERT [dbo].[PROGRAMAS] ([id_programa], [nombre_programa], [descripcion_programa]) VALUES (1, N'Terapia Esencial', N'Terapia de 35 min en camilla y 35 min de ejercicio o 35 min de equipo')
INSERT [dbo].[PROGRAMAS] ([id_programa], [nombre_programa], [descripcion_programa]) VALUES (2, N'Terapia Advance', N'Terapia de 35 min en camilla y 35 min de ejercicio + 35 min de equipo')
INSERT [dbo].[PROGRAMAS] ([id_programa], [nombre_programa], [descripcion_programa]) VALUES (3, N'Terapia Plus', N'Terapia de 70 min en camilla')
INSERT [dbo].[PROGRAMAS] ([id_programa], [nombre_programa], [descripcion_programa]) VALUES (4, N'Terapia Max', N'Terapia de 70 min en camilla y 35 min de ejercicio o 35 min de equipo')
INSERT [dbo].[PROGRAMAS] ([id_programa], [nombre_programa], [descripcion_programa]) VALUES (5, N'Terapia Ultra', N'Terapia de 70 min en camilla y 35 min de ejercicio + 35 min de equipo')
SET IDENTITY_INSERT [dbo].[PROGRAMAS] OFF
GO
SET IDENTITY_INSERT [dbo].[RESERVAS] ON 

INSERT [dbo].[RESERVAS] ([id_reserva], [id_paciente], [id_servicio], [id_programa], [id_fisioteapeuta], [id_valorizacion], [fecha_registro], [fecha_reserva], [hora_reserva], [estado]) VALUES (6, 1, 1, 2, 10, 2, CAST(N'2024-09-16' AS Date), CAST(N'2024-09-17' AS Date), CAST(N'11:00:00' AS Time), N'COMPLETADO')
INSERT [dbo].[RESERVAS] ([id_reserva], [id_paciente], [id_servicio], [id_programa], [id_fisioteapeuta], [id_valorizacion], [fecha_registro], [fecha_reserva], [hora_reserva], [estado]) VALUES (7, 2, 1, 4, 11, 4, CAST(N'2024-09-16' AS Date), CAST(N'2024-09-18' AS Date), CAST(N'10:00:00' AS Time), N'COMPLETADO')
INSERT [dbo].[RESERVAS] ([id_reserva], [id_paciente], [id_servicio], [id_programa], [id_fisioteapeuta], [id_valorizacion], [fecha_registro], [fecha_reserva], [hora_reserva], [estado]) VALUES (8, 3, 2, 1, 12, 6, CAST(N'2024-09-16' AS Date), CAST(N'2024-09-20' AS Date), CAST(N'10:00:00' AS Time), N'COMPLETADO')
INSERT [dbo].[RESERVAS] ([id_reserva], [id_paciente], [id_servicio], [id_programa], [id_fisioteapeuta], [id_valorizacion], [fecha_registro], [fecha_reserva], [hora_reserva], [estado]) VALUES (9, 4, 2, 3, 13, 8, CAST(N'2024-09-16' AS Date), CAST(N'2024-09-23' AS Date), CAST(N'14:00:00' AS Time), N'RESERVADO')
INSERT [dbo].[RESERVAS] ([id_reserva], [id_paciente], [id_servicio], [id_programa], [id_fisioteapeuta], [id_valorizacion], [fecha_registro], [fecha_reserva], [hora_reserva], [estado]) VALUES (10, 5, 2, 5, 14, 10, CAST(N'2024-09-16' AS Date), CAST(N'2024-09-25' AS Date), CAST(N'15:00:00' AS Time), N'RESERVADO')
SET IDENTITY_INSERT [dbo].[RESERVAS] OFF
GO
SET IDENTITY_INSERT [dbo].[SERVICIOS] ON 

INSERT [dbo].[SERVICIOS] ([id_servicio], [nombre_servicio], [descripcion_servicio]) VALUES (1, N'Paquete de terapias (2)', N'Paquete de 2 terapias')
INSERT [dbo].[SERVICIOS] ([id_servicio], [nombre_servicio], [descripcion_servicio]) VALUES (2, N'Paquete de terapias (4)', N'Paquete de 4 terapias')
INSERT [dbo].[SERVICIOS] ([id_servicio], [nombre_servicio], [descripcion_servicio]) VALUES (3, N'Paquete de terapias (12)', N'Paquete de 12 terapias')
SET IDENTITY_INSERT [dbo].[SERVICIOS] OFF
GO
SET IDENTITY_INSERT [dbo].[VALORIZACION] ON 

INSERT [dbo].[VALORIZACION] ([id_valorizacion], [id_servicio], [id_programa], [valorizacion]) VALUES (1, 1, 1, 224.0000)
INSERT [dbo].[VALORIZACION] ([id_valorizacion], [id_servicio], [id_programa], [valorizacion]) VALUES (2, 1, 2, 288.0000)
INSERT [dbo].[VALORIZACION] ([id_valorizacion], [id_servicio], [id_programa], [valorizacion]) VALUES (3, 1, 3, 288.0000)
INSERT [dbo].[VALORIZACION] ([id_valorizacion], [id_servicio], [id_programa], [valorizacion]) VALUES (4, 1, 4, 352.0000)
INSERT [dbo].[VALORIZACION] ([id_valorizacion], [id_servicio], [id_programa], [valorizacion]) VALUES (5, 1, 5, 416.0000)
INSERT [dbo].[VALORIZACION] ([id_valorizacion], [id_servicio], [id_programa], [valorizacion]) VALUES (6, 2, 1, 416.0000)
INSERT [dbo].[VALORIZACION] ([id_valorizacion], [id_servicio], [id_programa], [valorizacion]) VALUES (7, 2, 2, 544.0000)
INSERT [dbo].[VALORIZACION] ([id_valorizacion], [id_servicio], [id_programa], [valorizacion]) VALUES (8, 2, 3, 544.0000)
INSERT [dbo].[VALORIZACION] ([id_valorizacion], [id_servicio], [id_programa], [valorizacion]) VALUES (9, 2, 4, 672.0000)
INSERT [dbo].[VALORIZACION] ([id_valorizacion], [id_servicio], [id_programa], [valorizacion]) VALUES (10, 2, 5, 800.0000)
INSERT [dbo].[VALORIZACION] ([id_valorizacion], [id_servicio], [id_programa], [valorizacion]) VALUES (11, 3, 1, 1152.0000)
INSERT [dbo].[VALORIZACION] ([id_valorizacion], [id_servicio], [id_programa], [valorizacion]) VALUES (12, 3, 2, 1536.0000)
INSERT [dbo].[VALORIZACION] ([id_valorizacion], [id_servicio], [id_programa], [valorizacion]) VALUES (13, 3, 3, 1536.0000)
INSERT [dbo].[VALORIZACION] ([id_valorizacion], [id_servicio], [id_programa], [valorizacion]) VALUES (14, 3, 4, 1920.0000)
INSERT [dbo].[VALORIZACION] ([id_valorizacion], [id_servicio], [id_programa], [valorizacion]) VALUES (15, 3, 5, 2304.0000)
SET IDENTITY_INSERT [dbo].[VALORIZACION] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__FISIOTER__7B886A63BA122CA0]    Script Date: 24/09/2024 13:50:30 ******/
ALTER TABLE [dbo].[FISIOTERAPEUTAS] ADD UNIQUE NONCLUSTERED 
(
	[numero_documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__PACIENTE__7B886A63BA6E2EFB]    Script Date: 24/09/2024 13:50:30 ******/
ALTER TABLE [dbo].[PACIENTES] ADD UNIQUE NONCLUSTERED 
(
	[numero_documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HORARIOS]  WITH CHECK ADD FOREIGN KEY([id_fisioteapeuta])
REFERENCES [dbo].[FISIOTERAPEUTAS] ([id_fisioteapeuta])
GO
ALTER TABLE [dbo].[PAGOS]  WITH CHECK ADD FOREIGN KEY([id_paciente])
REFERENCES [dbo].[PACIENTES] ([id_paciente])
GO
ALTER TABLE [dbo].[PAGOS]  WITH CHECK ADD FOREIGN KEY([id_valorizacion])
REFERENCES [dbo].[VALORIZACION] ([id_valorizacion])
GO
ALTER TABLE [dbo].[RESERVAS]  WITH CHECK ADD FOREIGN KEY([id_fisioteapeuta])
REFERENCES [dbo].[FISIOTERAPEUTAS] ([id_fisioteapeuta])
GO
ALTER TABLE [dbo].[RESERVAS]  WITH CHECK ADD FOREIGN KEY([id_paciente])
REFERENCES [dbo].[PACIENTES] ([id_paciente])
GO
ALTER TABLE [dbo].[RESERVAS]  WITH CHECK ADD FOREIGN KEY([id_programa])
REFERENCES [dbo].[PROGRAMAS] ([id_programa])
GO
ALTER TABLE [dbo].[RESERVAS]  WITH CHECK ADD FOREIGN KEY([id_servicio])
REFERENCES [dbo].[SERVICIOS] ([id_servicio])
GO
ALTER TABLE [dbo].[RESERVAS]  WITH CHECK ADD FOREIGN KEY([id_valorizacion])
REFERENCES [dbo].[VALORIZACION] ([id_valorizacion])
GO
ALTER TABLE [dbo].[VALORIZACION]  WITH CHECK ADD FOREIGN KEY([id_programa])
REFERENCES [dbo].[PROGRAMAS] ([id_programa])
GO
ALTER TABLE [dbo].[VALORIZACION]  WITH CHECK ADD FOREIGN KEY([id_servicio])
REFERENCES [dbo].[SERVICIOS] ([id_servicio])
GO
USE [master]
GO
ALTER DATABASE [BD_FISIO21] SET  READ_WRITE 
GO
