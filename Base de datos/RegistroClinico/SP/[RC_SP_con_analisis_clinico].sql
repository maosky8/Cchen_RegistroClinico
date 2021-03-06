
/********************************************************************************************    
* Nombre del procedimiento      :  [RC_SP_con_analisis_clinico]  
* Fecha de creación             :  27/10/2016  
* Usuario de creación           :  Eric Romero  
* Versión.                      :  V.0.0.0.1    
* Objetivo                      :  Retorna los análisis clínicos correspondientes a los 
								   parámetros de búsqueda
								   RC_SP_con_analisis_clinico 16626344
**********************************************************************************************/ 
alter PROCEDURE [dbo].[RC_SP_con_analisis_clinico]
@RUT INT,
@ANALISIS INT = NULL,
@ESTADO INT = NULL,
@DESDE DATE = NULL,
@HASTA DATE = NULL
AS
SET DATEFORMAT dmy
BEGIN
	SET NOCOUNT ON;
	SELECT ac.RC_ANALISISCLINICO_id AS ID
	,al.RC_ANALISIS_LAB_id AS id_Lab
	,al.RC_ANALISIS_LAB_nombre AS AnalisisLab
	,CONVERT(VARCHAR,ac.RC_ANALISISCLINICO_fecha,103) AS Fecha
	,ac.RC_ANALISISCLINICO_resultado AS Resultado
	,ac.RC_ANALISISCLINICO_unidad AS Unidad
	,ac.RC_ANALISISCLINICO_lugar AS Lugar
	,e.RC_ESTADO_nombre AS Estado 
	,e.RC_ESTADO_id As idEstado
	,CASE RC_ESTADO_nombre
	WHEN 'Iniciado' THEN 'EDITAR'
	ELSE ' '
	END AS Editar
	,a.RC_ANACLIARCHIVO_nombre + '.' + a.RC_ANACLIARCHIVO_extension as NombreArchivo
	,a.RC_ANACLIARCHIVO_ruta AS Ruta
	,a.RC_ANACLIARCHIVO_tamano As Tamano,
'ANALISIS_CLI_'+CONVERT(varchar,ac.RC_ANALISISCLINICO_id) as IDNOMBREANALISISCLINICO

	FROM RC_ANALISISCLINICO ac 
	LEFT JOIN RC_REGISTROCLINICO rc ON ac.RC_REGISTROCLINICO_id = rc.RC_REGISTROCLINICO_id
	LEFT JOIN RC_ANALISIS_LAB al ON ac.RC_ANALISIS_LAB_id = al.RC_ANALISIS_LAB_id
	LEFT JOIN RC_ESTADO e ON ac.RC_ESTADO_id = e.RC_ESTADO_id
	LEFT JOIN RC_ANACLIARCHIVO a ON ac.RC_ANALISISCLINICO_id = a.RC_ANALISISCLINICO_id
  
	WHERE rc.RC_PACIENTE_rut = @RUT
	AND al.RC_ANALISIS_LAB_id = ISNULL(@ANALISIS, al.RC_ANALISIS_LAB_id)
	AND e.RC_ESTADO_id = ISNULL(@ESTADO, e.RC_ESTADO_id)
	AND ac.RC_ANALISISCLINICO_fecha >= ISNULL(@DESDE, (SELECT MIN(ac2.RC_ANALISISCLINICO_fecha) FROM RC_ANALISISCLINICO ac2))
	AND ac.RC_ANALISISCLINICO_fecha <= ISNULL(@HASTA, (SELECT MAX(ac2.RC_ANALISISCLINICO_fecha) FROM RC_ANALISISCLINICO ac2))
	AND RC_ANALISISCLINICO_vigencia = 1
	ORDER BY ID
    
END