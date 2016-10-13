/********************************************************************************************    
* Nombre del procedimiento      :  [RC_SP_con_departamento]  
* Fecha de creación             :  29/09/2016  
* Usuario de creación           :  Omar Cabezas    
* Versión.                      :  V.0.0.0.1    
* Objetivo                      :  Retorna todos los tipos de departamento

**********************************************************************************************/    
create PROCEDURE [dbo].[RC_SP_con_departamento]     
  
AS    
SELECT RC_DEPARTAMENTO_id AS ID, RC_DEPARTAMENTO_nombre AS DEPARTAMENTO
FROM RC_DEPARTAMENTO
