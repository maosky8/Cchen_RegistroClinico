using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CCHEN_FichaMedica_Negocio;
using System.Data;

namespace CCHEN_FichaMedica_Web
{
    public partial class Login : System.Web.UI.Page
    {
        public void Page_Load(object sender, EventArgs e)
        {


        }

        public void btn_ingresar_clic(object sender, EventArgs e)
        {
            try
            {
                if (txtContraseña.Value == "" || txtNombre.Value == "")
                {
                    txtNombre.Value = "";
                    txtContraseña.Value = "";
                    SinAcceso();
                }
                else
                {
                    string idsistema = System.Configuration.ConfigurationManager.AppSettings["ID_Sistema"];
                    int sistema = Int32.Parse(idsistema);

                    DataSet Acceso = new DataSet();
                    Acceso = CCHEN_FichaMedica_Negocio.Login.ValidaAcceso(txtNombre.Value, txtContraseña.Value, sistema );

                    if (Acceso.Tables[0].Rows.Count == 1)
                    {
                        Session["UserName"] = txtNombre.Value;
                        Session["Menu"] = 0;

                        if (Session["UserName"] != null)
                        {
                            HttpCookie addCookie = new HttpCookie("UserName", Session["UserName"].ToString());
                            Response.Cookies.Add(addCookie);
                            Response.Redirect("Home.aspx" + "?user=" + Session["UserName"].ToString() + "&aut=true");

                        }
                    }
                    else
                    {
                        SinAcceso();
                    }

                }
            }


            
                     
            catch (Exception ex)
            {
                SinAcceso();
            }
        }

        private void SinAcceso()
        {
            divAlert.Visible = true;
        }


    }
}