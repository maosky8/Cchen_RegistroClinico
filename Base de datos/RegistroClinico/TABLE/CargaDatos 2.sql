select * from [RC_ANALISIS_LAB]
GO
SET IDENTITY_INSERT [dbo].[RC_UNIDADMEDIDA] ON 

GO
INSERT [dbo].[RC_UNIDADMEDIDA] ([RC_UNIDADMEDIDA_id], [RC_UNIDADMEDIDA_nombre]) VALUES (1, N'%')
GO
INSERT [dbo].[RC_UNIDADMEDIDA] ([RC_UNIDADMEDIDA_id], [RC_UNIDADMEDIDA_nombre]) VALUES (2, N'g/dL')
GO
INSERT [dbo].[RC_UNIDADMEDIDA] ([RC_UNIDADMEDIDA_id], [RC_UNIDADMEDIDA_nombre]) VALUES (3, N'ft')
GO
INSERT [dbo].[RC_UNIDADMEDIDA] ([RC_UNIDADMEDIDA_id], [RC_UNIDADMEDIDA_nombre]) VALUES (4, N'unid.')
GO
INSERT [dbo].[RC_UNIDADMEDIDA] ([RC_UNIDADMEDIDA_id], [RC_UNIDADMEDIDA_nombre]) VALUES (5, N'mm�')
GO
INSERT [dbo].[RC_UNIDADMEDIDA] ([RC_UNIDADMEDIDA_id], [RC_UNIDADMEDIDA_nombre]) VALUES (6, N'mm')
GO
INSERT [dbo].[RC_UNIDADMEDIDA] ([RC_UNIDADMEDIDA_id], [RC_UNIDADMEDIDA_nombre]) VALUES (7, N'mlU/L')
GO
INSERT [dbo].[RC_UNIDADMEDIDA] ([RC_UNIDADMEDIDA_id], [RC_UNIDADMEDIDA_nombre]) VALUES (8, N'ng/dl')
GO
INSERT [dbo].[RC_UNIDADMEDIDA] ([RC_UNIDADMEDIDA_id], [RC_UNIDADMEDIDA_nombre]) VALUES (9, N'ug/dl')
GO
SET IDENTITY_INSERT [dbo].[RC_UNIDADMEDIDA] OFF
GO


