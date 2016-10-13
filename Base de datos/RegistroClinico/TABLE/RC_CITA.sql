CREATE TABLE RC_CITA
(
RC_CITA_id smallint NOT NULL IDENTITY(1,1) ,
RC_CITA_fecha datetime NOT NULL,
RC_CITA_hora_real varchar(11),
RC_HORA_id smallint FOREIGN KEY REFERENCES RC_HORA(RC_HORA_id),
RC_TIPOCITA_id smallint FOREIGN KEY REFERENCES RC_TIPOCITA(RC_TIPOCITA_id),
RC_ESTADOCITA_id smallint FOREIGN KEY REFERENCES RC_ESTADOCITA(RC_ESTADOCITA_id),
RC_PACIENTE_rut int FOREIGN KEY REFERENCES RC_PACIENTE(RC_PACIENTE_rut),
RC_CITA_anexo varchar(12),
RC_CITA_observaciones varchar(500),
RC_CITA_prof_responsable varchar(50),
RC_CITA_vigencia smallint
PRIMARY KEY (RC_CITA_id)
)

SET DATEFORMAT ymd
INSERT INTO dbo.RC_CITA
VALUES
(
    -- RC_CITA_id - smallint
    '2016-08-25', -- RC_CITA_fecha - datetime
    '', -- RC_CITA_hora_real - varchar
    14, -- RC_HORA_id - smallint
    1, -- RC_TIPOCITA_id - smallint
    1, -- RC_ESTADOCITA_id - smallint
    18068473, -- RC_PACIENTE_rut - int
    '199', -- RC_CITA_anexo - int
    'Cita de prueba', -- RC_CITA_observaciones - varchar
    'ROSA BRYANT', -- RC_CITA_prof_responsable - varchar
    1 -- RC_CITA_vigencia - smallint
)
SELECT * FROM RC_TIPOCITA
SELECT * FROM RC_HORA
SELECT * FROM RC_ESTADOCITA
SELECT * FROM dbo.RC_CITA rc 
SELECT * FROM dbo.RC_PACIENTE rp
