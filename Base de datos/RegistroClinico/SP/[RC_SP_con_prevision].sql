/********************************************************************************************    
* Nombre del procedimiento      :  [RC_SP_con_prevision]  
* Fecha de creaci�n             :  26/09/2016  
* Usuario de creaci�n           :  Omar Cabezas    
* Versi�n.                      :  V.0.0.0.1    
* Objetivo                      :  Retorna todos los tipos de previsi�n
**********************************************************************************************/    
create PROCEDURE [dbo].[RC_SP_con_prevision]     
  
AS    
SELECT RC_PREVISION_id AS ID, RC_PREVISION_nombre AS PREVISION
FROM RC_PREVISION

