/********************************************************************************************      
* Nombre del procedimiento      :  [RC_SP_del_analisisclinico]    
* Fecha de creaci�n             :  29/08/2016    
* Usuario de creaci�n           :  Omar Cabezas      
* Versi�n.                      :  V.0.0.0.1      
* Objetivo                      :  Borra datos de licencia operacional  
[RC_SP_del_cita] 2  
**********************************************************************************************/      
create PROCEDURE [dbo].[RC_SP_del_analisisclinico]      
@ID int  
      
AS      
BEGIN  
UPDATE RC_ANALISISCLINICO SET RC_ANALISISCLINICO_vigencia = 0 WHERE RC_ANALISISCLINICO_id = @ID  
END  
