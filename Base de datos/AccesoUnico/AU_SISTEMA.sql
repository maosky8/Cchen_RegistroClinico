
CREATE TABLE AU_SISTEMA
(
AU_SISTEMA_id smallint NOT NULL IDENTITY(1,1) ,
AU_SISTEMA_nombre varchar(100),
AU_SISTEMA_vigencia smallint,
PRIMARY KEY (AU_SISTEMA_id)
)

SELECT * FROM dbo.AU_SISTEMA [as]

SET DATEFORMAT DMY
INSERT INTO dbo.AU_SISTEMA
(
    --AU_SISTEMA_id - this column value is auto-generated
    AU_SISTEMA_nombre,
    AU_SISTEMA_vigencia
)
VALUES
(
    -- AU_SISTEMA_id - smallint
    'SISTEMA DE REGISTRO CLÍNICO', -- AU_SISTEMA_nombre - varchar
    1 -- AU_USUARIO_vigencia - smallint
)
