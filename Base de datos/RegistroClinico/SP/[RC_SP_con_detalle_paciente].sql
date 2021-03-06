/********************************************************************************************      
* Nombre del procedimiento      :  [RC_SP_con_detalle_paciente]    
* Fecha de creaci�n             :  03/10/2016    
* Usuario de creaci�n           :  Omar Cabezas      
* Versi�n.                      :  V.0.0.0.1      
* Objetivo                      :  Consulta detalle pacientes
SELECT * FROM RC_PACIENTE
[RC_SP_con_detalle_paciente] 18068473
**********************************************************************************************/      
alter PROCEDURE [dbo].[RC_SP_con_detalle_paciente]      
@RUT INT

AS 
SET DATEFORMAT ymd
BEGIN
	SELECT TOP 1
			CONVERT(VARCHAR,P.RC_PACIENTE_RUT)+'-'+SUBSTRING(UPPER(P.RC_PACIENTE_DV),1,1) AS RUT,
			SUBSTRING(UPPER(P.RC_PACIENTE_NOMBRE),1,100)+' '+SUBSTRING(UPPER(P.RC_PACIENTE_APP_PATERNO),1,100)+' '+SUBSTRING(UPPER(P.RC_PACIENTE_APP_MATERNO),1,100) AS NOMBRE,
			ISNULL(CONVERT(VARCHAR(10),P.RC_PACIENTE_FECHA_NACIMIENTO,103 ),'--') AS FECHA_NACIMIENTO,
			ISNULL(S.RC_SEXO_NOMBRE,'--') AS SEXO,
			ISNULL(P.RC_PACIENTE_PROFESION,'--') AS PROFESION,
			--ISNULL(NE.RC_NIVELEDUCACIONAL_NOMBRE,'--') AS NIVEL_EDUCACIONAL,
			P.RC_NIVELEDUCACIONAL_id AS NIVEL_EDUCACIONAL,
			ISNULL(P.RC_PACIENTE_OCUPACION,'--') AS OCUPACION,
			--ISNULL(D.RC_DEPARTAMENTO_NOMBRE,'--') AS DEPARTAMENTO,
			P.RC_DEPARTAMENTO_id AS DEPARTAMENTO,
			ISNULL(P.RC_PACIENTE_DIRECCION,'--') AS DIRECCION,
			--ISNULL(EC.RC_ESTADOCIVIL_NOMBRE,'--') AS ESTADO_CIVIL,
			P.RC_ESTADOCIVIL_id AS ESTADO_CIVIL,
			--ISNULL(SD.RC_SEDE_NOMBRE,'--') AS SEDE,
			P.RC_SEDE_id AS SEDE,
			--ISNULL(PR.RC_PREVISION_NOMBRE,'--') AS PREVISION,
			P.RC_PREVISION_id AS PREVISION,
			ISNULL(P.RC_PACIENTE_FONO,'--') AS FONO_CONTACTO,
			ISNULL(P.RC_PACIENTE_FONO_EMERGENCIA,'--') AS FONO_EMERGENCIA,
			ISNULL(P.RC_PACIENTE_CONTACTO_EMERGENCIA,'--') AS CONTACTO_EMERGENCIA,
			RC.RC_REGISTROCLINICO_id AS REGISTROCLINICOID
	FROM	RC_PACIENTE P LEFT JOIN 
			RC_SEXO S ON S.RC_SEXO_ID = P.RC_SEXO_ID LEFT JOIN
			RC_NIVELEDUCACIONAL NE ON NE.RC_NIVELEDUCACIONAL_ID = P.RC_NIVELEDUCACIONAL_ID LEFT JOIN
			RC_DEPARTAMENTO D ON D.RC_DEPARTAMENTO_ID = P.RC_DEPARTAMENTO_ID LEFT JOIN
			RC_ESTADOCIVIL EC ON EC.RC_ESTADOCIVIL_ID = P.RC_ESTADOCIVIL_ID LEFT JOIN
			RC_SEDE SD ON SD.RC_SEDE_ID = P.RC_SEDE_ID LEFT JOIN 
			RC_PREVISION PR ON PR.RC_PREVISION_ID = P.RC_PREVISION_ID LEFT JOIN
			RC_REGISTROCLINICO RC ON RC.RC_PACIENTE_rut = p.RC_PACIENTE_rut
	WHERE	P.RC_PACIENTE_RUT = @RUT
END

