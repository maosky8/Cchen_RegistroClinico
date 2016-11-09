
/********************************************************************************************      
* Nombre del procedimiento      :  [RC_SP_ins_registroclinico]    
* Fecha de creación             :  27/10/2016    
* Usuario de creación           :  Omar Cabezas      
* Versión.                      :  V.0.0.0.1      
* Objetivo                      :  Inserta relacion paciente-medico
**********************************************************************************************/      
ALTER PROCEDURE [dbo].[RC_SP_ins_registroclinico]      
@RUTPACIENTE INT,
@RUTMEDICO INT


AS 
BEGIN
	INSERT INTO RC_REGISTROCLINICO(	
	 RC_PACIENTE_RUT
	,RC_MEDICO_RUT)
	VALUES	(
	@RUTPACIENTE,
	@RUTMEDICO )
END

