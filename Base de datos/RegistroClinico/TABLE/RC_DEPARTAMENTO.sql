CREATE TABLE RC_DEPARTAMENTO
(
RC_DEPARTAMENTO_id smallint NOT NULL IDENTITY(1,1),
RC_DEPARTAMENTO_nombre varchar(30)
PRIMARY KEY (RC_DEPARTAMENTO_id)
)


SELECT * FROM dbo.RC_DEPARTAMENTO rs


INSERT INTO dbo.RC_DEPARTAMENTO VALUES ('DE')
INSERT INTO dbo.RC_DEPARTAMENTO VALUES ('JUR�DICA')
INSERT INTO dbo.RC_DEPARTAMENTO VALUES ('GESTI�N')
INSERT INTO dbo.RC_DEPARTAMENTO VALUES ('DIFUS')
INSERT INTO dbo.RC_DEPARTAMENTO VALUES ('COOPERACI�N')
INSERT INTO dbo.RC_DEPARTAMENTO VALUES ('AUDITOR�A')
INSERT INTO dbo.RC_DEPARTAMENTO VALUES ('CALIDAD')
INSERT INTO dbo.RC_DEPARTAMENTO VALUES ('DSNR')
INSERT INTO dbo.RC_DEPARTAMENTO VALUES ('DPRA')
INSERT INTO dbo.RC_DEPARTAMENTO VALUES ('DSA')
INSERT INTO dbo.RC_DEPARTAMENTO VALUES ('P&S')
INSERT INTO dbo.RC_DEPARTAMENTO VALUES ('DID')
                    