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
    public partial class RegistroClinico : System.Web.UI.Page
    {
        #region variables
        private static int _PacienteSeleccionado = 0;
        public DataTable TableRegistroClinico
        {
            get
            {
                if (ViewState["TableRegistroClinico"] != null)
                    return (DataTable)ViewState["TableRegistroClinico"];
                else
                    return null;
            }
            set
            {
                ViewState["TableRegistroClinico"] = value;
            }
        }

        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Llena_Sexo(ddl_bsq_sexo, null);
                Llena_Sede(ddl_bsq_sede, null);
                LLena_Paciente(ddl_bsq_NombrePaciente, null);
                btn_limpiar_clic(this, e);
                ControlAlert();
                ControlDisplayDiv();

            }
        }

        protected void ddl_bsq_NombrePaciente_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddl_bsq_sexo_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddl_bsq_sede_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btn_buscar_clic(object sender, EventArgs e)
        {
            ControlAlert();
            CCHEN_FichaMedica_Negocio.Custom.DatosBuscadorRegistroClinico objeto = new CCHEN_FichaMedica_Negocio.Custom.DatosBuscadorRegistroClinico();

            if (ddl_bsq_sede.SelectedValue != "-1")
                objeto.Sede = Convert.ToInt32(ddl_bsq_sede.SelectedValue);

            if (ddl_bsq_sexo.SelectedValue != "-1")
                objeto.Sexo = Convert.ToInt32(ddl_bsq_sexo.SelectedValue);

            if (txt_bsq_rut.Text != "")
            {
                objeto.RutPaciente = Convert.ToInt32(txt_bsq_rut.Text.ToString());
                ddl_bsq_NombrePaciente.SelectedIndex = -1;
            }
            else if (ddl_bsq_NombrePaciente.SelectedValue != "-1")
                objeto.RutPaciente = Convert.ToInt32(ddl_bsq_NombrePaciente.SelectedValue);

            IList<CCHEN_FichaMedica_Negocio.Custom.ResultadoBuscadorRegistroClinico> Lista = CCHEN_FichaMedica_Negocio.RegistroClinico.ObtenerRegistroClinico(objeto);

            if (Lista == null || Lista.Count == 0)
            {
                //div_detalle.Visible = false;
                div_resultado.Visible = false;
                //div_nueva.Visible = false;
                //ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "Mensaje", "alert('La búsqueda no arrojó resultados.')", true);
                ControlAlert();
                div_alert_busqueda_error.Visible = true;
            }

            else
            {
                //btn_limpiar_clic(this, e);
                TableRegistroClinico = ToDataTable(Lista.ToList());
                gvRegistroClinico.DataSource = Lista.OrderBy(p => p.NombrePaciente).ThenBy(p => p.IdRutPaciente).ToList();
                gvRegistroClinico.DataBind();
                div_resultado.Visible = true;
            }   
        }

        protected void btn_limpiar_clic(object sender, EventArgs e)
        {
            ControlAlert();

            //limpia los DIV
            div_filtros.Visible = true;
            div_resultado.Visible = false;
            //div_detalle.Visible = false;
            //div_nueva.Visible = false;

            //limpia filtros de búsqueda
            ddl_bsq_NombrePaciente.SelectedIndex = -1;
            ddl_bsq_sede.SelectedIndex = -1;
            ddl_bsq_sexo.SelectedIndex = -1;
            txt_bsq_rut.Text = "";

        }

        protected void btn_nuevopaciente_clic(object sender, EventArgs e)
        {
            Response.Redirect("NuevoPaciente.aspx");
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

        protected void LLena_Paciente(DropDownList Lista, int? rut)
        {
            Lista.DataSource = CCHEN_FichaMedica_Negocio.RegistroClinico.NombrePaciente();
            Lista.DataTextField = "NOMBRE";
            Lista.DataValueField = "RUT";

            // Bind the data to the control.
            Lista.DataBind();

            if (rut != null)
            {
                ListItem selectedListItem = Lista.Items.FindByValue(rut.ToString());

                if (selectedListItem != null)
                {
                    selectedListItem.Selected = true;
                }
                else Lista.SelectedIndex = 0;
            }
            else
            {
                Lista.Items.Insert(0, new ListItem("-- Seleccione --", "-1"));

                // Set the default selected item, if desired.
                Lista.SelectedIndex = 0;
            }
        }

        protected void gvRegistroClinico_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void gvRegistroClinico_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                switch (e.CommandName)
                {
                    case "Seleccionar":
                        _PacienteSeleccionado = Convert.ToInt32(e.CommandArgument);
                        if (_PacienteSeleccionado == 0)
                        {
                            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "Mensaje", "alert('El Paciente que ha seleccionado, no contiene información.')", true);
                            break;
                        }
                        CargarPaciente(_PacienteSeleccionado);
                        break;
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "Mensaje", "alert('Ha ocurrido un error, favor contacte al administrador del sistema.')", true);
            }
        }

        protected void CargarPaciente(int RutPaciente)
        {
            Response.Redirect("Paciente.aspx?rut=" + RutPaciente.ToString());
        }

        public static DataTable ToDataTable<T>(List<T> items)
        {
            DataTable dataTable = new DataTable(typeof(T).Name);
            //se obtienen todas las propiedades
            PropertyInfo[] Props = typeof(T).GetProperties(BindingFlags.Public | BindingFlags.Instance);

            foreach (PropertyInfo prop in Props)
            {
                //se setea el nombre de la columna que se otiene de las propiedades
                dataTable.Columns.Add(prop.Name);
            }

            foreach (T item in items)
            {
                var values = new object[Props.Length];
                for (int i = 0; i < Props.Length; i++)
                {
                    //se inserta el valor de la propiedad en la fila del datatable
                    values[i] = Props[i].GetValue(item, null);
                }
                dataTable.Rows.Add(values);
            }
            return dataTable;
        }

        protected void ControlAlert()
        {
            div_alert_busqueda_error.Visible = false;
        }

        protected void ControlDisplayDiv()
        {
            string BuscarRegistroClinico = "RC_Accion_BuscarRegistroClinico";
            string NuevoPaciente = "RC_Accion_NuevoPaciente";

            if (ControlDisplay(BuscarRegistroClinico)) btn_buscar.Visible = true; else btn_buscar.Visible = false;
            if (ControlDisplay(NuevoPaciente)) btn_nuevopaciente.Visible = true; else btn_nuevopaciente.Visible = false;
        }

        protected bool ControlDisplay(string Accion)
        {
            try
            {
                DataSet tarea = new DataSet();
                tarea = CCHEN_FichaMedica_Negocio.Menu.ConsultaTarea(Int32.Parse(Session["Rol_id"].ToString()), Accion);
                if (tarea.Tables[0].Rows[0][0].ToString() != "0") { return true; } else return false;
            }
            catch(Exception ex)
            {
                Response.Redirect("~/SesionExpirada.aspx");
                return false;
            }
        }
    }
}