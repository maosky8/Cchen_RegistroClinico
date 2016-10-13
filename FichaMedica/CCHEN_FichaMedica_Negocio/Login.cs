using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Web;
using System.Xml;
using System.Configuration;
using System.Data.SqlClient;
using CCHEN_FichaMedica_Datos;
using System.Collections.Specialized;
using System.Text;
using System.IO;


namespace CCHEN_FichaMedica_Negocio
{
    public class Login
    {
        public Login()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public static DataSet ValidaAcceso(string usuario,string contraseña, int sistema)
        {
            string procedimiento = "AU_SP_valida_acceso";

            SqlParameter[] dbParams = new SqlParameter[3];
                
                  dbParams[0] = new SqlParameter("@USUARIO", SqlDbType.VarChar);
                  dbParams[0].Value = usuario;
                  dbParams[1] = new SqlParameter("@CONTRASENA", SqlDbType.VarChar);
                  dbParams[1].Value = contraseña;
                  dbParams[2] = new SqlParameter("@SISTEMA", SqlDbType.VarChar);
                  dbParams[2].Value = sistema;
                
            return CCHEN_FichaMedica_Datos.Login.ExecuteDataSet(procedimiento, dbParams);
        }

    }

}
