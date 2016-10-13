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
    public class Cita
    {
        public Cita()
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

        public static DataSet Hora(string fecha)
        {
            string procedimiento = "RC_SP_con_horadisponible";

            if(fecha != null)
            {
            SqlParameter[] dbParams = new SqlParameter[1];

            dbParams[0] = new SqlParameter("@FECHA", SqlDbType.VarChar);
            dbParams[0].Value = fecha;

            return CCHEN_FichaMedica_Datos.Login.ExecuteDataSet_rc(procedimiento, dbParams);
            }
            else return CCHEN_FichaMedica_Datos.Login.ExecuteDataSet_rc(procedimiento, null);
        }

        public static DataSet EstadoCita()
        {
            string procedimiento = "RC_SP_con_Estado_Cita";
            return CCHEN_FichaMedica_Datos.Login.ExecuteDataSet_rc(procedimiento, null);
        }

        public static DataSet TipoCita()
        {
            string procedimiento = "RC_SP_con_Tipo_Cita";
            return CCHEN_FichaMedica_Datos.Login.ExecuteDataSet_rc(procedimiento, null);
        }

        /// <summary>
        /// Método que retorna las Citas de acuerdo a los criterios de búsqueda seleccionado por el usuario
        /// </summary>
        /// <returns></returns>
        public static IList<Custom.ResultadoBuscadorCita> ObtenerCitas(Custom.DatosBuscadorCita dto)
        {
            string procedimiento = "RC_SP_con_Cita";

            SqlParameter[] dbParams = new SqlParameter[4];

            dbParams[0] = new SqlParameter("@RUT", SqlDbType.Int);
            dbParams[0].Value = dto.RutPaciente;
            dbParams[1] = new SqlParameter("@TIPOCITA", SqlDbType.Int);
            dbParams[1].Value = dto.TipoCita;
            dbParams[2] = new SqlParameter("@ESTADOCITA", SqlDbType.Int);
            dbParams[2].Value = dto.EstadoCita;
            dbParams[3] = new SqlParameter("@FECHACITA", SqlDbType.VarChar);
            dbParams[3].Value = dto.FechaCita;

            DataSet ds = CCHEN_FichaMedica_Datos.Login.ExecuteDataSet_rc(procedimiento, dbParams);

            var list = (ds.Tables[0].AsEnumerable().Select(
                df =>
                new Custom.ResultadoBuscadorCita
                {
                    IdCita = Convert.ToInt32(df[0].ToString()),
                    FechaCita = df[1].ToString(),
                    HoraCita  = df[2].ToString(),
                    HoraRealCita = df[3].ToString(),
                    NombrePaciente = df[4].ToString(),
                    RutPaciente = df[5].ToString(),
                    TipoCita = df[6].ToString(),
                    EstadoCita = df[7].ToString(),
                    
                })).ToList();

            return list;
        }

        public static DataSet ObtenerDetalleCita(int horacita)
        {
            string procedimiento = "RC_SP_con_detalle_Cita";

            SqlParameter[] dbParams = new SqlParameter[1];

            dbParams[0] = new SqlParameter("@IDCITA", SqlDbType.Int);
            dbParams[0].Value = horacita;

            return CCHEN_FichaMedica_Datos.Login.ExecuteDataSet_rc(procedimiento, dbParams);
        }

        public static DataSet ModificarCita(Custom.DatosDetalleCita dto)
        {
            string procedimiento = "RC_SP_upd_cita";

            SqlParameter[] dbParams = new SqlParameter[8];

            dbParams[0] = new SqlParameter("@ID", SqlDbType.Int);
            dbParams[0].Value = dto.IdCita; 
            dbParams[1] = new SqlParameter("@RUT", SqlDbType.Int);
            dbParams[1].Value = dto.RutPaciente;
            dbParams[2] = new SqlParameter("@TIPOCITA", SqlDbType.Int);
            dbParams[2].Value = dto.TipoCita;
            dbParams[3] = new SqlParameter("@ESTADOCITA", SqlDbType.Int);
            dbParams[3].Value = dto.EstadoCita;
            dbParams[4] = new SqlParameter("@OBSERVACIONES", SqlDbType.VarChar);
            dbParams[4].Value = dto.Observaciones;
            dbParams[5] = new SqlParameter("@HORAREAL", SqlDbType.VarChar);
            dbParams[5].Value = dto.HoraRealCita;
            dbParams[6] = new SqlParameter("@NUMERO", SqlDbType.VarChar);
            if (dto.NumeroContacto != "") { dbParams[6].Value = dto.NumeroContacto; }
            else dbParams[6].Value = null;           
            dbParams[7] = new SqlParameter("@RESPONSABLE", SqlDbType.VarChar);
            dbParams[7].Value = dto.Responsable;

            return CCHEN_FichaMedica_Datos.Login.ExecuteDataSet_rc(procedimiento, dbParams);
        }

        public static DataSet NuevaCita(Custom.DatosNuevaCita dto)
        {
            string procedimiento = "RC_SP_ins_cita";

            SqlParameter[] dbParams = new SqlParameter[8];
                      
            dbParams[0] = new SqlParameter("@FECHA", SqlDbType.VarChar);
            dbParams[0].Value = dto.FechaCita;
            dbParams[1] = new SqlParameter("@HORA", SqlDbType.Int);
            dbParams[1].Value = dto.HoraCita;
            dbParams[2] = new SqlParameter("@TIPOCITA", SqlDbType.Int);
            dbParams[2].Value = dto.TipoCita;
            dbParams[3] = new SqlParameter("@ESTADOCITA", SqlDbType.Int);
            dbParams[3].Value = dto.EstadoCita;
            dbParams[4] = new SqlParameter("@RUT", SqlDbType.Int);
            dbParams[4].Value = dto.RutPaciente;
            dbParams[5] = new SqlParameter("@NUMERO", SqlDbType.VarChar);
            if (dto.NumeroContacto != "") { dbParams[5].Value = dto.NumeroContacto; }
            else dbParams[5].Value = null;
            dbParams[6] = new SqlParameter("@OBSERVACIONES", SqlDbType.VarChar);
            if (dto.Observaciones != "") { dbParams[6].Value = dto.Observaciones; }
            else dbParams[6].Value = null;
            dbParams[7] = new SqlParameter("@RESPONSABLE", SqlDbType.VarChar);
            dbParams[7].Value = dto.Responsable;

            return CCHEN_FichaMedica_Datos.Login.ExecuteDataSet_rc(procedimiento, dbParams);
        }

        public static DataSet EliminarCita(int idCita)
        {
            string procedimiento = "RC_SP_del_Cita";

            SqlParameter[] dbParams = new SqlParameter[1];

            dbParams[0] = new SqlParameter("@ID", SqlDbType.Int);
            dbParams[0].Value = idCita;

            return CCHEN_FichaMedica_Datos.Login.ExecuteDataSet_rc(procedimiento, dbParams);
        }

    }

}
