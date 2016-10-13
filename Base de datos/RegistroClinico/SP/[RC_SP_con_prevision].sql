/********************************************************************************************    
* Nombre del procedimiento      :  [RC_SP_con_prevision]  
* Fecha de creación             :  26/09/2016  
* Usuario de creación           :  Omar Cabezas    
* Versión.                      :  V.0.0.0.1    
* Objetivo                      :  Retorna todos los tipos de previsión
**********************************************************************************************/    
create PROCEDURE [dbo].[RC_SP_con_prevision]     
  
AS    
SELECT RC_PREVISION_id AS ID, RC_PREVISION_nombre AS PREVISION
FROM RC_PREVISION

