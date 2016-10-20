using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace CCHEN_FichaMedica_Web
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserName"] != null)
                {
                    lblUsuario.Text = Session["UserName"].ToString();
                    /*if (Int32.Parse(Session["Menu"].ToString()) != 1) */ 
                    CargaMenu(lblUsuario.Text);
                }
                else Response.Redirect("~/SesionExpirada.aspx");

            }
        }

        protected void CargaMenu(string usuario)
        {
            string idsistema = System.Configuration.ConfigurationManager.AppSettings["ID_Sistema"];
            int sistema = Int32.Parse(idsistema);

            DataSet rol = new DataSet();
            rol = CCHEN_FichaMedica_Negocio.Menu.ConsultaMenu(usuario, sistema);

            if (rol.Tables[0].Rows.Count != 0)
            {
                Session["Rol_id"] = rol.Tables[0].Rows[0][0].ToString();
                Session["Rol_Nombre"] = rol.Tables[0].Rows[0][1].ToString();
                Session["RUT_Sesion"] = rol.Tables[0].Rows[0][2].ToString();
                lblRol.Text = Session["Rol_Nombre"].ToString();
            }

            string menuCita = "RC_Menu_Cita";
            DataSet tareaCita = new DataSet();
            tareaCita = CCHEN_FichaMedica_Negocio.Menu.ConsultaTarea(Int32.Parse(Session["Rol_id"].ToString()), menuCita);
            if (tareaCita.Tables[0].Rows[0][0].ToString() != "0") { idlicita.Visible = true; }

            string menuRegCli = "RC_Menu_RegistroClinico";
            DataSet tareaRegCli = new DataSet();
            tareaRegCli = CCHEN_FichaMedica_Negocio.Menu.ConsultaTarea(Int32.Parse(Session["Rol_id"].ToString()), menuRegCli);
            if (tareaRegCli.Tables[0].Rows[0].ToString() != "0") { idliregcli.Visible = true; }

            Session["Menu"] = 1;

        }


    }
}
