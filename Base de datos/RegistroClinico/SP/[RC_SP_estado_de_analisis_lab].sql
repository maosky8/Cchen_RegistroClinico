
/********************************************************************************************    
* Nombre del procedimiento      :  [RC_SP_estado_de_analisis_lab]  
* Fecha de creación             :  25/10/2016  
* Usuario de creación           :  Eric Romero  
* Versión.                      :  V.0.0.0.1    
* Objetivo                      :  Retorna los estados que podría tener una análisis de lab.
**********************************************************************************************/ 
CREATE PROCEDURE [dbo].[RC_SP_estado_de_analisis_lab]
AS
BEGIN
	SET NOCOUNT ON;

    SELECT [RC_ESTADO_id] AS ID
      ,[RC_ESTADO_nombre] AS NOMBRE
	FROM RC_ESTADO
	ORDER BY ID
END
