using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Web;
using System.Xml;
using System.Configuration;
using System.Data.SqlClient;
using CCHEN_FichaMedica_Datos;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel;
using System.Reflection;
using System.Text;


namespace CCHEN_FichaMedica_Negocio
{
    public class RegistroClinico
    {
        public RegistroClinico()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public static DataSet NombrePaciente()
        {
            string procedimiento = "RC_SP_con_paciente";               
            return CCHEN_FichaMedica_Datos.Login.ExecuteDataSet_rc(procedimiento, null);
        }

        public static DataSet Sexo()
        {
            string procedimiento = "RC_SP_con_sexo";
            return CCHEN_FichaMedica_Datos.Login.ExecuteDataSet_rc(procedimiento, null);
        }

        public static DataSet Sede()
        {
            string procedimiento = "RC_SP_con_sede";
            return CCHEN_FichaMedica_Datos.Login.ExecuteDataSet_rc(procedimiento, null);
        }

        public static DataSet NivelEducacional()
        {
            string procedimiento = "RC_SP_con_niveleducacional";
            return CCHEN_FichaMedica_Datos.Login.ExecuteDataSet_rc(procedimiento, null);
        }

        public static DataSet Departamento()
        {
            string procedimiento = "RC_SP_con_departamento";
            return CCHEN_FichaMedica_Datos.Login.ExecuteDataSet_rc(procedimiento, null);
        }

        public static DataSet EstadoCivil()
        {
            string procedimiento = "RC_SP_con_estadocivil";
            return CCHEN_FichaMedica_Datos.Login.ExecuteDataSet_rc(procedimiento, null);
        }

        public static DataSet Prevision()
        {
            string procedimiento = "RC_SP_con_prevision";
            return CCHEN_FichaMedica_Datos.Login.ExecuteDataSet_rc(procedimiento, null);
        }

        /// <summary>
        /// Método que retorna los Registros Clinicos de cada paciente de acuerdo a los criterios de búsqueda seleccionado por el usuario
        /// </summary>
        /// <returns></returns>
        public static IList<Custom.ResultadoBuscadorRegistroClinico> ObtenerRegistroClinico(Custom.DatosBuscadorRegistroClinico dto)
        {
            string procedimiento = "RC_SP_con_RegistroClinico";

            SqlParameter[] dbParams = new SqlParameter[3];

            dbParams[0] = new SqlParameter("@RUT", SqlDbType.Int);
            dbParams[0].Value = dto.RutPaciente;
            dbParams[1] = new SqlParameter("@SEXO", SqlDbType.Int);
            dbParams[1].Value = dto.Sexo;
            dbParams[2] = new SqlParameter("@SEDE", SqlDbType.Int);
            dbParams[2].Value = dto.Sede;

            DataSet ds = CCHEN_FichaMedica_Datos.Login.ExecuteDataSet_rc(procedimiento, dbParams);

            var list = (ds.Tables[0].AsEnumerable().Select(
                df =>
                new Custom.ResultadoBuscadorRegistroClinico
                {
                    IdRutPaciente = Convert.ToInt32(df[0].ToString()),
                    RutPaciente = df[1].ToString(),
                    NombrePaciente = df[2].ToString(),
                    Sexo = df[3].ToString(),
                    Sede = df[4].ToString(),
                    Departamento = df[5].ToString()

                })).ToList();

            return list;
        }

        public static IList<Custom.ResultadoRegistroHistorico> ObtenerRegistroHistorico(int rut, int? id)
        {
            string procedimiento = "RC_SP_con_RegistroHistorico";

            SqlParameter[] dbParams = new SqlParameter[2];

            dbParams[0] = new SqlParameter("@RUT", SqlDbType.Int);
            dbParams[0].Value = rut;
            dbParams[1] = new SqlParameter("@ID", SqlDbType.Int);
            dbParams[1].Value = id;

            DataSet ds = CCHEN_FichaMedica_Datos.Login.ExecuteDataSet_rc(procedimiento, dbParams);

            var list = (ds.Tables[0].AsEnumerable().Select(
                df =>
                new Custom.ResultadoRegistroHistorico
                {
                    IdRegistroHistorico = Convert.ToInt32(df[0].ToString()),
                    NombreArchivo = df[1].ToString(),
                    Extension = df[2].ToString(),
                    Tamano = df[3].ToString(),
                    Ruta = df[4].ToString()

                })).ToList();

            return list;
        }

