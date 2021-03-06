
/********************************************************************************************    
* Nombre del procedimiento      :  [RC_SP_con_detalle_licenciaoperacional]  
* Fecha de creación             :  17/10/2016  
* Usuario de creación           :  Omar Cabezas    
* Versión.                      :  V.0.0.0.1    
* Objetivo                      :  Retorna todos los tipos de examenes fisicos
[RC_SP_con_detalle_licenciaoperacional] 2
**********************************************************************************************/    
ALTER PROCEDURE [dbo].[RC_SP_con_detalle_licenciaoperacional]     
@ID int
  
AS   
SET DATEFORMAT DMY 
SELECT 
RC_LICENCIAOPERACIONAL_ID AS ID,
'LIC_OPE_'+CONVERT(varchar,RC_LICENCIAOPERACIONAL_ID) as IDNOMBRELICENCIAOPERACIONAL,
RC_MEDICO_NOMBRE+' '+RC_MEDICO_app_paterno+' '+RC_MEDICO_app_materno AS NOMBREMEDICO,
CONVERT(VARCHAR,RC_LICENCIAOPERACIONAL_FECHAREGISTRO,103) AS FECHAREGISTRO,
CONVERT(VARCHAR,RC_LICENCIAOPERACIONAL_FECHAINICIO,103) AS FECHAINICIO,
CONVERT(VARCHAR,RC_LICENCIAOPERACIONAL_FECHAFIN,103) AS FECHAFIN,
RC_ESTADOLICENCIAOPERACIONAL_NOMBRE AS ESTADO,
LO.RC_LICENCIAOPERACIONAL_apreciacion AS APRECIACION,
LO.RC_LICENCIAOPERACIONAL_dias AS DIAS,
LO.RC_ESTADOLICENCIAOPERACIONAL_id as ESTADOID
FROM
RC_REGISTROCLINICO RC INNER JOIN 
RC_LICENCIAOPERACIONAL LO ON RC.RC_REGISTROCLINICO_ID = LO.RC_REGISTROCLINICO_ID INNER JOIN
RC_ESTADOLICENCIAOPERACIONAL ELO ON LO.RC_ESTADOLICENCIAOPERACIONAL_ID = ELO.RC_ESTADOLICENCIAOPERACIONAL_ID INNER JOIN 
RC_MEDICO ME ON ME.RC_MEDICO_RUT = RC.RC_MEDICO_RUT 
WHERE 
LO.RC_LICENCIAOPERACIONAL_id = @ID


