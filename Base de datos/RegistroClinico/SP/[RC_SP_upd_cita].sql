/********************************************************************************************    
* Nombre del procedimiento      :  [RC_SP_upd_cita]  
* Fecha de creación             :  29/08/2016  
* Usuario de creación           :  Omar Cabezas    
* Versión.                      :  V.0.0.0.1    
* Objetivo                      :  Actualiza datos de cita
[RC_SP_del_cita] 2,16626
**********************************************************************************************/    
create PROCEDURE [dbo].[RC_SP_upd_cita]    
@ID int,
@RUT int = NULL,    
@TIPOCITA int, 
@ESTADOCITA int,   
@OBSERVACIONES varchar(500) = null,
@HORAREAL varchar(5) = null,
@NUMERO varchar(12) = null,
@RESPONSABLE varchar(100)
    
AS    
 SET DATEFORMAT dmy    
BEGIN
UPDATE RC_CITA
SET
RC_paciente_rut = @RUT,
RC_tipocita_id = @TIPOCITA,
RC_estadocita_id = @ESTADOCITA,
RC_cita_observaciones = @OBSERVACIONES,
RC_CITA_hora_real = @HORAREAL,
rc_cita_anexo = @NUMERO,
rc_cita_prof_responsable = @RESPONSABLE
WHERE RC_CITA_id = @ID

END

