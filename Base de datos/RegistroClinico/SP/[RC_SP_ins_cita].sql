/********************************************************************************************      
* Nombre del procedimiento      :  [RC_SP_ins_cita]    
* Fecha de creación             :  13/09/2016    
* Usuario de creación           :  Omar Cabezas      
* Versión.                      :  V.0.0.0.1      
* Objetivo                      :  Inserta citas
SELECT * FROM rc_cita
[RC_SP_ins_cita] '2016-09-14',2,1,1,16626344,123,'adasd','DOCTOR'
[RC_SP_ins_cita] '2016-09-14',3,1,1,null,123,'adasd','DOCTOR'
**********************************************************************************************/      
create PROCEDURE [dbo].[RC_SP_ins_cita]      
@FECHA varchar(10),
@HORA int,
@TIPOCITA int,
@ESTADOCITA int,
@RUT int = null,
@NUMERO varchar(12) = null,  
@OBSERVACIONES varchar(500) = null,
@RESPONSABLE varchar(100)

AS 
SET DATEFORMAT ymd
BEGIN
	INSERT INTO RC_CITA (	RC_CITA_fecha, rc_hora_id, rc_tipocita_id, rc_estadocita_id, rc_paciente_rut, 
							rc_cita_anexo,rc_cita_observaciones, rc_cita_prof_responsable, rc_cita_vigencia) 
				VALUES	(	@FECHA, @HORA, @TIPOCITA, @ESTADOCITA, @RUT, @NUMERO, @OBSERVACIONES, @RESPONSABLE, 1)
END

