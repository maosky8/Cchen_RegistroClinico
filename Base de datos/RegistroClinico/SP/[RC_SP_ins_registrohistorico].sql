/********************************************************************************************    
* Nombre del procedimiento      :  [RC_SP_ins_registrohistorico]  
* Fecha de creación             :  05/10/2016  
* Usuario de creación           :  Omar Cabezas    
* Versión.                      :  V.0.0.0.1    
* Objetivo                      :  Inserta archivo por paciente
[RC_SP_ins_registrohistorico] 16626344, 'Radiografía Pie', '.jpg', '10kb', '/upload/radiografia pie.jpg'
**********************************************************************************************/    
alter PROCEDURE [dbo].[RC_SP_ins_registrohistorico]     
@RUT int,
@NOMBRE varchar(50),
@EXTENSION varchar(50),
@TAMANO varchar(50),
@RUTA varchar(500)  
AS  
BEGIN  
INSERT INTO RC_ARCHIVOPACIENTE (RC_PACIENTE_rut, RC_ARCHIVOPACIENTE_nombre, RC_ARCHIVOPACIENTE_extension, RC_ARCHIVOPACIENTE_tamano, RC_ARCHIVOPACIENTE_ruta, RC_ARCHIVOPACIENTE_vigencia)
VALUES( @RUT, @NOMBRE, @EXTENSION, @TAMANO, @RUTA, 1)
END

