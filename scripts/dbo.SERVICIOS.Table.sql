USE [BD_FISIO21]
GO
/****** Object:  Table [dbo].[SERVICIOS]    Script Date: 24/09/2024 12:19:19 ******/
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
