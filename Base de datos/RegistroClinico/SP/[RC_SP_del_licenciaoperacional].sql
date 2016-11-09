/********************************************************************************************      
* Nombre del procedimiento      :  [RC_SP_del_licenciaoperacional]    
* Fecha de creación             :  29/08/2016    
* Usuario de creación           :  Omar Cabezas      
* Versión.                      :  V.0.0.0.1      
* Objetivo                      :  Borra datos de licencia operacional  
[RC_SP_del_cita] 2  
**********************************************************************************************/      
create PROCEDURE [dbo].[RC_SP_del_licenciaoperacional]      
@ID int  
      
AS      
BEGIN  
UPDATE RC_LICENCIAOPERACIONAL SET RC_LICENCIAOPERACIONAL_vigencia = 0 WHERE RC_LICENCIAOPERACIONAL_id = @ID  
END  

