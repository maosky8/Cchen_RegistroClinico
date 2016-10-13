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
    public partial class NuevoPaciente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Llena_Sexo(ddl_np_sexo, null);
                Llena_Sede(ddl_np_sede, null);
                Llena_NivelEducacional(ddl_np_niveleducacional, null);
                Llena_Departamento(ddl_np_departamento, null);
                Llena_EstadoCivil(ddl_np_estadocivil, null);
                Llena_Prevision(ddl_np_prevision, null);

            }
        }

        protected void btn_grabar_paciente_clic(object sender, EventArgs e)
        {
            try
            {
                CCHEN_FichaMedica_Negocio.Custom.DatosNuevoPaciente objeto = new CCHEN_FichaMedica_Negocio.Custom.DatosNuevoPaciente();

                objeto.RutPaciente = Convert.ToInt32(txt_np_rut.Text.ToString());
                objeto.DV = txt_np_dv.Text.ToString();
                objeto.Nombre = txt_np_nombre.Text.ToString();
                objeto.ApellidoPaterno = txt_np_app_pat.Text.ToString();
                objeto.ApellidoMaterno = txt_np_app_mat.Text.ToString();
                objeto.FechaNacimiento = txt_np_fechanacimiento.Text.ToString();
                objeto.Sexo = Convert.ToInt32(ddl_np_sexo.SelectedValue.ToString());
                objeto.Profesion = txt_np_profesion.Text.ToString();
                objeto.NivelEducacional = Convert.ToInt32(ddl_np_niveleducacional.SelectedValue.ToString());
                objeto.Ocupacion = txt_np_ocupacion.Text.ToString();
                objeto.Departamento = Convert.ToInt32(ddl_np_departamento.SelectedValue.ToString());
                objeto.Direccion = txt_np_direccion.Text.ToString();
                objeto.EstadoCivil = Convert.ToInt32(ddl_np_estadocivil.SelectedValue.ToString());
                objeto.Sede = Convert.ToInt32(ddl_np_sede.SelectedValue.ToString());
                objeto.Prevision = Convert.ToInt32(ddl_np_prevision.SelectedValue.ToString());
                objeto.FonoContacto = txt_np_fonocontacto.Text.ToString();
                objeto.FonoEmergencia = txt_np_fonoemergencia.Text.ToString();
                objeto.ContactoEmergencia = txt_np_contactoemergencia.Text.ToString();

                DataSet Cita = new DataSet();
                Cita = CCHEN_FichaMedica_Negocio.RegistroClinico.NuevoPaciente(objeto);

                BloquearFormulario();
                //ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "Mensaje", "alert('Paciente creado exitosamente.')", true);
                div_grabar_ok.Visible = true;
                div_grabar_error.Visible = false;
                //Response.Redirect("RegistroClinico.aspx");
            }
            catch (Exception ex)
            {
                //ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "Mensaje", "alert('Ha ocurrido un error, favor contacte al administrador del sistema.')", true);
                div_grabar_error.Visible = true;
                div_grabar_ok.Visible = false;
            }
        }

        protected void btn_grabar_volver_clic(object sender, EventArgs e)
        {
            Response.Redirect("RegistroClinico.aspx");
        }

        protected void ddl_np_sexo_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void dl_np_niveleducacional_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddl_np_departamento_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddl_np_estadocivil_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddl_np_sede_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddl_np_prevision_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void txt_np_fechanacimiento_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Llena_Sexo(DropDownList Lista, int? sexo_id)
        {
            Lista.DataSource = CCHEN_FichaMedica_Negocio.RegistroClinico.Sexo();
            Lista.DataTextField = "SEXO";
            Lista.DataValueField = "ID";

            // Bind the data to the control.
            Lista.DataBind();

            if (sexo_id != null)
            {
                ListItem selectedListItem = Lista.Items.FindByValue(sexo_id.ToString());

                if (selectedListItem != null)
                {
                    selectedListItem.Selected = true;
                }
                else Lista.SelectedIndex = 1;
            }
            else
            {
                Lista.Items.Insert(0, new ListItem("-- Seleccione --", "-1"));

                // Set the default selected item, if desired.
                Lista.SelectedIndex = 0;
            }
        }

        protected void Llena_Sede(DropDownList Lista, int? sede_id)
        {
            Lista.DataSource = CCHEN_FichaMedica_Negocio.RegistroClinico.Sede();
            Lista.DataTextField = "SEDE";
            Lista.DataValueField = "ID";

            // Bind the data to the control.
            Lista.DataBind();

            if (sede_id != null)
            {
                ListItem selectedListItem = Lista.Items.FindByValue(sede_id.ToString());

                if (selectedListItem != null)
                {
                    selectedListItem.Selected = true;
                }
                else Lista.SelectedIndex = 1;
            }

            else
            {
                Lista.Items.Insert(0, new ListItem("-- Seleccione --", "-1"));

                // Set the default selected item, if desired.
                Lista.SelectedIndex = 0;
            }
        }

        protected void Llena_NivelEducacional(DropDownList Lista, int? niveleducacional_id)
        {
            Lista.DataSource = CCHEN_FichaMedica_Negocio.RegistroClinico.NivelEducacional();
            Lista.DataTextField = "NIVELEDUCACIONAL";
            Lista.DataValueField = "ID";

            // Bind the data to the control.
            Lista.DataBind();

            if (niveleducacional_id != null)
            {
                ListItem selectedListItem = Lista.Items.FindByValue(niveleducacional_id.ToString());

                if (selectedListItem != null)
                {
                    selectedListItem.Selected = true;
                }
                else Lista.SelectedIndex = 1;
            }

            else
            {
                Lista.Items.Insert(0, new ListItem("-- Seleccione --", "-1"));

                // Set the default selected item, if desired.
                Lista.SelectedIndex = 0;
            }
        }

        protected void Llena_Departamento(DropDownList Lista, int? departamento_id)
        {
            Lista.DataSource = CCHEN_FichaMedica_Negocio.RegistroClinico.Departamento();
            Lista.DataTextField = "DEPARTAMENTO";
            Lista.DataValueField = "ID";

            // Bind the data to the control.
            Lista.DataBind();

            if (departamento_id != null)
            {
                ListItem selectedListItem = Lista.Items.FindByValue(departamento_id.ToString());

                if (selectedListItem != null)
                {
                    selectedListItem.Selected = true;
                }
                else Lista.SelectedIndex = 1;
            }

            else
            {
                Lista.Items.Insert(0, new ListItem("-- Seleccione --", "-1"));

                // Set the default selected item, if desired.
                Lista.SelectedIndex = 0;
            }
        }

        protected void Llena_EstadoCivil(DropDownList Lista, int? estadocivil_id)
        {
            Lista.DataSource = CCHEN_FichaMedica_Negocio.RegistroClinico.EstadoCivil();
            Lista.DataTextField = "ESTADOCIVIL";
            Lista.DataValueField = "ID";

            // Bind the data to the control.
            Lista.DataBind();

            if (estadocivil_id != null)
            {
                ListItem selectedListItem = Lista.Items.FindByValue(estadocivil_id.ToString());

                if (selectedListItem != null)
                {
                    selectedListItem.Selected = true;
                }
                else Lista.SelectedIndex = 1;
            }

            else
            {
                Lista.Items.Insert(0, new ListItem("-- Seleccione --", "-1"));

                // Set the default selected item, if desired.
                Lista.SelectedIndex = 0;
            }
        }

        protected void Llena_Prevision(DropDownList Lista, int? prevision_id)
        {
            Lista.DataSource = CCHEN_FichaMedica_Negocio.RegistroClinico.Prevision();
            Lista.DataTextField = "PREVISION";
            Lista.DataValueField = "ID";

            // Bind the data to the control.
            Lista.DataBind();

            if (prevision_id != null)
            {
                ListItem selectedListItem = Lista.Items.FindByValue(prevision_id.ToString());

                if (selectedListItem != null)
                {
                    selectedListItem.Selected = true;
                }
                else Lista.SelectedIndex = 1;
            }

            else
            {
                Lista.Items.Insert(0, new ListItem("-- Seleccione --", "-1"));

                // Set the default selected item, if desired.
                Lista.SelectedIndex = 0;
            }
        }

        protected void BloquearFormulario()
        {
            txt_np_rut.ReadOnly = true;
            txt_np_dv.ReadOnly = true;
            txt_np_nombre.ReadOnly = true;
            txt_np_app_pat.ReadOnly = true;
            txt_np_app_mat.ReadOnly = true;
            txt_np_fechanacimiento.ReadOnly = true;
            ddl_np_sexo.Attributes.Add("disabled", "disabled");
            txt_np_profesion.ReadOnly = true;
            ddl_np_niveleducacional.Attributes.Add("disabled", "disabled");
            txt_np_ocupacion.ReadOnly = true;
            ddl_np_departamento.Attributes.Add("disabled", "disabled");
            txt_np_direccion.ReadOnly = true;
            ddl_np_estadocivil.Attributes.Add("disabled", "disabled");
            ddl_np_sede.Attributes.Add("disabled", "disabled");
            ddl_np_prevision.Attributes.Add("disabled", "disabled");
            txt_np_fonocontacto.ReadOnly = true;
            txt_np_fonoemergencia.ReadOnly = true;
            txt_np_contactoemergencia.ReadOnly = true;
            btn_grabar_paciente.Visible = false;
        }
    }
}