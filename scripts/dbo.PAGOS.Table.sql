USE [BD_FISIO21]
GO
/****** Object:  Table [dbo].[PAGOS]    Script Date: 24/09/2024 12:19:19 ******/
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
ALTER TABLE [dbo].[PAGOS]  WITH CHECK ADD FOREIGN KEY([id_paciente])
REFERENCES [dbo].[PACIENTES] ([id_paciente])
GO
ALTER TABLE [dbo].[PAGOS]  WITH CHECK ADD FOREIGN KEY([id_valorizacion])
REFERENCES [dbo].[VALORIZACION] ([id_valorizacion])
GO