GO
INSERT [dbo].[RC_ANALISIS_LAB] ( [RC_ANALISIS_LAB_nombre], [RC_ANALISIS_LAB_referencia], [RC_UNIDADMEDIDA_id]) VALUES ( N'Hemograma', N'36-50%', 1)
GO
INSERT [dbo].[RC_ANALISIS_LAB] ( [RC_ANALISIS_LAB_nombre], [RC_ANALISIS_LAB_referencia], [RC_UNIDADMEDIDA_id]) VALUES ( N'Hematrocito', N'M: 12,1 - 15,1 g/dL <br> H: 13,8 - 17,2 g/dL  ', 2)
GO
INSERT [dbo].[RC_ANALISIS_LAB] ( [RC_ANALISIS_LAB_nombre], [RC_ANALISIS_LAB_referencia], [RC_UNIDADMEDIDA_id]) VALUES ( N'Hemoglobina', N'86 - 95 ft', 3)
GO
INSERT [dbo].[RC_ANALISIS_LAB] ( [RC_ANALISIS_LAB_nombre], [RC_ANALISIS_LAB_referencia], [RC_UNIDADMEDIDA_id]) VALUES ( N'VCM', N'28,2 - 32', 4)
GO
INSERT [dbo].[RC_ANALISIS_LAB] ( [RC_ANALISIS_LAB_nombre], [RC_ANALISIS_LAB_referencia], [RC_UNIDADMEDIDA_id]) VALUES ( N'HCbG', N'31,9 - 36', 4)
GO
INSERT [dbo].[RC_ANALISIS_LAB] ( [RC_ANALISIS_LAB_nombre], [RC_ANALISIS_LAB_referencia], [RC_UNIDADMEDIDA_id]) VALUES ( N'Leucocitos', N'3.500 - 10.000 mm�', 5)
GO
INSERT [dbo].[RC_ANALISIS_LAB] ( [RC_ANALISIS_LAB_nombre], [RC_ANALISIS_LAB_referencia], [RC_UNIDADMEDIDA_id]) VALUES ( N'Eosin�filo', N'0 - 4%', 1)
GO
INSERT [dbo].[RC_ANALISIS_LAB] ( [RC_ANALISIS_LAB_nombre], [RC_ANALISIS_LAB_referencia], [RC_UNIDADMEDIDA_id]) VALUES ( N'Bas�filos', N'0 - 1%', 1)
GO
INSERT [dbo].[RC_ANALISIS_LAB] ( [RC_ANALISIS_LAB_nombre], [RC_ANALISIS_LAB_referencia], [RC_UNIDADMEDIDA_id]) VALUES ( N'Mielocitos', N'0%', 1)
GO
INSERT [dbo].[RC_ANALISIS_LAB] ( [RC_ANALISIS_LAB_nombre], [RC_ANALISIS_LAB_referencia], [RC_UNIDADMEDIDA_id]) VALUES ( N'Juveniles', N'3 - 5%', 1)
GO
INSERT [dbo].[RC_ANALISIS_LAB] ( [RC_ANALISIS_LAB_nombre], [RC_ANALISIS_LAB_referencia], [RC_UNIDADMEDIDA_id]) VALUES ( N'Segmentados', N'55 - 65%', 1)
GO
INSERT [dbo].[RC_ANALISIS_LAB] ( [RC_ANALISIS_LAB_nombre], [RC_ANALISIS_LAB_referencia], [RC_UNIDADMEDIDA_id]) VALUES ( N'Linfocitos', N'25 - 35%', 1)
GO
INSERT [dbo].[RC_ANALISIS_LAB] ( [RC_ANALISIS_LAB_nombre], [RC_ANALISIS_LAB_referencia], [RC_UNIDADMEDIDA_id]) VALUES ( N'Monocitos', N'4 - 8%', 1)
GO
INSERT [dbo].[RC_ANALISIS_LAB] ( [RC_ANALISIS_LAB_nombre], [RC_ANALISIS_LAB_referencia], [RC_UNIDADMEDIDA_id]) VALUES ( N'Recuento plaquetario', N'150.000 - 450.000 mm�', 5)
GO
INSERT [dbo].[RC_ANALISIS_LAB] ( [RC_ANALISIS_LAB_nombre], [RC_ANALISIS_LAB_referencia], [RC_UNIDADMEDIDA_id]) VALUES ( N'VHS', N'M: <= 14mm <br> H: <=12mm', 6)
GO
INSERT [dbo].[RC_ANALISIS_LAB] ( [RC_ANALISIS_LAB_nombre], [RC_ANALISIS_LAB_referencia], [RC_UNIDADMEDIDA_id]) VALUES ( N'TSH', N'0,4 - 4 mlU/L', 7)
GO
INSERT [dbo].[RC_ANALISIS_LAB] ( [RC_ANALISIS_LAB_nombre], [RC_ANALISIS_LAB_referencia], [RC_UNIDADMEDIDA_id]) VALUES ( N'T3', N'100 - 200 ng/dl', 8)
GO
INSERT [dbo].[RC_ANALISIS_LAB] ( [RC_ANALISIS_LAB_nombre], [RC_ANALISIS_LAB_referencia], [RC_UNIDADMEDIDA_id]) VALUES ( N'T4', N'4,5 y 12,5 ug/dl', 9)
GO
SET IDENTITY_INSERT [dbo].[RC_ANALISIS_LAB] OFF
GO
SET IDENTITY_INSERT [dbo].[RC_ESTADO] ON 

GO
INSERT [dbo].[RC_ESTADO] ( [RC_ESTADO_nombre]) VALUES ( N'Iniciado')
GO
INSERT [dbo].[RC_ESTADO] ( [RC_ESTADO_nombre]) VALUES ( N'Cerrado')
GO
SET IDENTITY_INSERT [dbo].[RC_ESTADO] OFF
GO
