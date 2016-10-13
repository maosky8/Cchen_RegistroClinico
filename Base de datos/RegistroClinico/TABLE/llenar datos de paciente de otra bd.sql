USE RegistroClinico_Prueba
GO

INSERT INTO [RegistroClinico_Prueba].[dbo].[RC_Paciente](RC_PACIENTE_rut,	RC_PACIENTE_dv,	RC_PACIENTE_nombre)
   SELECT RUT_PERSO, DV_PERSO, NOMBRE
     FROM [Personal].[dbo].[Persona]
