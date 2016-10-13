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

namespace CCHEN_FichaMedica_Web.Cita
{
    public partial class Cita : System.Web.UI.Page
    {
        #region variables

        private static int _HoraCitaSeleccionada = 0;

        public DataTable TableCitas
        {
            get
            {
                if (ViewState["TableCitas"] != null)
                    return (DataTable)ViewState["TableCitas"];
                else
                    return null;
            }
            set
            {
                ViewState["TableCitas"] = value;
            }
        }

        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            txt_nc_fechacita.Attributes.Add("onBlur", "__doPostBack('txt_nc_fechacita','');");
            
            if (!IsPostBack)
            {
                Llena_EstadoCita(DropDownList_EstadoCita, null);
                Llena_TipoCita(DropDownList_TipoCita, null);
                LLena_Paciente(DropDownList_NombrePaciente, null);
                btn_limpiar_clic(this,e);
                ControlAlert();

            }
        }

        protected void btn_buscar_clic(object sender, EventArgs e)
        {
            ControlAlert();
            CCHEN_FichaMedica_Negocio.Custom.DatosBuscadorCita objeto = new CCHEN_FichaMedica_Negocio.Custom.DatosBuscadorCita();

            if (txt_fechacita.Text != "")
                objeto.FechaCita = Convert.ToDateTime(txt_fechacita.Text);
            else
            {
                if (DropDownList_EstadoCita.SelectedValue == "-1" && DropDownList_NombrePaciente.SelectedValue == "-1" && DropDownList_TipoCita.SelectedValue == "-1")
                {
                    objeto.FechaCita = DateTime.Today; //si no selecciono fecha del filtro, trae lo del día actual
                    txt_fechacita.Text = DateTime.Today.ToShortDateString();
                }
            }

            if (DropDownList_TipoCita.SelectedValue != "-1")
                objeto.TipoCita = Convert.ToInt32(DropDownList_TipoCita.SelectedValue);

            if (DropDownList_NombrePaciente.SelectedValue != "-1")
                objeto.RutPaciente = Convert.ToInt32(DropDownList_NombrePaciente.SelectedValue);

            if (DropDownList_EstadoCita.SelectedValue != "-1")
                objeto.EstadoCita = Convert.ToInt32(DropDownList_EstadoCita.SelectedValue);

            IList<CCHEN_FichaMedica_Negocio.Custom.ResultadoBuscadorCita> Lista = CCHEN_FichaMedica_Negocio.Cita.ObtenerCitas(objeto);

            if (Lista == null || Lista.Count == 0)
            {
                div_detalle.Visible = false;
                div_resultado.Visible = false;
                div_nueva.Visible = false;
                //ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "Mensaje", "alert('La búsqueda no arrojó resultados.')", true);
                ControlAlert();
                div_alert_busqueda_error.Visible = true;
            }
            
            else
            {
                //btn_limpiar_clic(this, e);
                TableCitas = ToDataTable(Lista.ToList());
                gvCitas.DataSource = Lista.OrderBy(p => p.FechaCita).ThenBy(p => p.HoraCita).ToList();
                gvCitas.DataBind();
                div_resultado.Visible = true;
            }   

            
        }

        protected void btn_limpiar_clic(object sender, EventArgs e)
        {
            ControlAlert();

            //limpia los DIV
            div_filtros.Visible = true;
            div_resultado.Visible = false;
            div_detalle.Visible = false;
            div_nueva.Visible = false;

            //limpia filtros de búsqueda
            DropDownList_NombrePaciente.SelectedIndex = -1;
            DropDownList_EstadoCita.SelectedIndex = -1;
            DropDownList_TipoCita.SelectedIndex = -1;
            txt_fechacita.Text = "";

            //limpia campos nueva cita
            DropDownList_nc_estadocita.Items.Clear();
            DropDownList_nc_tipocita.Items.Clear();
            DropDownList_nc_nombrepaciente.Items.Clear();
            DropDownList_nc_horacita.Items.Clear();
            txt_nc_fechacita.Text = "";
            txt_nc_numerocontacto.Text = "";
            txt_nc_observaciones.Text = "";
            txt_nc_profresponsable.Text = "";

            //limpia campos modificar
            DropDownList_EstadoCita_detalle.Items.Clear();
            DropDownList_TipoCita_detalle.Items.Clear();
            DropDownList_NombrePaciente_detalle.Items.Clear();

        }
        