        public static IList<Custom.ResultadoLicenciaOperacional> ObtenerLicenciaOperacional(int rutpaciente, int rutmedico)
        {
            string procedimiento = "RC_SP_con_LicenciaOperacional";

            SqlParameter[] dbParams = new SqlParameter[2];

            dbParams[0] = new SqlParameter("@RUTPACIENTE", SqlDbType.Int);
            dbParams[0].Value = rutpaciente;
            dbParams[1] = new SqlParameter("@RUTMEDICO", SqlDbType.Int);
            dbParams[1].Value = rutmedico;

            DataSet ds = CCHEN_FichaMedica_Datos.Login.ExecuteDataSet_rc(procedimiento, dbParams);

            var list = (ds.Tables[0].AsEnumerable().Select(
                df =>
                new Custom.ResultadoLicenciaOperacional
                {
                    IdLicenciaOperacional = Convert.ToInt32(df[0].ToString()),
                    IdNombreLicenciaOperacional = df[1].ToString(),
                    NombreMedico = df[2].ToString(),
                    FechaRegistro = df[3].ToString(),
                    FechaInicio = df[4].ToString(),
                    FechaFin = df[5].ToString(),
                    EstadoLicenciaOperacional = df[6].ToString(),
                    Apreciacion = df[7].ToString(),
                    Dias = df[8].ToString()

                })).ToList();

            return list;
        }

        public static DataSet ObtenerDetalleLicenciaOperacional(int idlicenciaoperacional)
        {
            string procedimiento = "RC_SP_con_detalle_licenciaoperacional";

            SqlParameter[] dbParams = new SqlParameter[1];

            dbParams[0] = new SqlParameter("@ID", SqlDbType.Int);
            dbParams[0].Value = idlicenciaoperacional;

            return CCHEN_FichaMedica_Datos.Login.ExecuteDataSet_rc(procedimiento, dbParams);
        }

        public static IList<Custom.DatosDetalleExamen> ObtenerDetalleExamen(int idlicenciaoperacional)
        {
            string procedimiento = "RC_SP_con_detalle_examenfisico";

            SqlParameter[] dbParams = new SqlParameter[1];

            dbParams[0] = new SqlParameter("@ID", SqlDbType.Int);
            dbParams[0].Value = idlicenciaoperacional;


            DataSet ds = CCHEN_FichaMedica_Datos.Login.ExecuteDataSet_rc(procedimiento, dbParams);

            var list = (ds.Tables[0].AsEnumerable().Select(
                df =>
                new Custom.DatosDetalleExamen
                {
                    IDLicencia = Convert.ToInt32(df[0].ToString()),
                    IDExamen = Convert.ToInt32(df[1].ToString()),
                    IDAptitud = Convert.ToInt32(df[2].ToString()),
                    NombreExamen = df[3].ToString(),
                    NombreAptitud = df[4].ToString()

                })).ToList();

            return list;
        }

