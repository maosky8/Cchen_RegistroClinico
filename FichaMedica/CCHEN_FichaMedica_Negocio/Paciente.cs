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
    public class Paciente
    {
        public Paciente()
        {
        }
    

        public static DataSet ObtenerDetallePaciente(int rut)
        {
            string procedimiento = "RC_SP_con_detalle_Paciente";

            SqlParameter[] dbParams = new SqlParameter[1];

            dbParams[0] = new SqlParameter("@RUT", SqlDbType.Int);
            dbParams[0].Value = rut;

            return CCHEN_FichaMedica_Datos.Login.ExecuteDataSet_rc(procedimiento, dbParams);
        }

        public static int ObtenerIdRegistroClinico(int rut)
        {
            string procedimiento = "RC_SP_id_registro_clinico";
            SqlParameter[] dbParams = new SqlParameter[1];
            dbParams[0] = new SqlParameter("@RUT", SqlDbType.Int);
            dbParams[0].Value = rut;
            DataSet ds = CCHEN_FichaMedica_Datos.Login.ExecuteDataSet_rc(procedimiento, dbParams);
            int id = Int32.Parse(ds.Tables[0].Rows[0][0].ToString());
            return id;
        }


    }
}