        protected void btn_modificar_clic(object sender, EventArgs e)
        {
            try
            {
                CCHEN_FichaMedica_Negocio.Custom.DatosDetalleCita objeto = new CCHEN_FichaMedica_Negocio.Custom.DatosDetalleCita();

                objeto.IdCita = Convert.ToInt32(hdnIdCita.Value.ToString());
                objeto.EstadoCita = Convert.ToInt32(DropDownList_EstadoCita_detalle.SelectedValue.ToString());
                objeto.TipoCita = Convert.ToInt32(DropDownList_TipoCita_detalle.SelectedValue.ToString());
                objeto.RutPaciente = Convert.ToInt32(DropDownList_NombrePaciente_detalle.SelectedValue.ToString());
                objeto.Observaciones = txt_observaciones_detalle.Text.ToString();
                objeto.HoraRealCita = txt_hora_real_detalle.Text.ToString();
                objeto.NumeroContacto = txt_numerocontacto_detalle.Text.ToString();
                objeto.Responsable = txt_responsable_detalle.Text.ToString();

                DataSet Cita = new DataSet();
                Cita = CCHEN_FichaMedica_Negocio.Cita.ModificarCita(objeto);
                
                //ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "Mensaje", "alert('Cita modificada exitosamente.')", true);
                //btn_limpiar_clic(this, e);
                //btn_buscar_clic(this,e);
                ControlAlert();
                btn_buscar_clic(this, e);
                CargarCita(_HoraCitaSeleccionada);
                div_alert_detalle_editar_ok.Visible = true;
               
            }
            catch (Exception ex)
            {
                ControlAlert();
                div_alert_detalle_editar_error.Visible = true;
            }
        }

        protected void btn_eliminar_clic(object sender, EventArgs e)
        {
            DataSet Cita = new DataSet();
            Cita = CCHEN_FichaMedica_Negocio.Cita.EliminarCita(Convert.ToInt32(hdnIdCita.Value.ToString()));
            
            //ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "Mensaje", "alert('Cita eliminada exitosamente.')", true);
            ControlAlert();
            btn_limpiar_clic(this, e);
            btn_buscar_clic(this, e);
            div_alert_eliminar_ok.Visible = true;
               
        }

        protected void btn_verpaciente_clic(object sender, EventArgs e)
        {
            //Aqui link a detalle del paciente
            Response.Redirect("../home.aspx");
        }

        protected void btn_nuevacita_clic(object sender, EventArgs e)
        {
            btn_limpiar_clic(this, e);
            div_filtros.Visible = false;
            div_nueva.Visible = true;
            Llena_TipoCita(DropDownList_nc_tipocita, 1);
            Llena_EstadoCita(DropDownList_nc_estadocita, 1);
            LLena_Paciente(DropDownList_nc_nombrepaciente, 1);
            Llena_nc_hora("");
        }

