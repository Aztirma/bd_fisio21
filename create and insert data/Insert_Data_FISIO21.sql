SET IDENTITY_INSERT [dbo].[FISIOTERAPEUTAS] ON;

INSERT [dbo].[FISIOTERAPEUTAS] ([id_fisioteapeuta], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [celular], [estado], [fecha_ingreso], [fecha_cese], [grado_academico]) 
VALUES 
(10, N'70264102', N'María Esther', N'Castro', N'Miranda', N'983234542', N'S', CAST(N'2022-03-05' AS Date), NULL, N'Universitario'),
(11, N'73142608', N'Milagros Rosmery', N'Condori', N'Quiroz', N'983232342', N'S', CAST(N'2024-05-10' AS Date), NULL, N'Tecnico'),
(12, N'70207217', N'Jean Paul', N'Ruiz', N'Manosalva', N'983232344', N'S', CAST(N'2024-04-15' AS Date), NULL, N'Universitario'),
(13, N'74849048', N'Lorena Selene', N'Blas', N'Herrera', N'983223421', N'S', CAST(N'2022-06-12' AS Date), NULL, N'Universitario'),
(14, N'70514545', N'Esther Karolay', N'Quilca', N'Leon', N'983268732', N'S', CAST(N'2023-02-20' AS Date), NULL, N'Universitario'),
(15, N'72628306', N'Claudia Lucero', N'Roman', N'Cotrina', N'983231234', N'S', CAST(N'2023-02-08' AS Date), NULL, N'Universitario');

SET IDENTITY_INSERT [dbo].[FISIOTERAPEUTAS] OFF;

SET IDENTITY_INSERT [dbo].[HORARIOS] ON;

INSERT [dbo].[HORARIOS] ([id_horario], [id_fisioteapeuta], [fecha], [turno]) 
VALUES 
(1, 10, CAST(N'2024-09-09' AS Date), N'Mañana'),
(2, 11, CAST(N'2024-09-09' AS Date), N'Mañana'),
(3, 12, CAST(N'2024-09-09' AS Date), N'Mañana'),
(4, 13, CAST(N'2024-09-09' AS Date), N'Tarde'),
(5, 14, CAST(N'2024-09-09' AS Date), N'Tarde'),
(6, 15, CAST(N'2024-09-09' AS Date), N'Tarde'),
(7, 10, CAST(N'2024-09-10' AS Date), N'Mañana'),
(8, 11, CAST(N'2024-09-10' AS Date), N'Mañana'),
(9, 12, CAST(N'2024-09-10' AS Date), N'Mañana'),
(10, 13, CAST(N'2024-09-10' AS Date), N'Tarde'),
(11, 14, CAST(N'2024-09-10' AS Date), N'Tarde'),
(12, 15, CAST(N'2024-09-10' AS Date), N'Tarde');

SET IDENTITY_INSERT [dbo].[HORARIOS] OFF;

SET IDENTITY_INSERT [dbo].[PACIENTES] ON;

INSERT [dbo].[PACIENTES] ([id_paciente], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [celular], [email], [fecha_de_nacimiento], [distrito], [estado_civil], [ocupacion], [numero_hijos]) 
VALUES 
(1, N'001103695', N'Giulio', N'Rotoli', N'Límaco', N'940499986', N'giuliort10@gmail.com', CAST(N'1996-05-05' AS Date), N'Miraflores', N'C', N'Independiente', 3),
(2, N'09273929', N'Manuel Antonio', N'Rodríguez', N'Vargas', N'954174037', N'tonyrodrigv@gmail.com', CAST(N'1961-08-07' AS Date), N'San Miguel', N'S', N'Independiente', 0),
(3, N'10766340', N'Maria', N'Ramos', N'Labrin', N'950120097', N'mperlar81@gmail.com', CAST(N'1955-01-05' AS Date), N'Ate', N'C', N'Ama de casa', 3),
(4, N'41839744', N'Gunther', N'Paredes', N'Romero', N'942149149', N'gunther.pa.ro@gmail.com', CAST(N'1983-02-08' AS Date), N'San Martín de Porres', N'S', N'Analista de compras', 0),
(5, N'10058293', N'Wolkmer', N'Ampuero', N'Valdivia', N'986918544', N'wolkmer22002@gmail.com', CAST(N'1972-11-19' AS Date), N'San Borja', N'S', N'Tecnico contratista', 1),
(6, N'40627075', N'Percy', N'Herrera', N'Reyna', N'991344652', N'percyherrera80@gmail.com', CAST(N'1980-05-29' AS Date), N'Miraflores', N'S', N'Ingeniero civil', 1);

SET IDENTITY_INSERT [dbo].[PACIENTES] OFF;

SET IDENTITY_INSERT [dbo].[PAGOS] ON;

