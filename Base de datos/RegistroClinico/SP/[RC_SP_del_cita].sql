/********************************************************************************************      
* Nombre del procedimiento      :  [RC_SP_del_cita]    
* Fecha de creaci�n             :  29/08/2016    
* Usuario de creaci�n           :  Omar Cabezas      
* Versi�n.                      :  V.0.0.0.1      
* Objetivo                      :  Borra datos de cita  
[RC_SP_del_cita] 2  
**********************************************************************************************/      
create PROCEDURE [dbo].[RC_SP_del_cita]      
@ID int  
      
AS      
BEGIN  
UPDATE RC_CITA SET RC_CITA_vigencia = 0 WHERE RC_CITA_id = @ID  
END  

