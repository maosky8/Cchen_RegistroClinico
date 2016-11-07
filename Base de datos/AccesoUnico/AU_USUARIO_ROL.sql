CREATE TABLE AU_USUARIO_ROL
(
AU_USUARIO_rut int FOREIGN KEY REFERENCES AU_USUARIO(AU_USUARIO_rut),
AU_ROL_id int FOREIGN KEY REFERENCES AU_ROL(AU_ROL_id),
)

SELECT * FROM dbo.AU_USUARIO_ROL aur
select * from au_rol
INSERT INTO dbo.AU_USUARIO_ROL
(
    AU_USUARIO_rut,
    AU_ROL_id
)
VALUES
(
    16626344, -- AU_USUARIO_rut - int
    3 -- AU_ROL_id - int
)

INSERT INTO dbo.AU_USUARIO_ROL
(
    AU_USUARIO_rut,
    AU_ROL_id
)
VALUES
(
    18068473, -- AU_USUARIO_rut - int
    1 -- AU_ROL_id - int
)


INSERT INTO dbo.AU_USUARIO_ROL
(
    AU_USUARIO_rut,
    AU_ROL_id
)
VALUES
(
    17248964, -- AU_USUARIO_rut - int
    3 -- AU_ROL_id - int
)

SELECT * FROM au_rol


INSERT INTO dbo.AU_USUARIO_ROL
(
    AU_USUARIO_rut,
    AU_ROL_id
)
VALUES
(
    16626344, -- AU_USUARIO_rut - int
    5 -- AU_ROL_id - int
)