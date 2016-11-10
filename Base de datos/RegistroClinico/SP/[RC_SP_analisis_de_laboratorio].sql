
/********************************************************************************************    
* Nombre del procedimiento      :  [RC_SP_analisis_de_laboratorio]  
* Fecha de creación             :  17/10/2016  
* Usuario de creación           :  Eric Romero  
* Versión.                      :  V.0.0.0.1    
* Objetivo                      :  Retorna todos los análisis de laboratorio, ordenados alfabéticamente.
**********************************************************************************************/ 
alter PROCEDURE dbo.RC_SP_analisis_de_laboratorio
AS
BEGIN
	SET NOCOUNT ON;

    SELECT RC_ANALISIS_LAB_id AS ID
      ,RC_ANALISIS_LAB_nombre AS EXAMEN
	FROM RC_ANALISIS_LAB
	ORDER BY RC_ANALISIS_LAB_nombre
END
GO
