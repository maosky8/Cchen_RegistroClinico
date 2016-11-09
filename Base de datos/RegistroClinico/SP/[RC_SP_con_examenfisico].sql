/********************************************************************************************    
* Nombre del procedimiento      :  [RC_SP_con_examenfisico]  
* Fecha de creaci�n             :  17/10/2016  
* Usuario de creaci�n           :  Omar Cabezas    
* Versi�n.                      :  V.0.0.0.1    
* Objetivo                      :  Retorna todos los tipos de examenes fisicos
**********************************************************************************************/    
create PROCEDURE [dbo].[RC_SP_con_examenfisico]     
  
AS    
SELECT 
RC_EXAMENFISICO_id as ID,
RC_EXAMENFISICO_nombre as NOMBRE
FROM RC_EXAMENFISICO 
WHERE RC_EXAMENFISICO_vigencia = 1

