/********************************************************************************************  
* Nombre del procedimiento      :  AU_SP_valida_acceso
* Fecha de creación             :  04/08/2016
* Usuario de creación           :  Omar Cabezas  
* Versión.                      :  V.0.0.0.1  
* Objetivo                      :  Retorna verdadero al validar acceso
[AU_SP_valida_acceso] 'ocabezas','hola'
**********************************************************************************************/  
CREATE PROCEDURE [dbo].[AU_SP_valida_acceso]   
@USUARIO varchar(20),  
@CONTRASENA varchar(20)
AS  
  
BEGIN 

SELECT 1 AS ACCESO FROM dbo.AU_USUARIO au
WHERE PWDCOMPARE(@CONTRASENA, AU_USUARIO_pass) = 1 AND 
au.AU_USUARIO_user = @USUARIO AND au.AU_USUARIO_vigencia = 1


END
 
