CREATE TABLE RC_MEDICO
(
RC_MEDICO_rut int NOT NULL,
RC_MEDICO_dv varchar(1),
RC_MEDICO_nombre varchar(50),
RC_MEDICO_app_paterno varchar(50),
RC_MEDICO_app_materno varchar(50),
PRIMARY KEY (RC_MEDICO_rut)
)
drop table rc_medico
insert into RC_MEDICO values (16626344,'1','Omar','Cabezas','Calderón')
select * from RC_MEDICO