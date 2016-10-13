
/********************************************************************************************    
* Nombre del procedimiento      :  [RC_SP_con_registroclinico]  
* Fecha de creación             :  26/09/2016  
* Usuario de creación           :  Omar Cabezas    
* Versión.                      :  V.0.0.0.1    
* Objetivo                      :  Retorna grilla de pacientes dependiendo los filtros aplicados

**********************************************************************************************/    
create PROCEDURE [dbo].[RC_SP_con_registroclinico]  
@RUT int = NULL,    
@SEXO int = NULL, 
@SEDE int = NULL
  
AS      
BEGIN
        
		SELECT 
		RC_PACIENTE_rut AS IDRUTPACIENTE,
		ISNULL(CONVERT(varchar(8),p.RC_PACIENTE_rut)+'-'+p.RC_PACIENTE_dv,'') as RUTPACIENTE,
		ISNULL(SUBSTRING(UPPER(p.RC_PACIENTE_nombre),1,100)+' '+SUBSTRING(UPPER(p.RC_PACIENTE_app_paterno),1,100)+' '+SUBSTRING(UPPER(p.RC_PACIENTE_app_materno),1,100),'') AS NOMBREPACIENTE,
		s.RC_SEXO_nombre AS SEXO,
		d.RC_SEDE_nombre AS SEDE,
		dp.RC_DEPARTAMENTO_nombre AS DEPARTAMENTO

		FROM 
		rc_paciente p INNER JOIN 
		rc_sexo s ON s.rc_sexo_id = p.rc_sexo_id INNER JOIN 
		rc_sede d ON d.rc_sede_id = p.rc_sede_id INNER JOIN 
		rc_departamento dp ON dp.rc_departamento_id = p.rc_departamento_id 
		
		WHERE p.RC_PACIENTE_rut = isnull(@RUT, p.RC_PACIENTE_rut) AND 
		s.RC_SEXO_id = isnull(@SEXO, s.RC_SEXO_id) AND 
		d.RC_SEDE_id = isnull(@SEDE, d.RC_SEDE_id)


END 
  
   