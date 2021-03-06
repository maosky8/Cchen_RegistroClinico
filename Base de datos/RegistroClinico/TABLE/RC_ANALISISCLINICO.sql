CREATE TABLE RC_ANALISISCLINICO(
	RC_ANALISISCLINICO_id int primary key identity(1,1),
	RC_REGISTROCLINICO_id int FOREIGN KEY REFERENCES RC_REGISTROCLINICO(RC_REGISTROCLINICO_id) NOT NULL,
	RC_ANALISIS_LAB_id smallint FOREIGN KEY REFERENCES RC_ANALISIS_LAB(RC_ANALISIS_LAB_id),
	RC_ANALISISCLINICO_fecha date NOT NULL,
	RC_ANALISISCLINICO_resultado nvarchar(50),
	RC_ANALISISCLINICO_unidad nvarchar(50),
	RC_ANALISISCLINICO_lugar nvarchar(100),
	RC_ESTADO_id smallint foreign key references RC_ESTADO(RC_ESTADO_id) NOT NULL,
	RC_ANALISISCLINICO_vigencia smallint
)

alter table RC_ANALISISCLINICO add RC_ANALISISCLINICO_vigencia smallint 
update RC_ANALISISCLINICO set RC_ANALISISCLINICO_vigencia = 1