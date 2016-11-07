using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CCHEN_FichaMedica_Web
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["RC_Menu_RegistroClinico"] != null)
                {
                    if (Convert.ToInt32(Session["RC_Menu_RegistroClinico"].ToString()) == 1) { div_RC_Menu_RegistroClinico.Visible = true; }
                    if (Convert.ToInt32(Session["RC_Menu_Cita"].ToString()) == 1) { div_RC_Menu_Cita.Visible = true; }
                }
            }
        }
    }
}