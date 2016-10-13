using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CCHEN_FichaMedica_Web
{
    public partial class Salir : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Cookies.Add(new HttpCookie("UserName", ""));

            ClearChildState();

            Response.Redirect("http://intranet.cchen.cl");
            Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache);
        }
    }
}