INSERT [dbo].[PAGOS] ([id_pago], [fecha], [id_paciente], [id_valorizacion], [numero_cuotas], [monto], [tipo_doc], [numero_doc], [estado]) 
VALUES 
(1, CAST(N'2024-09-16T00:00:00.000' AS DateTime), 1, 2, 1, 288.0000, N'boleta', N'0011-459983', N'cancelado'),
(2, CAST(N'2024-09-17T00:00:00.000' AS DateTime), 2, 4, 1, 352.0000, N'boleta', N'0011-463322', N'cancelado'),
(3, CAST(N'2024-09-18T00:00:00.000' AS DateTime), 3, 6, 3, 138.0000, N'boleta', N'0011-445444', N'pendiente'),
(4, CAST(N'2024-09-19T00:00:00.000' AS DateTime), 4, 8, 3, 181.0000, N'factura', N'FC-002123123', N'pendiente'),
(5, CAST(N'2024-09-20T00:00:00.000' AS DateTime), 5, 10, 2, 400.0000, N'boleta', N'0011-423332', N'pendiente');

SET IDENTITY_INSERT [dbo].[PAGOS] OFF;

SET IDENTITY_INSERT [dbo].[PROGRAMAS] ON

INSERT INTO [dbo].[PROGRAMAS] ([id_programa], [nombre_programa], [descripcion_programa]) 
VALUES 
(1, N'Terapia Básica', N'Terapia de 30 minutos en camilla'),
(2, N'Terapia Avanzada', N'Terapia de 45 minutos con ejercicios adicionales'),
(3, N'Terapia Premium', N'Terapia de 60 minutos con equipos especializados'),
(4, N'Terapia Intensiva', N'Terapia de 90 minutos incluyendo evaluación integral'),
(5, N'Terapia Post-operatoria', N'Terapia especializada para recuperación post-quirúrgica');

SET IDENTITY_INSERT [dbo].[PROGRAMAS] OFF

SET IDENTITY_INSERT [dbo].[RESERVAS] ON;

INSERT [dbo].[RESERVAS] ([id_reserva], [id_paciente], [id_servicio], [id_programa], [id_fisioteapeuta], [id_valorizacion], [fecha_registro], [fecha_reserva], [hora_reserva], [estado]) 
VALUES 
(6, 1, 1, 2, 10, 2, CAST(N'2024-09-16' AS Date), CAST(N'2024-09-17' AS Date), CAST(N'11:00:00' AS Time), N'COMPLETADO'),
(7, 2, 1, 4, 11, 4, CAST(N'2024-09-16' AS Date), CAST(N'2024-09-18' AS Date), CAST(N'10:00:00' AS Time), N'COMPLETADO'),
(8, 3, 2, 1, 12, 6, CAST(N'2024-09-16' AS Date), CAST(N'2024-09-20' AS Date), CAST(N'10:00:00' AS Time), N'COMPLETADO'),
(9, 4, 2, 3, 13, 8, CAST(N'2024-09-16' AS Date), CAST(N'2024-09-23' AS Date), CAST(N'14:00:00' AS Time), N'RESERVADO'),
(10, 5, 2, 5, 14, 10, CAST(N'2024-09-16' AS Date), CAST(N'2024-09-25' AS Date), CAST(N'15:00:00' AS Time), N'RESERVADO');

SET IDENTITY_INSERT [dbo].[RESERVAS] OFF;

SET IDENTITY_INSERT [dbo].[SERVICIOS] ON;

INSERT [dbo].[SERVICIOS] ([id_servicio], [nombre_servicio], [descripcion_servicio]) 
VALUES 
(1, N'Paquete de terapias (2)', N'Paquete de 2 terapias'),
(2, N'Paquete de terapias (4)', N'Paquete de 4 terapias'),
(3, N'Paquete de terapias (12)', N'Paquete de 12 terapias');

SET IDENTITY_INSERT [dbo].[SERVICIOS] OFF;

SET IDENTITY_INSERT [dbo].[VALORIZACION] ON;

INSERT [dbo].[VALORIZACION] ([id_valorizacion], [id_servicio], [id_programa], [valorizacion]) 
VALUES 
(1, 1, 1, 224.0000),
(2, 1, 2, 288.0000),
(3, 1, 3, 288.0000),
(4, 1, 4, 352.0000),
(5, 1, 5, 416.0000),
(6, 2, 1, 416.0000),
(7, 2, 2, 544.0000),
(8, 2, 3, 544.0000),
(9, 2, 4, 672.0000),
(10, 2, 5, 800.0000),
(11, 3, 1, 1152.0000),
(12, 3, 2, 1536.0000),
(13, 3, 3, 1536.0000),
(14, 3, 4, 1920.0000),
(15, 3, 5, 2304.0000);

SET IDENTITY_INSERT [dbo].[VALORIZACION] OFF;