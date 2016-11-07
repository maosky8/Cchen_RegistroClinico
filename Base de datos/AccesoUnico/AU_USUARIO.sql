CREATE TABLE AU_USUARIO
(
AU_USUARIO_rut int NOT NULL,
AU_USUARIO_dv varchar(1),
AU_SEDE_id smallint FOREIGN KEY REFERENCES AU_SEDE(AU_SEDE_id),
AU_USUARIO_nombre varchar(50),
AU_USUARIO_app_pat varchar(50),
AU_USUARIO_app_mat varchar(50),
AU_USUARIO_fec_nac datetime,
AU_USUARIO_niv_educ varchar(50),
AU_USUARIO_ocupacion varchar(50),
AU_USUARIO_est_civil varchar(50),
AU_USUARIO_direccion varchar(100),
AU_USUARIO_nro_emrg varchar(50),
AU_USUARIO_fono varchar(50),
AU_USUARIO_prevision varchar(50),
AU_USUARIO_sexo varchar(1),
AU_USUARIO_edad smallint,
AU_USUARIO_profesion varchar(100),
AU_USUARIO_user varchar(20),
AU_USUARIO_pass varbinary(128),
AU_USUARIO_vigencia bit,
PRIMARY KEY (AU_USUARIO_rut)
)
ALTER TABLE dbo.AU_USUARIO ADD AU_USUARIO_vigencia bit
UPDATE dbo.AU_USUARIO
SET AU_USUARIO_user = 'ocabezas' WHERE AU_USUARIO_rut = 16626344

SELECT pwdencrypt(AU_USUARIO_pass),* FROM dbo.AU_USUARIO au

    Update AU_USUARIO
    SET AU_USUARIO_pass = pwdencrypt('hola')
    WHERE AU_USUARIO_rut = 16626344 
    
        Update AU_USUARIO
    SET AU_USUARIO_vigencia = 1
    WHERE AU_USUARIO_rut = 16626344 


SELECT * FROM dbo.AU_USUARIO au
WHERE PWDCOMPARE('hola', AU_USUARIO_pass) = 1 AND 
au.AU_USUARIO_rut = 16626344  



SET DATEFORMAT DMY
INSERT INTO dbo.AU_USUARIO
(
    --AU_USUARIO_id - this column value is auto-generated
    AU_USUARIO_rut,
    AU_USUARIO_dv,
    AU_SEDE_id,
    AU_USUARIO_nombre,
    AU_USUARIO_app_pat,
    AU_USUARIO_app_mat,
    AU_USUARIO_fec_nac,
    AU_USUARIO_niv_educ,
    AU_USUARIO_ocupacion,
    AU_USUARIO_est_civil,
    AU_USUARIO_direccion,
    AU_USUARIO_nro_emrg,
    AU_USUARIO_fono,
    AU_USUARIO_prevision,
    AU_USUARIO_sexo,
    AU_USUARIO_edad,
    AU_USUARIO_profesion,
    AU_USUARIO_pass,
    AU_USUARIO_user,
    AU_USUARIO_vigencia
)
VALUES
(
    -- AU_USUARIO_id - int
    16626344, -- AU_USUARIO_rut - int
    '1', -- AU_USUARIO_dv - varchar
    1, -- AU_SEDE_id - smallint
    'OMAR', -- AU_USUARIO_nombre - varchar
    'CABEZAS', -- AU_USUARIO_app_pat - varchar
    'CALDERÓN', -- AU_USUARIO_app_mat - varchar
    '10-10-1987', -- AU_USUARIO_fec_nac - datetime
    'Universitario Completo', -- AU_USUARIO_niv_educ - varchar
    'Ingeniero Desarrollo Sistemas', -- AU_USUARIO_ocupacion - varchar
    'CASADO', -- AU_USUARIO_est_civil - varchar
    'TARAPACA 890 DEPTO 811', -- AU_USUARIO_direccion - varchar
    '+56950000392', -- AU_USUARIO_nro_emrg - varchar
    '+56949118134', -- AU_USUARIO_fono - varchar
    'ISAPRE', -- AU_USUARIO_prevision - varchar
    'M', -- AU_USUARIO_sexo - varchar
    28, -- AU_USUARIO_edad - smallint
    'Infomático' -- AU_USUARIO_profesion - varchar
    ,pwdencrypt('hola')
    ,'ocabezas'
    ,1
)



select * from AU_USUARIO
update AU_USUARIO set au_usuario_mail = 'omar@isjom.com' 
alter table AU_USUARIO add  AU_USUARIO_mail varchar(100)