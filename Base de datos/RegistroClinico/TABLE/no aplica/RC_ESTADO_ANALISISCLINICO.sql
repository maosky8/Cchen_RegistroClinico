



CREATE TABLE RC_ESTADO_ANALISISCLINICO
(
RC_ESTADO_ANALISISCLINICO_id int NOT NULL IDENTITY(1,1),
RC_ESTADO_ANALISISCLINICO_nombre varchar(50)
PRIMARY KEY (RC_ESTADO_ANALISISCLINICO_id)
)

insert into RC_ESTADO_ANALISISCLINICO values ('Iniciado')
insert into RC_ESTADO_ANALISISCLINICO values ('Por validar')
insert into RC_ESTADO_ANALISISCLINICO values ('Validado')