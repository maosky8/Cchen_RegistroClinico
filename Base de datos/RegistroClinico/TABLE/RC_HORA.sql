CREATE TABLE RC_HORA
(
RC_HORA_id smallint NOT NULL IDENTITY(1,1) ,
RC_HORA_tiempo varchar(11),
RC_HORA_vigencia smallint,
PRIMARY KEY (RC_HORA_id)
)

SELECT * FROM dbo.RC_HORA rh
UPDATE dbo.RC_HORA
SET dbo.RC_HORA.RC_HORA_vigencia = 1 -- smallint

INSERT INTO dbo.RC_HORA VALUES ('08:00-08:30',1)
INSERT INTO dbo.RC_HORA VALUES ('08:30-09:00',1)
INSERT INTO dbo.RC_HORA VALUES ('09:00-09:30',1)
INSERT INTO dbo.RC_HORA VALUES ('09:30-10:00',1)
INSERT INTO dbo.RC_HORA VALUES ('10:00-10:30',1)
INSERT INTO dbo.RC_HORA VALUES ('10:30-11:00',1)
INSERT INTO dbo.RC_HORA VALUES ('11:00-11:30',1)
INSERT INTO dbo.RC_HORA VALUES ('11:30-12:00',1)
INSERT INTO dbo.RC_HORA VALUES ('12:00-12:30',1)
INSERT INTO dbo.RC_HORA VALUES ('12:30-13:00',1)
INSERT INTO dbo.RC_HORA VALUES ('13:00-13:30',1)
INSERT INTO dbo.RC_HORA VALUES ('13:30-14:00',1)
INSERT INTO dbo.RC_HORA VALUES ('14:00-14:30',1)
INSERT INTO dbo.RC_HORA VALUES ('14:30-15:00',1)
INSERT INTO dbo.RC_HORA VALUES ('15:00-15:30',1)
INSERT INTO dbo.RC_HORA VALUES ('15:30-16:00',1)
INSERT INTO dbo.RC_HORA VALUES ('16:00-16:30',1)
INSERT INTO dbo.RC_HORA VALUES ('16:30-17:00',1)