/********************************************************************************************    
* Nombre del procedimiento      :  [RC_SP_con_sexo]  
* Fecha de creaci�n             :  26/09/2016  
* Usuario de creaci�n           :  Omar Cabezas    
* Versi�n.                      :  V.0.0.0.1    
* Objetivo                      :  Retorna todos los tipos de sexo

**********************************************************************************************/    
create PROCEDURE [dbo].[RC_SP_con_sexo]     
  
AS    
SELECT RC_SEXO_id AS ID, RC_SEXO_nombre AS SEXO
FROM RC_SEXO
