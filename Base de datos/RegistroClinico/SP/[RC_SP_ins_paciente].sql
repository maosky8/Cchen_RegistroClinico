/********************************************************************************************      
* Nombre del procedimiento      :  [RC_SP_ins_paciente]    
* Fecha de creación             :  30/09/2016    
* Usuario de creación           :  Omar Cabezas      
* Versión.                      :  V.0.0.0.1      
* Objetivo                      :  Inserta citas
SELECT * FROM rc_paciente rc_cita
**********************************************************************************************/      
create PROCEDURE [dbo].[RC_SP_ins_paciente]      
@RUT INT,
@DV VARCHAR(1),
@NOMBRE VARCHAR(50),
@APELLIDOPATERNO VARCHAR(50),
@APELLIDOMATERNO VARCHAR(50),
@SEDE INT = NULL,
@SEXO INT,
@DEPARTAMENTO INT = NULL, 
@NIVELEDUCACIONAL INT = NULL,
@ESTADOCIVIL INT = NULL,
@PREVISION INT = NULL,
@FECHANACIMIENTO VARCHAR(10),
@PROFESION VARCHAR(50) = NULL,
@OCUPACION VARCHAR(100) = NULL, 
@DIRECCION VARCHAR(100) = NULL, 
@FONO VARCHAR(12) = NULL,
@FONOEMERGENCIA VARCHAR(12) = NULL,
@CONTACTOEMERGENCIA VARCHAR(100) = NULL


AS 
SET DATEFORMAT ymd
BEGIN
	INSERT INTO RC_PACIENTE (	
	 RC_PACIENTE_rut
	,RC_PACIENTE_dv
	,RC_PACIENTE_nombre
	,RC_PACIENTE_app_paterno
	,RC_PACIENTE_app_materno
	,RC_SEDE_id
	,RC_SEXO_id
	,RC_DEPARTAMENTO_id
	,RC_NIVELEDUCACIONAL_id
	,RC_ESTADOCIVIL_id
	,RC_PREVISION_id
	,RC_PACIENTE_fecha_nacimiento
	,RC_PACIENTE_profesion
	,RC_PACIENTE_ocupacion
	,RC_PACIENTE_direccion
	,RC_PACIENTE_fono
	,RC_PACIENTE_fono_emergencia
	,RC_PACIENTE_contacto_emergencia) 
	VALUES	(
	@RUT,
	@DV,
	@NOMBRE,
	@APELLIDOPATERNO,
	@APELLIDOMATERNO,
	@SEDE,
	@SEXO,
	@DEPARTAMENTO, 
	@NIVELEDUCACIONAL,
	@ESTADOCIVIL,
	@PREVISION,
	@FECHANACIMIENTO,
	@PROFESION,
	@OCUPACION, 
	@DIRECCION, 
	@FONO,
	@FONOEMERGENCIA,
	@CONTACTOEMERGENCIA )
END

