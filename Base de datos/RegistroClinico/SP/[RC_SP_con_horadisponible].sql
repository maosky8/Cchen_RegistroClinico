/********************************************************************************************      
* Nombre del procedimiento      :  [RC_SP_con_horadisponible]    
* Fecha de creación             :  29/08/2016    
* Usuario de creación           :  Omar Cabezas      
* Versión.                      :  V.0.0.0.1      
* Objetivo                      :  Entrega horas disponibles para agendar cita
[RC_SP_con_horadisponible] '2016-09-13'
**********************************************************************************************/      
create PROCEDURE [dbo].[RC_SP_con_horadisponible]      
@FECHA varchar(10) = null  
      
AS    
 SET DATEFORMAT ymd    
BEGIN  
IF(ISNULL(@FECHA,'') != '')
	BEGIN 
		SELECT h.rc_hora_id AS ID, h.rc_hora_tiempo AS HORA FROM rc_hora h LEFT OUTER JOIN rc_cita c ON c.rc_hora_id = h.rc_hora_id AND c.rc_cita_fecha = @FECHA AND c.rc_cita_vigencia = 1 WHERE c.rc_hora_id IS null
	END 
ELSE 
	BEGIN
		SELECT h.rc_hora_id AS ID, h.rc_hora_tiempo AS HORA FROM rc_hora h
	END  
END  
