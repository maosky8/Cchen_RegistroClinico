/********************************************************************************************    
* Nombre del procedimiento      :  [RC_SP_con_estadocivil]  
* Fecha de creación             :  26/09/2016  
* Usuario de creación           :  Omar Cabezas    
* Versión.                      :  V.0.0.0.1    
* Objetivo                      :  Retorna todos los tipos de estados civiles

**********************************************************************************************/    
create PROCEDURE [dbo].[RC_SP_con_estadocivil]     
  
AS    
SELECT RC_ESTADOCIVIL_id AS ID, RC_ESTADOCIVIL_nombre AS ESTADOCIVIL
FROM RC_ESTADOCIVIL
