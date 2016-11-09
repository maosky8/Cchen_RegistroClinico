CREATE TABLE RC_LICENCIAOPERACIONAL_EXAMENFISICO
(
RC_LICENCIAOPERACIONAL_EXAMENFISICO_id int NOT NULL IDENTITY(1,1),
RC_LICENCIAOPERACIONAL_id int FOREIGN KEY REFERENCES RC_LICENCIAOPERACIONAL(RC_LICENCIAOPERACIONAL_id),
RC_EXAMENFISICO_id smallint FOREIGN KEY REFERENCES RC_EXAMENFISICO(RC_EXAMENFISICO_id),
RC_APTITUDEXAMEN_id smallint FOREIGN KEY REFERENCES RC_APTITUDEXAMEN(RC_APTITUDEXAMEN_id),
PRIMARY KEY (RC_LICENCIAOPERACIONAL_EXAMENFISICO_id)
)