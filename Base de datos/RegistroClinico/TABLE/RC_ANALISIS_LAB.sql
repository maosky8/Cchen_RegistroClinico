CREATE TABLE [dbo].[RC_ANALISIS_LAB]
(
	RC_ANALISIS_LAB_id smallint IDENTITY(1,1) NOT NULL PRIMARY KEY,
	RC_ANALISIS_LAB_nombre nvarchar(50) NOT NULL,
	RC_ANALISIS_LAB_referencia nvarchar(50) NOT NULL,
	RC_UNIDADMEDIDA_id smallint NOT NULL foreign key references RC_UNIDADMEDIDA(RC_UNIDADMEDIDA_id)
)




