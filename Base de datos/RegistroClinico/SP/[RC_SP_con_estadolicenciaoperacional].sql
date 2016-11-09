/********************************************************************************************    
* Nombre del procedimiento      :  [RC_SP_con_estadolicenciaoperacional]  
* Fecha de creaci�n             :  7/10/2016  
* Usuario de creaci�n           :  Omar Cabezas    
* Versi�n.                      :  V.0.0.0.1    
* Objetivo                      :  Retorna todos los medicos
**********************************************************************************************/    
create PROCEDURE [dbo].[RC_SP_con_estadolicenciaoperacional]     
  
AS    
SELECT RC_ESTADOLICENCIAOPERACIONAL_id AS ID, 
RC_ESTADOLICENCIAOPERACIONAL_nombre AS NOMBRE
FROM RC_ESTADOLICENCIAOPERACIONAL 
WHERE RC_ESTADOLICENCIAOPERACIONAL_vigencia = 1
