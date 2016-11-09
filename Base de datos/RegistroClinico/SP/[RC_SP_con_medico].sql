/********************************************************************************************    
* Nombre del procedimiento      :  [RC_SP_con_medico]  
* Fecha de creación             :  17/10/2016  
* Usuario de creación           :  Omar Cabezas    
* Versión.                      :  V.0.0.0.1    
* Objetivo                      :  Retorna todos los medicos
**********************************************************************************************/    
create PROCEDURE [dbo].[RC_SP_con_medico]     
  
AS    
SELECT RC_MEDICO_rut AS RUT, 
RC_MEDICO_nombre+' '+RC_MEDICO_app_paterno+' '+RC_MEDICO_app_materno AS NOMBRE
FROM RC_MEDICO
