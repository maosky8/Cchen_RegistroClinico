using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace CCHEN_FichaMedica_Datos
{
    public class Login
    {
        public Login()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        
        public static DataSet ExecuteDataSet(string sqlSpName, SqlParameter[] dbParams)
        {
            DataSet ds = null;
            //try
            //{
            ds = new DataSet();
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            //SqlConnection cn = new SqlConnection(ConfigurationManager.AppSettings["connectionString"]);
            SqlCommand cmd = new SqlCommand(sqlSpName, con);
            cmd.CommandTimeout = 600;

            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            if (dbParams != null)
            {
                foreach (SqlParameter dbParam in dbParams)
                {
                    da.SelectCommand.Parameters.Add(dbParam);
                }
            }
            da.Fill(ds);
            //}
            //catch (Exception)
            //{
            //    throw;
            //}
            return ds;
        }

        public static DataSet ExecuteDataSet_rc(string sqlSpName, SqlParameter[] dbParams)
        {
            DataSet ds = null;
            //try
            //{
            ds = new DataSet();
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString_rc"].ConnectionString;

            //SqlConnection cn = new SqlConnection(ConfigurationManager.AppSettings["connectionString"]);
            SqlCommand cmd = new SqlCommand(sqlSpName, con);
            cmd.CommandTimeout = 600;

            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            if (dbParams != null)
            {
                foreach (SqlParameter dbParam in dbParams)
                {
                    da.SelectCommand.Parameters.Add(dbParam);
                }
            }
            da.Fill(ds);
            //}
            //catch (Exception)
            //{
            //    throw;
            //}
            return ds;
        }

    }
}