        protected void btn_grabar_nuevacita_clic(object sender, EventArgs e)
        {
            try
            {
                CCHEN_FichaMedica_Negocio.Custom.DatosNuevaCita objeto = new CCHEN_FichaMedica_Negocio.Custom.DatosNuevaCita();

                objeto.EstadoCita = Convert.ToInt32(DropDownList_nc_estadocita.SelectedValue.ToString());
                objeto.TipoCita = Convert.ToInt32(DropDownList_nc_tipocita.SelectedValue.ToString());
                objeto.RutPaciente = Convert.ToInt32(DropDownList_nc_nombrepaciente.SelectedValue.ToString());
                objeto.Observaciones = txt_nc_observaciones.Text.ToString();
                objeto.NumeroContacto = txt_nc_numerocontacto.Text.ToString();
                objeto.Responsable = txt_nc_profresponsable.Text.ToString();
                objeto.FechaCita = txt_nc_fechacita.Text.ToString();
                objeto.HoraCita = Convert.ToInt32(DropDownList_nc_horacita.SelectedValue.ToString());

                DataSet Cita = new DataSet();
                Cita = CCHEN_FichaMedica_Negocio.Cita.NuevaCita(objeto);

                //ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "Mensaje", "alert('Cita creada exitosamente.')", true);
                ControlAlert();
                div_alert_crear_cita_ok.Visible = true;
                btn_grabar_nuevacita.Visible = false;
                txt_nc_fechacita.ReadOnly = true;
                DropDownList_nc_horacita.Attributes.Add("disabled", "disabled");
                DropDownList_nc_tipocita.Attributes.Add("disabled", "disabled");
                DropDownList_nc_nombrepaciente.Attributes.Add("disabled", "disabled");
                txt_nc_numerocontacto.ReadOnly = true;
                txt_nc_observaciones.ReadOnly = true;
                txt_nc_profresponsable.ReadOnly = true;
                DropDownList_nc_estadocita.Attributes.Add("disabled", "disabled");
                //btn_limpiar_clic(this, e);
                //btn_buscar_clic(this, e);
            }
            catch (Exception ex)
            {
                ControlAlert();
                div_alert_crear_cita_error.Visible = true;
            }
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

        protected void gvCitas_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void gvCitas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                switch (e.CommandName)
                {
                    case "Seleccionar":
                        _HoraCitaSeleccionada = Convert.ToInt32(e.CommandArgument);
                        if (_HoraCitaSeleccionada == 0)
                        {
                            //ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "Mensaje", "alert('La Cita que ha seleccionado, no contiene información.')", true);
                            ControlAlert();
                            div_alert_resultado_sininfo.Visible = true;
                            break;
                        }
                        ControlAlert();
                        CargarCita(_HoraCitaSeleccionada);
                        break;
                }
            }
            catch (Exception ex)
            {
                //ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "Mensaje", "alert('Ha ocurrido un error, favor contacte al administrador del sistema.')", true);
                ControlAlert();
                div_alert_resultado_error.Visible = true;
            }
        }

        private void CargarCita(int HoraCita)
        {
            DataSet Cita = new DataSet();
            Cita = CCHEN_FichaMedica_Negocio.Cita.ObtenerDetalleCita(HoraCita);

            div_detalle.Visible = true;
            div_nueva.Visible = false;
            //ID
            hdnIdCita.Value = Cita.Tables[0].Rows[0][0].ToString();
            //FECHA
            txt_fecha_cita_detalle.Text = Cita.Tables[0].Rows[0][1].ToString();
            //HORA
            txt_hora_detalle.Text = Cita.Tables[0].Rows[0][2].ToString();
            //HORA REAL
            txt_hora_real_detalle.Text = Cita.Tables[0].Rows[0][3].ToString();
            //TIPO CITA
            Llena_TipoCita(DropDownList_TipoCita_detalle, Convert.ToInt32(Cita.Tables[0].Rows[0][4].ToString()));
            //RUT PACIENTE
            hdnRutCita.Value = Cita.Tables[0].Rows[0][5].ToString();
            LLena_Paciente(DropDownList_NombrePaciente_detalle, Convert.ToInt32(Cita.Tables[0].Rows[0][5].ToString()));
            //NUMERO CONTACTO
            txt_numerocontacto_detalle.Text = Cita.Tables[0].Rows[0][6].ToString();
            //OBSERVACIONES
            txt_observaciones_detalle.Text = Cita.Tables[0].Rows[0][7].ToString();
            //RESPONSABLE
            txt_responsable_detalle.Text = Cita.Tables[0].Rows[0][8].ToString();
            //ESTADO CITA
            Llena_EstadoCita(DropDownList_EstadoCita_detalle, Convert.ToInt32(Cita.Tables[0].Rows[0][9].ToString()));

            //Si la cita esta realizada, no se puede volver a modificar
            if (Convert.ToInt32(Cita.Tables[0].Rows[0][9].ToString()) == 3)
            {
                txt_hora_real_detalle.Attributes["disabled"] = "disabled";
                txt_observaciones_detalle.Attributes["disabled"] = "disabled";
                txt_responsable_detalle.Attributes["disabled"] = "disabled";
                txt_numerocontacto_detalle.Attributes["disabled"] = "disabled";
                DropDownList_EstadoCita_detalle.Attributes["disabled"] = "disabled";
                DropDownList_TipoCita_detalle.Attributes["disabled"] = "disabled";
                DropDownList_NombrePaciente_detalle.Attributes["disabled"] = "disabled";
                btn_modificar.Visible = false;
                btn_eliminar.Visible = false;
            }
            else
            {
                txt_hora_real_detalle.Attributes.Remove("disabled");
                txt_observaciones_detalle.Attributes.Remove("disabled");
                txt_responsable_detalle.Attributes.Remove("disabled");
                txt_numerocontacto_detalle.Attributes.Remove("disabled");
                DropDownList_EstadoCita_detalle.Attributes.Remove("disabled");
                DropDownList_TipoCita_detalle.Attributes.Remove("disabled");
                DropDownList_NombrePaciente_detalle.Attributes.Remove("disabled");
                btn_modificar.Visible = true;
                btn_eliminar.Visible = true;
            }

                                    
        }

 
        protected void Llena_EstadoCita(DropDownList Lista, int? estadocita_id)
        {
            Lista.DataSource = CCHEN_FichaMedica_Negocio.Cita.EstadoCita();
            Lista.DataTextField = "ESTADOCITA";
            Lista.DataValueField = "ID";

            // Bind the data to the control.
            Lista.DataBind();

            if (estadocita_id != null)
            {
                ListItem selectedListItem = Lista.Items.FindByValue(estadocita_id.ToString());

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

        protected void Llena_TipoCita(DropDownList Lista, int? tipocita_id)
        {
            Lista.DataSource = CCHEN_FichaMedica_Negocio.Cita.TipoCita();
            Lista.DataTextField = "TIPOCITA";
            Lista.DataValueField = "ID";

            // Bind the data to the control.
            Lista.DataBind();

            if(tipocita_id != null)
            {
                ListItem selectedListItem = Lista.Items.FindByValue(tipocita_id.ToString());

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
            Lista.DataSource = CCHEN_FichaMedica_Negocio.Cita.NombrePaciente();
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

        protected void Llena_nc_hora(string fecha)
        {
            DropDownList_nc_horacita.DataSource = CCHEN_FichaMedica_Negocio.Cita.Hora(fecha);
            DropDownList_nc_horacita.DataTextField = "HORA";
            DropDownList_nc_horacita.DataValueField = "ID";

            // Bind the data to the control.
            DropDownList_nc_horacita.DataBind();

            // Set the default selected item, if desired.
            DropDownList_nc_horacita.SelectedIndex = 0;
        }


        protected void DropDownList_EstadoCita_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList_NombrePaciente_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList_TipoCita_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList_NombrePaciente_detalle_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList_TipoCita_detalle_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList_EstadoCita_detalle_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void txt_nc_fechacita_TextChanged(object sender, EventArgs e)
        {
            try
            {
                Llena_nc_hora(txt_nc_fechacita.Text.ToString());
            }
            catch
            {
            }
        }

        protected void DropDownList_nc_horacita_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList_nc_TipoCita_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList_nc_NombrePaciente_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList_nc_EstadoCita_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btn_volver_nuevacita_clic(object sender, EventArgs e)
        {
            Response.Redirect("Cita.aspx");
        }

        protected void ControlAlert()
        {
            div_alert_busqueda_error.Visible = false;
            div_alert_resultado_error.Visible = false;
            div_alert_resultado_sininfo.Visible = false;
            div_alert_crear_cita_error.Visible = false;
            div_alert_crear_cita_ok.Visible = false;
            div_alert_detalle_editar_error.Visible = false;
            div_alert_detalle_editar_ok.Visible = false;
            div_alert_eliminar_ok.Visible = false;
        }
    }
}