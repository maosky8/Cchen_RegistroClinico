/********************************************************************************************    
* Nombre del procedimiento      :  [RC_SP_inserta_analisis_archivo]  
* Fecha de creación             :  20/10/2016  
* Usuario de creación           :  Eric Romero  
* Versión.                      :  V.0.0.0.1    
* Objetivo                      :  Inserta los datos de un análisis de laboratorio y el archivo
								   adjunto correspondiente.
**********************************************************************************************/ 
alter PROCEDURE [dbo].[RC_SP_inserta_analisis_archivo]
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
@tamano int
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @identificador int
	DECLARE @error1 int
	DECLARE @error2 int
	DECLARE @retorno int
	SET @error1 = 0
	SET @error2 = 0

	BEGIN TRANSACTION

	INSERT INTO RC_ANALISISCLINICO VALUES (@id, @analisis, @fechaAnalisis, @resultado, @unidad, @lugar, @estado)

	SET @identificador = @@IDENTITY

	SELECT @error1 = @@ERROR

	INSERT INTO RC_ANACLIARCHIVO VALUES (@identificador, null, @nombreArchivo, @extArchivo, @tamano, @ruta)
    
	SELECT @error2 = @@ERROR

	IF @Error1 = 0 AND @Error2 = 0
		BEGIN
		COMMIT TRANSACTION
		SET @retorno = 1
		RETURN(@retorno)
		END

	ELSE
		BEGIN
		ROLLBACK TRANSACTION
		SET @retorno = 0
		RETURN(@retorno)
		END
END