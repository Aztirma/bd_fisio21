USE [BD_FISIO21]
GO
/****** Object:  Table [dbo].[PACIENTES]    Script Date: 24/09/2024 12:19:19 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[numero_documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
