CREATE TABLE AU_TAREA
(
AU_TAREA_id int NOT NULL IDENTITY(1,1) ,
AU_TAREA_nombre varchar(100),
AU_TAREA_vigencia smallint,
AU_SISTEMA_id smallint FOREIGN KEY REFERENCES AU_SISTEMA(AU_SISTEMA_id),
PRIMARY KEY (AU_TAREA_id)
)

SELECT * FROM dbo.AU_TAREA at

INSERT INTO dbo.AU_TAREA VALUES ('RC_Menu_Cita', 1, 1)
INSERT INTO dbo.AU_TAREA VALUES ('RC_Menu_RegistroClinico', 1, 1)
INSERT INTO dbo.AU_TAREA VALUES ('RC_Accion_BuscarCita', 1, 1)
INSERT INTO dbo.AU_TAREA VALUES ('RC_Accion_NuevaCita', 1, 1)
INSERT INTO dbo.AU_TAREA VALUES ('RC_Accion_GrabarNuevaCita', 1, 1)
INSERT INTO dbo.AU_TAREA VALUES ('RC_Accion_ModificarCita', 1, 1)
INSERT INTO dbo.AU_TAREA VALUES ('RC_Accion_EliminarCita', 1, 1)
INSERT INTO dbo.AU_TAREA VALUES ('RC_Accion_BuscarRegistroClinico', 1, 1)
INSERT INTO dbo.AU_TAREA VALUES ('RC_Accion_NuevoPaciente', 1, 1)
INSERT INTO dbo.AU_TAREA VALUES ('RC_Accion_ModificarPaciente', 1, 1)
INSERT INTO dbo.AU_TAREA VALUES ('RC_Ver_HistorialAtenciones', 1, 1)
INSERT INTO dbo.AU_TAREA VALUES ('RC_Ver_LicenciaOperacional', 1, 1)
INSERT INTO dbo.AU_TAREA VALUES ('RC_Ver_AnalisisClinico', 1, 1)
INSERT INTO dbo.AU_TAREA VALUES ('RC_Ver_RegistroHistorico', 1, 1)
INSERT INTO dbo.AU_TAREA VALUES ('RC_Accion_GrabarNuevoPaciente', 1, 1)


