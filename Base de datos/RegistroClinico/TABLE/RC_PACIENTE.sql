CREATE TABLE RC_PACIENTE
(
RC_PACIENTE_rut int NOT NULL,
RC_PACIENTE_dv varchar(1),
RC_PACIENTE_nombre varchar(50),
RC_PACIENTE_app_paterno varchar(50),
RC_PACIENTE_app_materno varchar(50),
RC_SEDE_id smallint FOREIGN KEY REFERENCES RC_SEDE(RC_SEDE_id),
RC_SEXO_id smallint FOREIGN KEY REFERENCES RC_SEXO(RC_SEXO_id),
RC_DEPARTAMENTO_id smallint FOREIGN KEY REFERENCES RC_DEPARTAMENTO(RC_DEPARTAMENTO_id),
RC_NIVELEDUCACIONAL_id smallint FOREIGN KEY REFERENCES RC_NIVELEDUCACIONAL(RC_NIVELEDUCACIONAL_id),
RC_ESTADOCIVIL_id smallint FOREIGN KEY REFERENCES RC_ESTADOCIVIL(RC_ESTADOCIVIL_id),
RC_PREVISION_id smallint FOREIGN KEY REFERENCES RC_PREVISION(RC_PREVISION_id),
RC_PACIENTE_fecha_nacimiento datetime,
RC_PACIENTE_profesion varchar(50),
RC_PACIENTE_ocupacion varchar(100),
RC_PACIENTE_direccion varchar(100),
RC_PACIENTE_fono varchar(12),
RC_PACIENTE_fono_emergencia varchar(12),
RC_PACIENTE_contacto_emergencia varchar(100),
PRIMARY KEY (RC_PACIENTE_rut)
)

INSERT INTO dbo.RC_PACIENTE
VALUES
(
    1111111, -- RC_PACIENTE_rut - int
    '1', -- RC_PACIENTE_dv - varchar
    'Sin Paciente', -- RC_PACIENTE_nombre - varchar
    '--', -- RC_PACIENTE_app_paterno - varchar
    '--' -- RC_PACIENTE_app_materno - varchar
)

INSERT INTO dbo.RC_PACIENTE
VALUES
(
    16626344, -- RC_PACIENTE_rut - int
    '1', -- RC_PACIENTE_dv - varchar
    'Omar', -- RC_PACIENTE_nombre - varchar
    'Cabezas', -- RC_PACIENTE_app_paterno - varchar
    'Calder�n' -- RC_PACIENTE_app_materno - varchar
)

INSERT INTO dbo.RC_PACIENTE
VALUES
(
    18068473, -- RC_PACIENTE_rut - int
    '5', -- RC_PACIENTE_dv - varchar
    'Francisca', -- RC_PACIENTE_nombre - varchar
    'Araneda', -- RC_PACIENTE_app_paterno - varchar
    'Benitez' -- RC_PACIENTE_app_materno - varchar
)

SELECT * FROM dbo.RC_PACIENTE rp

ALTER TABLE RC_PACIENTE ADD RC_SEDE_id smallint FOREIGN KEY REFERENCES RC_SEDE(RC_SEDE_id)
ALTER TABLE RC_PACIENTE ADD RC_SEXO_id smallint FOREIGN KEY REFERENCES RC_SEXO(RC_SEXO_id)
ALTER TABLE RC_PACIENTE ADD RC_DEPARTAMENTO_id smallint FOREIGN KEY REFERENCES RC_DEPARTAMENTO(RC_DEPARTAMENTO_id)
ALTER TABLE RC_PACIENTE ADD RC_NIVELEDUCACIONAL_id smallint FOREIGN KEY REFERENCES RC_NIVELEDUCACIONAL(RC_NIVELEDUCACIONAL_id)
ALTER TABLE RC_PACIENTE ADD RC_ESTADOCIVIL_id smallint FOREIGN KEY REFERENCES RC_ESTADOCIVIL(RC_ESTADOCIVIL_id)
ALTER TABLE RC_PACIENTE ADD RC_PREVISION_id smallint FOREIGN KEY REFERENCES RC_PREVISION(RC_PREVISION_id)
ALTER TABLE RC_PACIENTE ADD RC_PACIENTE_fecha_nacimiento datetime
ALTER TABLE RC_PACIENTE ADD RC_PACIENTE_profesion varchar(50)
ALTER TABLE RC_PACIENTE ADD RC_PACIENTE_ocupacion varchar(100)
ALTER TABLE RC_PACIENTE ADD RC_PACIENTE_direccion varchar(100)
ALTER TABLE RC_PACIENTE ADD RC_PACIENTE_fono varchar(12)
ALTER TABLE RC_PACIENTE ADD RC_PACIENTE_fono_emergencia varchar(12)
ALTER TABLE RC_PACIENTE ADD RC_PACIENTE_contacto_emergencia varchar(100)

UPDATE dbo.RC_PACIENTE
SET
    rc_sede_id = 1, rc_sexo_id = 1, rc_departamento_id = 1,rc_niveleducacional_id = 1, rc_estadocivil_id = 1, rc_prevision_id = 1 
    
