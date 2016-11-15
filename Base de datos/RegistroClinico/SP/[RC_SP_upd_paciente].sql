/********************************************************************************************      
* Nombre del procedimiento      :  [RC_SP_upd_paciente]    
* Fecha de creación             :  11/11/2016    
* Usuario de creación           :  Omar Cabezas      
* Versión.                      :  V.0.0.0.1      
* Objetivo                      :  modifica paciente
SELECT * FROM rc_paciente rc_cita
**********************************************************************************************/      
create PROCEDURE [dbo].[RC_SP_upd_paciente]      
@SEDE INT = NULL,
@DEPARTAMENTO INT = NULL, 
@NIVELEDUCACIONAL INT = NULL,
@ESTADOCIVIL INT = NULL,
@PREVISION INT = NULL,
@PROFESION VARCHAR(50) = NULL,
@OCUPACION VARCHAR(100) = NULL, 
@DIRECCION VARCHAR(100) = NULL, 
@FONO VARCHAR(12) = NULL,
@FONOEMERGENCIA VARCHAR(12) = NULL,
@CONTACTOEMERGENCIA VARCHAR(100) = NULL


AS 
SET DATEFORMAT ymd
BEGIN
	UPDATE RC_PACIENTE SET 
	RC_SEDE_id = @SEDE,
	RC_DEPARTAMENTO_id = @DEPARTAMENTO, 
	RC_NIVELEDUCACIONAL_id = @NIVELEDUCACIONAL,
	RC_ESTADOCIVIL_id = @ESTADOCIVIL,
	RC_PREVISION_id = @PREVISION,
	RC_PACIENTE_profesion = @PROFESION,
	RC_PACIENTE_ocupacion = @OCUPACION, 
	RC_PACIENTE_direccion = @DIRECCION, 
	RC_PACIENTE_fono = @FONO,
	RC_PACIENTE_fono_emergencia = @FONOEMERGENCIA,
	RC_PACIENTE_contacto_emergencia = @CONTACTOEMERGENCIA 
END

