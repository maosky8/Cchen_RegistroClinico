using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ComponentModel;
using System.Reflection;
using System.Text;
using System.Data;
using CCHEN_FichaMedica_Negocio;
namespace CCHEN_FichaMedica_Web.RegistroClinico
{
    public partial class Paciente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LLena_Paciente(Convert.ToInt32(Request.QueryString["rut"].ToString()));

            }
        }

    private void LLena_Paciente(int rut)
    {
        DataSet Paciente = new DataSet();
        Paciente = CCHEN_FichaMedica_Negocio.Paciente.ObtenerDetallePaciente(rut);

        div_info_paciente.Visible = true;
        lbl_rut.Text = Paciente.Tables[0].Rows[0][0].ToString();
        lbl_nombre.Text = Paciente.Tables[0].Rows[0][1].ToString();
        lbl_fecha_nacimiento.Text = Paciente.Tables[0].Rows[0][2].ToString();
        lbl_sexo.Text = Paciente.Tables[0].Rows[0][3].ToString();
        lbl_profesion.Text = Paciente.Tables[0].Rows[0][4].ToString();
        lbl_nivel_educacional.Text = Paciente.Tables[0].Rows[0][5].ToString();
        lbl_ocupacion.Text = Paciente.Tables[0].Rows[0][6].ToString();
        lbl_departamento.Text = Paciente.Tables[0].Rows[0][7].ToString();
        lbl_direccion.Text = Paciente.Tables[0].Rows[0][8].ToString();
        lbl_estado_civil.Text = Paciente.Tables[0].Rows[0][9].ToString();
        lbl_sede.Text = Paciente.Tables[0].Rows[0][10].ToString();
        lbl_prevision.Text = Paciente.Tables[0].Rows[0][11].ToString();
        lbl_fono_contacto.Text = Paciente.Tables[0].Rows[0][12].ToString();
        lbl_fono_emergencia.Text = Paciente.Tables[0].Rows[0][12].ToString();
        lbl_contacto_emergencia.Text = Paciente.Tables[0].Rows[0][12].ToString();


    }

    protected void btn_modificar_clic(object sender, EventArgs e)
    {

    }

    protected void btn_volver_clic(object sender, EventArgs e)
    {
        Response.Redirect("RegistroClinico.aspx");
    }


    }
}