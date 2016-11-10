/********************************************************************************************    
* Nombre del procedimiento      :  [RC_SP_upd_licenciaoperacional]  
* Fecha de creaci�n             :  09/11/2016  
* Usuario de creaci�n           :  Omar Cabezas    
* Versi�n.                      :  V.0.0.0.1    
* Objetivo                      :  Actualiza datos de una licencia operacional
[RC_SP_del_cita] 2,16626
**********************************************************************************************/    
alter PROCEDURE [dbo].[RC_SP_upd_licenciaoperacional]    
@ID int,
@DIAS int,    
@ESTADO int,   
@APRECIACION varchar(500) = null
    
AS    
 SET DATEFORMAT dmy    
BEGIN
UPDATE RC_LICENCIAOPERACIONAL
SET
RC_LICENCIAOPERACIONAL_dias = @DIAS,
RC_ESTADOLICENCIAOPERACIONAL_id = @ESTADO,
RC_LICENCIAOPERACIONAL_apreciacion = @APRECIACION
WHERE RC_LICENCIAOPERACIONAL_id = @ID

END