/********************************************************************************************  
* Nombre del procedimiento      :  AU_SP_consulta_tarea
* Fecha de creación             :  04/08/2016
* Usuario de creación           :  Omar Cabezas  
* Versión.                      :  V.0.0.0.1  
* Objetivo                      :  Retorna 1 cuando rol tiene tarea
[AU_SP_consulta_tarea] 3, 'RC_Menu_Cita'
**********************************************************************************************/  
create PROCEDURE [dbo].[AU_SP_consulta_tarea]   
@ROL_ID int, 
@TAREA_NOMBRE varchar(50)
AS  
  
BEGIN 

SELECT COUNT(1) AS RESULTADO FROM AU_ROL_TAREA RT INNER JOIN AU_TAREA T on
RT.AU_ROL_id = @ROL_ID AND T.AU_TAREA_id = RT.AU_TAREA_id
WHERE T.AU_TAREA_nombre = @TAREA_NOMBRE 

END
 
