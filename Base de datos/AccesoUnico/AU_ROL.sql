CREATE TABLE AU_ROL
(
AU_ROL_id int NOT NULL IDENTITY(1,1) ,
AU_ROL_nombre varchar(100),
AU_ROL_vigencia smallint,
AU_SISTEMA_id smallint FOREIGN KEY REFERENCES AU_SISTEMA(AU_SISTEMA_id),
PRIMARY KEY (AU_ROL_id)
)

SELECT * FROM dbo.AU_ROL ar

SET DATEFORMAT DMY
INSERT INTO dbo.AU_ROL
(
    --AU_ROL_id - this column value is auto-generated
    AU_ROL_nombre,
    AU_ROL_vigencia,
    AU_SISTEMA_id
)
VALUES
(
    -- AU_ROL_id - int
    'REG_CLI_MEDICO', -- AU_ROL_nombre - varchar
    1, -- AU_ROL_vigencia - smallint
    1 -- AU_SISTEMA_id - smallint
)
INSERT INTO dbo.AU_ROL
(
    --AU_ROL_id - this column value is auto-generated
    AU_ROL_nombre,
    AU_ROL_vigencia,
    AU_SISTEMA_id
)
VALUES
(
    -- AU_ROL_id - int
    'REG_CLI_USUARIO', -- AU_ROL_nombre - varchar
    1, -- AU_ROL_vigencia - smallint
    1 -- AU_SISTEMA_id - smallint
)

INSERT INTO dbo.AU_ROL
(
    --AU_ROL_id - this column value is auto-generated
    AU_ROL_nombre,
    AU_ROL_vigencia,
    AU_SISTEMA_id
)
VALUES
(
    -- AU_ROL_id - int
    'REG_CLI_ADMINISTRADOR', -- AU_ROL_nombre - varchar
    1, -- AU_ROL_vigencia - smallint
    1 -- AU_SISTEMA_id - smallint
)


INSERT INTO dbo.AU_ROL
(
    --AU_ROL_id - this column value is auto-generated
    AU_ROL_nombre,
    AU_ROL_vigencia,
    AU_SISTEMA_id
)
VALUES
(
    -- AU_ROL_id - int
    'REG_CLI_TECNOLOGO', -- AU_ROL_nombre - varchar
    1, -- AU_ROL_vigencia - smallint
    1 -- AU_SISTEMA_id - smallint
)

INSERT INTO dbo.AU_ROL
(
    --AU_ROL_id - this column value is auto-generated
    AU_ROL_nombre,
    AU_ROL_vigencia,
    AU_SISTEMA_id
)
VALUES
(
    -- AU_ROL_id - int
    'TF_Administrador', -- AU_ROL_nombre - varchar
    1, -- AU_ROL_vigencia - smallint
    2 -- AU_SISTEMA_id - smallint
)



