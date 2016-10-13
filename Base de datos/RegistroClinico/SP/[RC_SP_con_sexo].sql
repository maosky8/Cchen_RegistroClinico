/********************************************************************************************    
* Nombre del procedimiento      :  [RC_SP_con_sexo]  
* Fecha de creación             :  26/09/2016  
* Usuario de creación           :  Omar Cabezas    
* Versión.                      :  V.0.0.0.1    
* Objetivo                      :  Retorna todos los tipos de sexo

**********************************************************************************************/    
create PROCEDURE [dbo].[RC_SP_con_sexo]     
  
AS    
SELECT RC_SEXO_id AS ID, RC_SEXO_nombre AS SEXO
FROM RC_SEXO
