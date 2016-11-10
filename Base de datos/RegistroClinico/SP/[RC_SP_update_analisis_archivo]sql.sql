-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
alter PROCEDURE RC_SP_update_analisis_archivo
@id int,
@analisis int,
@fechaAnalisis date,
@resultado nvarchar(50),
@unidad nvarchar(50),
@lugar nvarchar(100),
@estado smallint,
@nombreArchivo nvarchar(100),
@extArchivo nvarchar(7),
@archivo varbinary(max) = null,
@ruta nvarchar(500),
@tamano int,
@idPrincipal int

AS
BEGIN
BEGIN TRANSACTION
BEGIN TRY

UPDATE RC_ANALISISCLINICO 
SET RC_REGISTROCLINICO_id = @id,
	RC_ANALISIS_LAB_id = @analisis,
	RC_ANALISISCLINICO_fecha = @fechaAnalisis,
	RC_ANALISISCLINICO_resultado = @resultado,
	RC_ANALISISCLINICO_unidad = @unidad,
	RC_ANALISISCLINICO_lugar = @lugar,
	RC_ESTADO_id = @estado
WHERE RC_ANALISISCLINICO_id = @idPrincipal

IF (@nombreArchivo <> NULL)
BEGIN
	UPDATE RC_ANACLIARCHIVO 
	SET RC_ANACLIARCHIVO_archivo = null,
		RC_ANACLIARCHIVO_nombre = @nombreArchivo,
		RC_ANACLIARCHIVO_extension = @extArchivo,
		RC_ANACLIARCHIVO_tamano = @tamano,
		RC_ANACLIARCHIVO_ruta = @ruta
	WHERE RC_ANALISISCLINICO_id = @idPrincipal;
END
COMMIT TRANSACTION
END TRY

BEGIN CATCH
ROLLBACK TRANSACTION
END CATCH

END
GO
