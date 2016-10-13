/********************************************************************************************    
* Nombre del procedimiento      :  [RC_SP_con_registrohistorico]  
* Fecha de creación             :  05/10/2016  
* Usuario de creación           :  Omar Cabezas    
* Versión.                      :  V.0.0.0.1    
* Objetivo                      :  Retorna todos los archivos historicos por paciente
[RC_SP_con_registrohistorico] 16626344,37
**********************************************************************************************/    
create PROCEDURE [dbo].[RC_SP_con_registrohistorico]     
@RUT int = NULL,
@ID int = NULL    
AS  
BEGIN  
SELECT DISTINCT 
RC_ARCHIVOPACIENTE_id as ID,
RC_ARCHIVOPACIENTE_nombre as NOMBRE,
RC_ARCHIVOPACIENTE_extension as EXTENSION,
RC_ARCHIVOPACIENTE_tamano as TAMANO,
RC_ARCHIVOPACIENTE_ruta as RUTA 
from RC_ARCHIVOPACIENTE where RC_PACIENTE_rut = @RUT and RC_ARCHIVOPACIENTE_vigencia = 1 and RC_ARCHIVOPACIENTE_id = isnull(@ID,RC_ARCHIVOPACIENTE_id)
END