/********************************************************************************************    
* Nombre del procedimiento      :  [RC_SP_con_paciente]  
* Fecha de creaci�n             :  30/08/2016  
* Usuario de creaci�n           :  Omar Cabezas    
* Versi�n.                      :  V.0.0.0.1    
* Objetivo                      :  Retorna todos los pacientes agregados

**********************************************************************************************/    
create PROCEDURE [dbo].[RC_SP_con_paciente]     
  
AS    
SELECT RC_PACIENTE_rut AS RUT, 
RC_PACIENTE_nombre+' '+RC_PACIENTE_app_paterno+' '+RC_PACIENTE_app_materno AS NOMBRE
FROM RC_PACIENTE
ORDER BY NOMBRE
