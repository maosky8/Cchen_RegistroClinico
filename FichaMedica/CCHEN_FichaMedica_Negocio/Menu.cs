using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Web;
using System.Xml;
using System.Configuration;
using System.Data.SqlClient;
using CCHEN_FichaMedica_Datos;

namespace CCHEN_FichaMedica_Negocio
{
    public class Menu
    {
        public Menu()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public static DataSet ConsultaMenu(string usuario,int sistema)
        {
            string procedimiento = "AU_SP_consulta_rol";

            SqlParameter[] dbParams = new SqlParameter[2];

                  dbParams[0] = new SqlParameter("@USUARIO_USER", SqlDbType.VarChar);
                  dbParams[0].Value = usuario;
                  dbParams[1] = new SqlParameter("@SISTEMA", SqlDbType.Int);
                  dbParams[1].Value = sistema;
                
            return CCHEN_FichaMedica_Datos.Login.ExecuteDataSet(procedimiento, dbParams);
        }


        public static DataSet ConsultaTarea(int rol, string tarea)
        {
            string procedimiento = "AU_SP_consulta_tarea";

            SqlParameter[] dbParams = new SqlParameter[2];

            dbParams[0] = new SqlParameter("@ROL_ID", SqlDbType.Int);
            dbParams[0].Value = rol;
            dbParams[1] = new SqlParameter("@TAREA_NOMBRE", SqlDbType.VarChar);
            dbParams[1].Value = tarea;

            return CCHEN_FichaMedica_Datos.Login.ExecuteDataSet(procedimiento, dbParams);
        }

    }

}