CREATE TABLE AU_SEDE
(
AU_SEDE_id smallint NOT NULL IDENTITY(1,1) ,
AU_SEDE_nombre varchar(100) NOT NULL,
AU_SEDE_vigencia smallint NOT NULL,
PRIMARY KEY (AU_SEDE_id)
)

SELECT * FROM dbo.AU_SEDE [as]

INSERT INTO dbo.AU_SEDE
(
    --AU_SEDE_id - this column value is auto-generated
    AU_SEDE_nombre,
    AU_SEDE_vigencia
)
VALUES
(
    -- AU_SEDE_id - smallint
    'SEDE CENTRAL', -- AU_SEDE_nombre - varchar
    1 -- AU_SEDE_vigencia - smallint
)
INSERT INTO dbo.AU_SEDE
(
    --AU_SEDE_id - this column value is auto-generated
    AU_SEDE_nombre,
    AU_SEDE_vigencia
)
VALUES
(
    -- AU_SEDE_id - smallint
    'LA REINA', -- AU_SEDE_nombre - varchar
    1 -- AU_SEDE_vigencia - smallint
)
INSERT INTO dbo.AU_SEDE
(
    --AU_SEDE_id - this column value is auto-generated
    AU_SEDE_nombre,
    AU_SEDE_vigencia
)
VALUES
(
    -- AU_SEDE_id - smallint
    'LO AGUIRRE', -- AU_SEDE_nombre - varchar
    1 -- AU_SEDE_vigencia - smallint
)