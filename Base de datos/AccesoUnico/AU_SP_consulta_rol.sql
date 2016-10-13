/********************************************************************************************  
* Nombre del procedimiento      :  AU_SP_consulta_rol
* Fecha de creación             :  04/08/2016
* Usuario de creación           :  Omar Cabezas  
* Versión.                      :  V.0.0.0.1  
* Objetivo                      :  Retorna lista de roles para un sistema
[AU_SP_consulta_rol] 16626344,1
**********************************************************************************************/  
create PROCEDURE [dbo].[AU_SP_consulta_rol]   
@USUARIO_RUT int,  
@SISTEMA_ID int
AS  
  
BEGIN 
SELECT TOP 1 ROL.AU_ROL_id, ROL.AU_ROL_nombre FROM AU_USUARIO_ROL UR INNER JOIN AU_ROL ROL ON UR.AU_ROL_id = ROL.AU_ROL_id
WHERE UR.AU_USUARIO_rut = @USUARIO_RUT AND ROL.AU_SISTEMA_id = @SISTEMA_ID 

END
 
