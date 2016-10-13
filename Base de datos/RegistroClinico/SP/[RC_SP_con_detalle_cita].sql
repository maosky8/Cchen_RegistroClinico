/********************************************************************************************    
* Nombre del procedimiento      :  [RC_SP_con_detalle_cita]  
* Fecha de creación             :  29/08/2016  
* Usuario de creación           :  Omar Cabezas    
* Versión.                      :  V.0.0.0.1    
* Objetivo                      :  Retorna detalle de citas dependiendo los filtros aplicados
[RC_SP_con_detalle_cita] 2

**********************************************************************************************/    
create PROCEDURE [dbo].[RC_SP_con_detalle_cita]     
@IDCITA int = NULL    
  
AS    
 SET DATEFORMAT dmy    
BEGIN

SELECT 
rc_cita_id AS ID,
Convert(varchar(11),rc_cita_fecha,103) AS FECHA,
h.rc_hora_tiempo AS HORA,
rc_cita_hora_real AS HORAREAL,
c.RC_TIPOCITA_id AS TIPOCITA,
isnull(c.rc_paciente_rut,0) AS RUT,
rc_cita_anexo AS NUMERO,
rc_cita_observaciones AS OBSERVACIONES,
rc_cita_prof_responsable AS RESPONSABLE,
ISNULL(c.RC_ESTADOCITA_id,0) AS ESTADO_CITA
 

FROM RC_CITA C INNER JOIN RC_HORA H 
ON h.RC_HORA_id = c.RC_hora_id 
WHERE RC_CITA_id = @IDCITA

END
        