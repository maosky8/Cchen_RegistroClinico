/********************************************************************************************    
* Nombre del procedimiento      :  [RC_SP_con_sede]  
* Fecha de creaci�n             :  26/09/2016  
* Usuario de creaci�n           :  Omar Cabezas    
* Versi�n.                      :  V.0.0.0.1    
* Objetivo                      :  Retorna todos los tipos de sede

**********************************************************************************************/    
create PROCEDURE [dbo].[RC_SP_con_sede]     
  
AS    
SELECT RC_SEDE_id AS ID, RC_SEDE_nombre AS SEDE
FROM RC_SEDE
