
/********************************************************************************************    
* Nombre del procedimiento      :  [[RC_SP_con_nuevo_examenfisico]]  
* Fecha de creación             :  24/10/2016  
* Usuario de creación           :  Omar Cabezas    
* Versión.                      :  V.0.0.0.1    
* Objetivo                      :  Retorna todos los tipos de examenes fisicos
[RC_SP_con_nuevo_examenfisico]
**********************************************************************************************/    
create PROCEDURE [dbo].[RC_SP_con_nuevo_examenfisico]     
  
AS   
select RC_EXAMENFISICO_id as ID, RC_EXAMENFISICO_nombre as NOMBRE from RC_EXAMENFISICO where RC_EXAMENFISICO_vigencia = 1