
/********************************************************************************************  
* Nombre del procedimiento      :  AU_SP_consulta_rol
* Fecha de creación             :  04/08/2016
* Usuario de creación           :  Omar Cabezas  
* Versión.                      :  V.0.0.0.1  
* Objetivo                      :  Retorna lista de roles para un sistema
[AU_SP_consulta_rol] 'ocabezas',1
**********************************************************************************************/  
ALTER PROCEDURE [dbo].[AU_SP_consulta_rol]   
@USUARIO_USER varchar(20),  
@SISTEMA int
AS  
  
BEGIN 
SELECT /*TOP 1*/ ROL.AU_ROL_id, ROL.AU_ROL_nombre, UR.AU_USUARIO_rut, AUR.AU_USUARIO_mail
FROM 
AU_USUARIO_ROL UR INNER JOIN 
AU_ROL ROL ON UR.AU_ROL_id = ROL.AU_ROL_id INNER JOIN 
AU_USUARIO AUR ON AUR.AU_USUARIO_rut = UR.AU_USUARIO_rut
WHERE AUR.AU_USUARIO_user = @USUARIO_USER AND ROL.AU_SISTEMA_id = @SISTEMA 

END


