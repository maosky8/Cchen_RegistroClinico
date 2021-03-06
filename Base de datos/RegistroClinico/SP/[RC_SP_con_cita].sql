USE [RegistroClinico_Prueba]
GO
/****** Object:  StoredProcedure [dbo].[RC_SP_con_cita]    Script Date: 09/07/2016 11:51:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/********************************************************************************************    
* Nombre del procedimiento      :  [RC_SP_con_cita]  
* Fecha de creación             :  29/08/2016  
* Usuario de creación           :  Omar Cabezas    
* Versión.                      :  V.0.0.0.1    
* Objetivo                      :  Retorna grilla de citas dependiendo los filtros aplicados
[RC_SP_con_cita] null,null,null,'15-09-2016'
[RC_SP_con_cita] 16626344,null,null,null '25-08-2016'
[RC_SP_con_cita] null,null,null,null
[RC_SP_con_cita] 5444521,null,null,'15-09-2016'
**********************************************************************************************/    
create PROCEDURE [dbo].[RC_SP_con_cita]     
@RUT int = NULL,    
@TIPOCITA int = NULL, 
@ESTADOCITA int = NULL,      
@FECHACITA varchar(10) = NULL  
  
AS    
 SET DATEFORMAT dmy    
BEGIN


IF(ISNULL(@FECHACITA,'') != '')
BEGIN  
	IF(ISNULL(@RUT,0)<>0 OR isnull(@TIPOCITA,0) <> 0 OR isnull(@ESTADOCITA,0) <> 0)
	BEGIN
        
		SELECT 
		isnull(c.RC_cita_id,0) AS ID_CITA,
		CONVERT(varchar(11),@FECHACITA,103) AS FECHA_CITA,
		--ISNULL(CONVERT(varchar(11),c.RC_CITA_fecha,103),'') AS FECHA_CITA,
		h.RC_HORA_tiempo AS HORA_CITA,
		ISNULL(c.RC_CITA_hora_real,'') AS HORA_REAL_CITA,
		ISNULL(p.RC_PACIENTE_nombre+' '+p.RC_PACIENTE_app_paterno+' '+p.RC_PACIENTE_app_materno,'') AS PACIENTE,
		ISNULL(CONVERT(varchar(8),p.RC_PACIENTE_rut)+'-'+p.RC_PACIENTE_dv,'') as RUT_PACIENTE,
		ISNULL(TC.RC_TIPOCITA_nombre,'') AS TIPO_CITA,
		ISNULL(EC.RC_ESTADOCITA_nombre,'') AS ESTADO_CITA

  		FROM rc_hora h INNER JOIN rc_cita c 
		ON h.rc_hora_id = c.rc_hora_id 
		AND c.rc_cita_vigencia = 1
		AND c.rc_cita_fecha = @FECHACITA
		AND c.rc_estadocita_id = isnull(@ESTADOCITA,c.rc_estadocita_id)
		AND c.rc_tipocita_id = isnull(@TIPOCITA,c.rc_tipocita_id) 
		AND c.rc_paciente_rut = isnull(@RUT,c.rc_paciente_rut) left JOIN rc_paciente p
		ON p.rc_paciente_rut = isnull(@RUT,c.rc_paciente_rut) left JOIN rc_estadocita ec
		ON ec.rc_estadocita_id = c.rc_estadocita_id left JOIN rc_tipocita tc
		ON tc.rc_tipocita_id = c.rc_tipocita_id
		WHERE rc_hora_vigencia = 1 
	END 
	ELSE
	BEGIN
		SELECT 
		isnull(c.RC_cita_id,0) AS ID_CITA,
		CONVERT(varchar(11),@FECHACITA,103) AS FECHA_CITA,
		--ISNULL(CONVERT(varchar(11),c.RC_CITA_fecha,103),'') AS FECHA_CITA,
		h.RC_HORA_tiempo AS HORA_CITA,
		ISNULL(c.RC_CITA_hora_real,'') AS HORA_REAL_CITA,
		ISNULL(p.RC_PACIENTE_nombre+' '+p.RC_PACIENTE_app_paterno+' '+p.RC_PACIENTE_app_materno,'') AS PACIENTE,
		ISNULL(CONVERT(varchar(8),p.RC_PACIENTE_rut)+'-'+p.RC_PACIENTE_dv,'') as RUT_PACIENTE,
		ISNULL(TC.RC_TIPOCITA_nombre,'') AS TIPO_CITA,
		ISNULL(EC.RC_ESTADOCITA_nombre,'') AS ESTADO_CITA

  		FROM rc_hora h LEFT JOIN rc_cita c 
		ON h.rc_hora_id = c.rc_hora_id 
		AND c.rc_cita_vigencia = 1
		AND c.rc_cita_fecha = @FECHACITA
		AND c.rc_estadocita_id = isnull(@ESTADOCITA,c.rc_estadocita_id)
		AND c.rc_tipocita_id = isnull(@TIPOCITA,c.rc_tipocita_id) left JOIN rc_paciente p
		ON p.rc_paciente_rut = isnull(@RUT,c.rc_paciente_rut) left JOIN rc_estadocita ec
		ON ec.rc_estadocita_id = c.rc_estadocita_id left JOIN rc_tipocita tc
		ON tc.rc_tipocita_id = c.rc_tipocita_id
		WHERE rc_hora_vigencia = 1 
	END
  
END  
ELSE 
BEGIN 

	SELECT 
	isnull(c.RC_cita_id,0) AS ID_CITA,
	ISNULL(CONVERT(varchar(11),c.RC_CITA_fecha,103),'') AS FECHA_CITA,
	h.RC_HORA_tiempo AS HORA_CITA,
	ISNULL(c.RC_CITA_hora_real,'') AS HORA_REAL_CITA,
	ISNULL(p.RC_PACIENTE_nombre+' '+p.RC_PACIENTE_app_paterno+' '+p.RC_PACIENTE_app_materno,'') AS PACIENTE,
	ISNULL(CONVERT(varchar(8),p.RC_PACIENTE_rut)+'-'+p.RC_PACIENTE_dv,'') as RUT_PACIENTE,
	ISNULL(TC.RC_TIPOCITA_nombre,'') AS TIPO_CITA,
	ISNULL(EC.RC_ESTADOCITA_nombre,'') AS ESTADO_CITA

  	FROM rc_hora h INNER JOIN rc_cita c 
	ON h.rc_hora_id = c.rc_hora_id 
	AND c.rc_cita_vigencia = 1
	--AND c.rc_cita_fecha = @FECHACITA
	AND c.rc_estadocita_id = isnull(@ESTADOCITA,c.rc_estadocita_id)
	AND c.rc_tipocita_id = isnull(@TIPOCITA,c.rc_tipocita_id) left JOIN rc_paciente p
	ON p.rc_paciente_rut = c.rc_paciente_rut 
	AND p.rc_paciente_rut = isnull(@RUT,p.rc_paciente_rut) left JOIN rc_estadocita ec
	ON ec.rc_estadocita_id = c.rc_estadocita_id left JOIN rc_tipocita tc
	ON tc.rc_tipocita_id = c.rc_tipocita_id
	WHERE rc_hora_vigencia = 1 AND p.rc_paciente_rut = isnull(@RUT,p.rc_paciente_rut)
	

	
END

END 
  
   