CREATE PROCEDURE RC_SP_id_registro_clinico
@rut int
AS
BEGIN

select RC_REGISTROCLINICO_id
from RC_REGISTROCLINICO
where RC_PACIENTE_rut = @rut

END