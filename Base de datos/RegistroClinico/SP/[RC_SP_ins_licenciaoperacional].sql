
/********************************************************************************************      
* Nombre del procedimiento      :  [RC_SP_ins_licenciaoperacional]    
* Fecha de creación             :  27/10/2016    
* Usuario de creación           :  Omar Cabezas      
* Versión.                      :  V.0.0.0.1      
* Objetivo                      :  Inserta relacion paciente-medico
[RC_SP_ins_licenciaoperacional] 2, 1, 50, 'ok', '27-10-2016',   '27-10-2016', '27-10-2016'
**********************************************************************************************/      
alter PROCEDURE [dbo].[RC_SP_ins_licenciaoperacional]      
@REGISTROCLINICOID int,
@ESTADO int,
@DIAS int,
@APRECIACION varchar(200),
@FECHAREGISTRO varchar(10),
@FECHAINICIO varchar(10),
@FECHAFIN varchar(10)


AS 
BEGIN
SET DATEFORMAT DMY
	INSERT INTO RC_LICENCIAOPERACIONAL(	
		RC_REGISTROCLINICO_id,
		RC_ESTADOLICENCIAOPERACIONAL_id,
		RC_LICENCIAOPERACIONAL_dias,
		RC_LICENCIAOPERACIONAL_apreciacion,
		RC_LICENCIAOPERACIONAL_fecharegistro,
		RC_LICENCIAOPERACIONAL_fechainicio,
		RC_LICENCIAOPERACIONAL_fechafin,
		RC_LICENCIAOPERACIONAL_vigencia)
		VALUES
		(@REGISTROCLINICOID,
		@ESTADO,
		@DIAS,
		@APRECIACION,
		@FECHAREGISTRO,
		@FECHAINICIO,
		@FECHAFIN,
		1)

		SELECT SCOPE_IDENTITY() as ID
END


