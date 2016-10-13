/********************************************************************************************    
* Nombre del procedimiento      :  [RC_SP_con_tipo_cita]  
* Fecha de creaci�n             :  30/08/2016  
* Usuario de creaci�n           :  Omar Cabezas    
* Versi�n.                      :  V.0.0.0.1    
* Objetivo                      :  Retorna todos los posibles tipos de citas

**********************************************************************************************/    
create PROCEDURE [dbo].[RC_SP_con_tipo_cita]     
  
AS    
SELECT RC_TIPOCITA_id AS ID, RC_TIPOCITA_nombre AS TIPOCITA
FROM RC_TIPOCITA
WHERE RC_TIPOCITA_vigencia = 1