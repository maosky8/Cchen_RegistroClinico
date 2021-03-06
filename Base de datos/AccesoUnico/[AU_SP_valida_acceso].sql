USE [AccesoUnico_Prueba]
GO
/****** Object:  StoredProcedure [dbo].[AU_SP_valida_acceso]    Script Date: 08/24/2016 09:57:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/********************************************************************************************  
* Nombre del procedimiento      :  AU_SP_valida_acceso
* Fecha de creación             :  04/08/2016
* Usuario de creación           :  Omar Cabezas  
* Versión.                      :  V.0.0.0.1  
* Objetivo                      :  Retorna verdadero al validar acceso
[AU_SP_valida_acceso] 'ocabezas','hola',1
**********************************************************************************************/  
create PROCEDURE [dbo].[AU_SP_valida_acceso]   
@USUARIO varchar(20),  
@CONTRASENA varchar(20),
@SISTEMA int

AS  
  
BEGIN 

SELECT 1 AS ACCESO FROM dbo.AU_USUARIO au INNER JOIN dbo.AU_USUARIO_ROL urol 
ON urol.AU_USUARIO_rut = au.AU_USUARIO_rut INNER JOIN dbo.AU_ROL rol
ON rol.AU_ROL_id = urol.AU_ROL_id
WHERE PWDCOMPARE(@CONTRASENA, AU_USUARIO_pass) = 1 AND 
au.AU_USUARIO_user = @USUARIO AND au.AU_USUARIO_vigencia = 1
AND rol.AU_SISTEMA_id = @SISTEMA


END


 
