/********************************************************************************************    
* Nombre del procedimiento      :  [RC_SP_con_estado_cita]  
* Fecha de creación             :  30/08/2016  
* Usuario de creación           :  Omar Cabezas    
* Versión.                      :  V.0.0.0.1    
* Objetivo                      :  Retorna todos los posibles estados de citas

**********************************************************************************************/    
create PROCEDURE [dbo].[RC_SP_con_estado_cita]     
  
AS    
SELECT RC_ESTADOCITA_id AS ID, RC_ESTADOCITA_nombre AS ESTADOCITA
FROM RC_ESTADOCITA
WHERE RC_ESTADOCITA_vigencia = 1