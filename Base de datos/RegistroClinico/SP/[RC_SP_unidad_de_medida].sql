
/********************************************************************************************    
* Nombre del procedimiento      :  [RC_SP_unidad_de_medida]  
* Fecha de creación             :  19/10/2016  
* Usuario de creación           :  Eric Romero  
* Versión.                      :  V.0.0.0.1    
* Objetivo                      :  Retorna la unidad de medida estándar de un análisis de Lab.
**********************************************************************************************/ 
CREATE PROCEDURE [dbo].[RC_SP_unidad_de_medida]
@id_analisis_lab int
AS
BEGIN
	SET NOCOUNT ON;

    select um.RC_UNIDADMEDIDA_nombre 
	from RC_UNIDADMEDIDA um 
	inner join RC_ANALISIS_LAB al on um.RC_UNIDADMEDIDA_id = al.RC_UNIDADMEDIDA_id 
	where al.RC_ANALISIS_LAB_id = @id_analisis_lab
END
