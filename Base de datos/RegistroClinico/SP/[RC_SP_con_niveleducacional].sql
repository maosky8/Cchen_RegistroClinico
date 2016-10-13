/********************************************************************************************    
* Nombre del procedimiento      :  [RC_SP_con_niveleducacional]  
* Fecha de creación             :  26/09/2016  
* Usuario de creación           :  Omar Cabezas    
* Versión.                      :  V.0.0.0.1    
* Objetivo                      :  Retorna todos los tipos de Niveles educacionales

**********************************************************************************************/    
create PROCEDURE [dbo].[RC_SP_con_niveleducacional]     
  
AS    
SELECT RC_NIVELEDUCACIONAL_id AS ID, RC_NIVELEDUCACIONAL_nombre AS NIVELEDUCACIONAL
FROM RC_NIVELEDUCACIONAL
