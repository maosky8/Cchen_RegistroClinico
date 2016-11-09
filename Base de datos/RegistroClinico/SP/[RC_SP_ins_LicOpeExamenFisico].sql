
/********************************************************************************************      
* Nombre del procedimiento      :  [RC_SP_ins_licopeexamenfisico]    
* Fecha de creación             :  27/10/2016    
* Usuario de creación           :  Omar Cabezas      
* Versión.                      :  V.0.0.0.1      
* Objetivo                      :  Inserta relacion licencia operacional examen
[RC_SP_ins_LicOpeExamenFisico] 3,1,1
**********************************************************************************************/      
create PROCEDURE [dbo].[RC_SP_ins_LicOpeExamenFisico]      
@LICENCIAOPERACIONAL_id int,
@EXAMENFISICO_id int,
@APTITUDEXAMEN_id int


AS 
BEGIN
	INSERT INTO RC_LICENCIAOPERACIONAL_EXAMENFISICO(	
		RC_LICENCIAOPERACIONAL_id,RC_EXAMENFISICO_id,RC_APTITUDEXAMEN_id)
		VALUES
		(@LICENCIAOPERACIONAL_id,@EXAMENFISICO_id,@APTITUDEXAMEN_id)

END


