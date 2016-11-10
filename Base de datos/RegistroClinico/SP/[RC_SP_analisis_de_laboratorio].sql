
/********************************************************************************************    
* Nombre del procedimiento      :  [RC_SP_analisis_de_laboratorio]  
* Fecha de creaci�n             :  17/10/2016  
* Usuario de creaci�n           :  Eric Romero  
* Versi�n.                      :  V.0.0.0.1    
* Objetivo                      :  Retorna todos los an�lisis de laboratorio, ordenados alfab�ticamente.
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