        public static DataSet NuevoPaciente(Custom.DatosNuevoPaciente dto)
        {
            string procedimiento = "RC_SP_ins_Paciente";

            SqlParameter[] dbParams = new SqlParameter[18];

            dbParams[0] = new SqlParameter("@RUT", SqlDbType.Int);
            dbParams[0].Value = dto.RutPaciente;
            dbParams[1] = new SqlParameter("@DV", SqlDbType.VarChar);
            dbParams[1].Value = dto.DV;
            dbParams[2] = new SqlParameter("@NOMBRE", SqlDbType.VarChar);
            dbParams[2].Value = dto.Nombre; 
            dbParams[3] = new SqlParameter("@APELLIDOPATERNO", SqlDbType.VarChar);
            dbParams[3].Value = dto.ApellidoPaterno;
            dbParams[4] = new SqlParameter("@APELLIDOMATERNO", SqlDbType.VarChar);
            dbParams[4].Value = dto.ApellidoMaterno;
            dbParams[5] = new SqlParameter("@SEDE", SqlDbType.Int);
            dbParams[5].Value = dto.Sede;
            dbParams[6] = new SqlParameter("@SEXO", SqlDbType.Int);
            dbParams[6].Value = dto.Sexo;
            dbParams[7] = new SqlParameter("@DEPARTAMENTO", SqlDbType.Int);
            dbParams[7].Value = dto.Departamento;
            dbParams[8] = new SqlParameter("@NIVELEDUCACIONAL", SqlDbType.Int);
            dbParams[8].Value = dto.NivelEducacional;
            dbParams[9] = new SqlParameter("@ESTADOCIVIL", SqlDbType.Int);
            dbParams[9].Value = dto.EstadoCivil;
            dbParams[10] = new SqlParameter("@PREVISION", SqlDbType.Int);
            dbParams[10].Value = dto.Prevision;
            dbParams[11] = new SqlParameter("@FECHANACIMIENTO", SqlDbType.VarChar);
            dbParams[11].Value = dto.FechaNacimiento;
            dbParams[12] = new SqlParameter("@PROFESION", SqlDbType.VarChar);
            if (dto.Profesion != "") { dbParams[12].Value = dto.Profesion; } else dbParams[12].Value = null;
            dbParams[13] = new SqlParameter("@OCUPACION", SqlDbType.VarChar);
            if (dto.Ocupacion != "") { dbParams[13].Value = dto.Ocupacion; } else dbParams[13].Value = null;
            dbParams[14] = new SqlParameter("@DIRECCION", SqlDbType.VarChar);
            if (dto.Direccion != "") { dbParams[14].Value = dto.Direccion; } else dbParams[14].Value = null;
            dbParams[15] = new SqlParameter("@FONO", SqlDbType.VarChar);
            if (dto.FonoContacto.ToString() != "") { dbParams[15].Value = dto.FonoContacto; } else dbParams[15].Value = null;
            dbParams[16] = new SqlParameter("@FONOEMERGENCIA", SqlDbType.VarChar);
            if (dto.FonoEmergencia.ToString() != "") { dbParams[16].Value = dto.FonoEmergencia; } else dbParams[16].Value = null;
            dbParams[17] = new SqlParameter("@CONTACTOEMERGENCIA", SqlDbType.VarChar);
            if (dto.ContactoEmergencia != "") { dbParams[17].Value = dto.ContactoEmergencia; } else dbParams[17].Value = null;


            return CCHEN_FichaMedica_Datos.Login.ExecuteDataSet_rc(procedimiento, dbParams);
        }

        public static DataSet NuevoArchivo(Custom.DatosNuevoArchivo dto)
        {
            string procedimiento = "RC_SP_ins_registrohistorico";

            SqlParameter[] dbParams = new SqlParameter[5];

            dbParams[0] = new SqlParameter("@RUT", SqlDbType.Int);
            dbParams[0].Value = dto.Rut;
            dbParams[1] = new SqlParameter("@NOMBRE", SqlDbType.VarChar);
            dbParams[1].Value = dto.NombreArchivo;
            dbParams[2] = new SqlParameter("@EXTENSION", SqlDbType.VarChar);
            dbParams[2].Value = dto.Extension;
            dbParams[3] = new SqlParameter("@TAMANO", SqlDbType.VarChar);
            dbParams[3].Value = dto.Tamano;
            dbParams[4] = new SqlParameter("@RUTA", SqlDbType.VarChar);
            dbParams[4].Value = dto.Ruta;

            return CCHEN_FichaMedica_Datos.Login.ExecuteDataSet_rc(procedimiento, dbParams);
        }
    }

}
