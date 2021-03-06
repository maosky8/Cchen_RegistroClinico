
/********************************************************************************************    
* Nombre del procedimiento      :  [[RC_SP_con_detalle_examenfisico]]  
* Fecha de creación             :  17/10/2016  
* Usuario de creación           :  Omar Cabezas    
* Versión.                      :  V.0.0.0.1    
* Objetivo                      :  Retorna todos los tipos de examenes fisicos
[RC_SP_con_detalle_examenfisico] 2
**********************************************************************************************/    
alter PROCEDURE [dbo].[RC_SP_con_detalle_examenfisico]     
@ID int = NULL
  
AS   
SET DATEFORMAT DMY 
SELECT 
LO.RC_LICENCIAOPERACIONAL_ID AS IDLICENCIA,
EF.RC_EXAMENFISICO_id AS IDEXAMEN,
LE.RC_APTITUDEXAMEN_id AS IDAPTITUD,
EF.RC_EXAMENFISICO_nombre AS NOMBREEXAMEN,
AE.RC_APTITUDEXAMEN_nombre AS NOMBREAPTITUD
FROM
RC_LICENCIAOPERACIONAL LO inner join
RC_LICENCIAOPERACIONAL_EXAMENFISICO LE ON LE.RC_LICENCIAOPERACIONAL_id = LO.RC_LICENCIAOPERACIONAL_id INNER JOIN 
RC_EXAMENFISICO EF ON EF.RC_EXAMENFISICO_id = LE.RC_EXAMENFISICO_id INNER JOIN 
RC_APTITUDEXAMEN AE ON AE.RC_APTITUDEXAMEN_id = LE.RC_APTITUDEXAMEN_id
WHERE 
LE.RC_LICENCIAOPERACIONAL_id = @ID AND EF.RC_EXAMENFISICO_vigencia = 1


