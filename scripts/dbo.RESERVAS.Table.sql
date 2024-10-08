USE [BD_FISIO21]
GO
/****** Object:  Table [dbo].[RESERVAS]    Script Date: 24/09/2024 12:19:19 ******/
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
