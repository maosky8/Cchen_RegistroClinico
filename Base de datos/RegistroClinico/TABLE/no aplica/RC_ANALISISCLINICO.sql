CREATE TABLE RC_ANALISISCLINICO
(
RC_ANALISISCLINICO_id int NOT NULL IDENTITY(1,1),
RC_PACIENTE_rut int FOREIGN KEY REFERENCES RC_PACIENTE(RC_PACIENTE_rut),
RC_ANALISISLAB_id int FOREIGN KEY REFERENCES RC_ANALISISLAB(RC_ANALISISLAB_id),
RC_ESTADO_ANALISISCLINICO_id int FOREIGN KEY REFERENCES RC_ESTADO_ANALISISCLINICO(RC_ESTADO_ANALISISCLINICO_id),
RC_ANALISISCLINICO_fecha datetime,
RC_ANALISISCLINICO_resultado varchar(50),
RC_ANALISISCLINICO_lugar varchar(200),
RC_ANALISISCLINICO_ruta varchar(200)
PRIMARY KEY (RC_ANALISISCLINICO_id)
)

