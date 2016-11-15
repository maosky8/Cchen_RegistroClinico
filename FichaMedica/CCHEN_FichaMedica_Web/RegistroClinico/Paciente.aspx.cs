using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.ComponentModel;
using System.Reflection;
using System.Text;
using System.Data;
using CCHEN_FichaMedica_Negocio;
using System.IO;

namespace CCHEN_FichaMedica_Web.RegistroClinico
{
    public partial class Paciente : System.Web.UI.Page
    {

        #region variables
        private static int _ArchivoSeleccionado = 0;
        private static int _LicenciaSeleccionada = 0;
        
        public DataTable TableRegistroHistorico
        {
            get
            {
                if (ViewState["TableRegistroHistorico"] != null)
                    return (DataTable)ViewState["TableRegistroHistorico"];
                else
                    return null;
            }
            set
            {
                ViewState["TableRegistroHistorico"] = value;
            }
        }
        public DataTable TableLicenciaOperacional
        {
            get
            {
                if (ViewState["TableLicenciaOperacional"] != null)
                    return (DataTable)ViewState["TableLicenciaOperacional"];
                else
                    return null;
            }
            set
            {
                ViewState["TableLicenciaOperacional"] = value;
            }
        }
        public DataTable TableDetalleLicenciaOperacional
        {
            get
            {
                if (ViewState["TableDetalleLicenciaOperacional"] != null)
                    return (DataTable)ViewState["TableDetalleLicenciaOperacional"];
                else
                    return null;
            }
            set
            {
                ViewState["TableLicenciaOperacional"] = value;
            }
        }
        public DataTable TableNuevaLicenciaOperacional
        {
            get
            {
                if (ViewState["TableNuevaLicenciaOperacional"] != null)
                    return (DataTable)ViewState["TableNuevaLicenciaOperacional"];
                else
                    return null;
            }
            set
            {
                ViewState["TableNuevaLicenciaOperacional"] = value;
            }
        }
        //FileUpload SubirArchivos = new FileUpload();

        public DataTable TableAnalisisLab
        {
            get
            {
                if (ViewState["TableAnalisisLab"] != null)
                    return (DataTable)ViewState["TableAnalisisLab"];
                else
                    return null;
            }
            set
            {
                ViewState["TableAnalisisLab"] = value;
            }
        }
        #endregion

        protected void Page_Load(object sender, EventArgs e)
            {
                if (!IsPostBack)
                {
                    Session["RutPaciente"] = Convert.ToInt32(Request.QueryString["rut"].ToString());
                    LLena_Paciente(Convert.ToInt32(Session["RutPaciente"].ToString()));
                    ControlDisplayDiv();
                    Buscar_RegistroHistorico(Convert.ToInt32(Request.QueryString["rut"].ToString()));
                    Buscar_LicenciaOperacional( Convert.ToInt32(Request.QueryString["rut"].ToString()) , Convert.ToInt32(Session["RUT_Sesion"].ToString()) );
                    Cargar_AnalisisClinico(Convert.ToInt32(Request.QueryString["rut"].ToString()));
                    Cargar_ConsultaAnalisis();
            }
            }

        //ERIC
        protected void Cargar_AnalisisClinico(int rut)
        {
            Llena_AnalisisLaboratorio(ddl_AnalisisLab);
        }

        protected void Llena_AnalisisLaboratorio(DropDownList ddl)
        {
            ddl.DataSource = CCHEN_FichaMedica_Negocio.RegistroClinico.AnalisisDeLaboratorio();
            ddl.DataValueField = "ID";
            ddl.DataTextField = "EXAMEN";
            ddl.DataBind();

            ddl.Items.Insert(0, new ListItem("-- Seleccione --", "-1"));
            ddl.SelectedIndex = 0;
        }


        protected void btn_modificar_clic(object sender, EventArgs e)
        {
            btn_grabar_modificacion_paciente.Visible = true;
            btn_modificar_paciente.Visible = false;
            div_detalle_paciente.Visible = false;

            lbl_profesion.Attributes.Remove("disabled");
            lbl_ocupacion.Attributes.Remove("disabled");
            lbl_direccion.Attributes.Remove("disabled");
            lbl_contacto_emergencia.Attributes.Remove("disabled");
            lbl_fono_contacto.Attributes.Remove("disabled");
            lbl_fono_emergencia.Attributes.Remove("disabled");

            DropDownList_sede_detalle.Attributes.Remove("disabled");
            DropDownList_prevision_detalle.Attributes.Remove("disabled");
            DropDownList_departamento_detalle.Attributes.Remove("disabled");
            DropDownList_estadocivil_detalle.Attributes.Remove("disabled");
            DropDownList_niveleducacional_detalle.Attributes.Remove("disabled");

        }

        protected void btn_volver_clic(object sender, EventArgs e)
        {
            Response.Redirect("RegistroClinico.aspx");
        }

        protected void btn_subir_registrohistorico_clic(object sender, EventArgs e)
        {
            //variable para la persistencia
            hidTAB.Value = "registros_historicos";

            if (this.SubirArchivos.HasFile)
            {
                var pathCarpetaDestino = System.IO.Path.Combine(Server.MapPath("~/"), "Upload/" + Convert.ToInt32(Request.QueryString["rut"].ToString()));
                var carpetaDestino = new System.IO.DirectoryInfo(pathCarpetaDestino);
                if (!carpetaDestino.Exists)
                    carpetaDestino.Create();

                var nombreArchivo = System.IO.Path.GetFileName(SubirArchivos.FileName);
                var pathArchivoDestino = System.IO.Path.Combine(pathCarpetaDestino, nombreArchivo);
                //SubirArchivos.SaveAs(pathArchivoDestino);

                String archivoExtension = System.IO.Path.GetExtension(SubirArchivos.FileName).ToLower();
                String[] arrExtensiones = System.Configuration.ConfigurationManager.AppSettings["ExtensionesDocumentos"].Split(',');
                int tamañoMaximo = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["TamañoMaxAdjunto"].ToString());
                int tamañoAdjuntoValido = tamañoMaximo * 1024;
                int tamañoMB = (tamañoMaximo / 1024);
                int tamañoArchivo = (Convert.ToInt32(SubirArchivos.PostedFile.ContentLength.ToString()) / 1024);


                //Recorre la lista con las extensiones permitidas de archivos

                for (int i = 0; i < arrExtensiones.Length; i++)
                {
                    //Te permite grabar si la extension es valida
                    if (archivoExtension == arrExtensiones[i])
                    {
                        //Te permite grabar si el tamaño es menor o igual al permitido
                        if (SubirArchivos.PostedFile.ContentLength <= tamañoAdjuntoValido)
                        {
                            SubirArchivos.SaveAs(pathArchivoDestino);

                            CCHEN_FichaMedica_Negocio.Custom.DatosNuevoArchivo objeto = new CCHEN_FichaMedica_Negocio.Custom.DatosNuevoArchivo();

                            objeto.Rut = Convert.ToInt32(Session["RutPaciente"].ToString());
                            objeto.NombreArchivo = nombreArchivo.ToString();
                            objeto.Extension = archivoExtension.ToString();
                            objeto.Tamano = tamañoArchivo.ToString() + " KB";
                            objeto.Ruta = "/Upload/" + Session["RutPaciente"].ToString() + "/" + nombreArchivo.ToString();


                            DataSet Archivo = new DataSet();
                            Archivo = CCHEN_FichaMedica_Negocio.RegistroClinico.NuevoArchivo(objeto);
                            Buscar_RegistroHistorico(Convert.ToInt32(Session["RutPaciente"].ToString()));
                            ControlAlert();
                            div_alert_subir_archivo_ok.Visible = true;
                            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "Mensaje", "openTabs(event, 'registros_historicos')", true);
                            return;

                        }
                        else

                        {
                            //tamaño no valido
                            ControlAlert();
                            div_alert_subir_archivo_tamano.Visible = true;
                            return;
                        }
                    }
                }
                // extension no valida
                ControlAlert();
                div_alert_subir_archivo_extension.Visible = true;

            }
            else
            {
                //no hay archivo para subir
                ControlAlert();
                div_alert_subir_archivo_vacio.Visible = true;
            }
        }

        protected void btn_nueva_licenciaoperacional_clic(object sender, EventArgs e)
        {
            //variable para la persistencia
            hidTAB.Value = "licencias_operacionales";
            CargarNuevaLicenciaOperacional();
        }

        protected void btn_modificar_licenciaoperacional_clic(object sender, EventArgs e)
        {
            DataSet ModLicOpe = new DataSet();
            ModLicOpe = CCHEN_FichaMedica_Negocio.RegistroClinico.ModificarLicenciaOperacional(_LicenciaSeleccionada, Convert.ToInt32(txt_dias_detalle.Text.ToString()), Convert.ToInt32(DropDownList_estadolicencia_detalle.SelectedValue.ToString()), txt_apreciacion_detalle.Text.ToString());

            ControlAlert();
            Buscar_LicenciaOperacional(Convert.ToInt32(Request.QueryString["rut"].ToString()), Convert.ToInt32(Session["RUT_Sesion"].ToString()));
            div_nueva_licenciaoperacional.Visible = false;
            div_resultado_licenciaoperacional.Visible = true;
            div_detalle_licenciaoperacional.Visible = false;
            div_alert_modificarlicope_ok.Visible = true;
        }

        protected void btn_eliminar_licenciaoperacional_clic(object sender, EventArgs e)
        {
            DataSet ElimLicOpe = new DataSet();
            ElimLicOpe = CCHEN_FichaMedica_Negocio.RegistroClinico.EliminarLicenciaOperacional(_LicenciaSeleccionada);

            ControlAlert();
            Buscar_LicenciaOperacional(Convert.ToInt32(Request.QueryString["rut"].ToString()), Convert.ToInt32(Session["RUT_Sesion"].ToString()));
            div_nueva_licenciaoperacional.Visible = false;
            div_resultado_licenciaoperacional.Visible = true;
            div_detalle_licenciaoperacional.Visible = false;
            div_alert_eliminarlicope_ok.Visible = true;
        }

        protected void btn_grabarnueva_licenciaoperacional_clic(object sender, EventArgs e)
        {
            int examenchequeado = 0;
            try                
            {
                //validar todos los radiobuttom chequeados
                foreach (GridViewRow Row in gvNuevaLicenciaOperacional.Rows)
                {
                    var apto = Row.FindControl("rb_apto") as RadioButton;
                    var rest = Row.FindControl("rb_rest") as RadioButton;
                    var noapto = Row.FindControl("rb_noapto") as RadioButton;
                    if (apto.Checked)
                    {
                        examenchequeado = examenchequeado + 1;
                        continue;
                    }
                    else if (rest.Checked)
                    {
                        examenchequeado = examenchequeado + 1;
                        continue;
                    }
                    else if (noapto.Checked)
                    {
                        examenchequeado = examenchequeado + 1;
                        continue;
                    }
                }

                if (examenchequeado != 0)
                {
                    CCHEN_FichaMedica_Negocio.Custom.DatosNuevaLicenciaOperacional objeto = new CCHEN_FichaMedica_Negocio.Custom.DatosNuevaLicenciaOperacional();

                    objeto.FechaRegistro = DateTime.Now.ToShortDateString();
                    objeto.FechaInicio = Convert.ToDateTime(txt_fechainicio_nueva_lo.Text).ToShortDateString();
                    objeto.FechaFin = Convert.ToDateTime(txt_fechatermino_nueva_lo.Text).ToShortDateString();
                    objeto.Dias = Convert.ToInt32(txt_dias_nueva_lo.Text.ToString());
                    objeto.Apreciacion = txt_apreciacion_nueva_lo.Text.ToString();
                    objeto.EstadoLicenciaOperacional = Convert.ToInt32(DropDownList_EstadoLicencia.SelectedValue.ToString());
                    objeto.RegistroClinicoID = Convert.ToInt32(Session["IdRegistroClinico"].ToString());


                    DataSet LicenciaOperacional = new DataSet();
                    LicenciaOperacional = CCHEN_FichaMedica_Negocio.RegistroClinico.NuevaLicenciaOperacional(objeto);
                    int nueva_LicOpe = Convert.ToInt32(LicenciaOperacional.Tables[0].Rows[0][0].ToString());

                    foreach (GridViewRow Row in gvNuevaLicenciaOperacional.Rows)
                    {
                        //int idExamen = (int)System.Web.UI.DataBinder.Eval(Row.DataItem, "IDExamen");
                        var apto = Row.FindControl("rb_apto") as RadioButton;
                        var rest = Row.FindControl("rb_rest") as RadioButton;
                        var noapto = Row.FindControl("rb_noapto") as RadioButton;
                        int idExamen = Convert.ToInt32(gvNuevaLicenciaOperacional.DataKeys[Row.RowIndex].Values[0].ToString());
                        if (apto.Checked) GrabarLicOpeExamenFisico(nueva_LicOpe, idExamen, 1);
                        if (rest.Checked) GrabarLicOpeExamenFisico(nueva_LicOpe, idExamen, 2);
                        if (noapto.Checked) GrabarLicOpeExamenFisico(nueva_LicOpe, idExamen, 3);
                    }
                    ControlAlert();
                    Buscar_LicenciaOperacional(Convert.ToInt32(Request.QueryString["rut"].ToString()), Convert.ToInt32(Session["RUT_Sesion"].ToString()));
                    div_nueva_licenciaoperacional.Visible = false;
                    div_resultado_licenciaoperacional.Visible = true;
                    div_detalle_licenciaoperacional.Visible = false;
                    div_alert_nuevalicope_ok.Visible = true;
                }
                else
                {
                    ControlAlert();
                    div_alert_examen_vacio.Visible = true;
                }

               
            }
            catch (Exception ex)
            {
                div_alert_nuevalicope_error.Visible = true;
            }
        }

        protected void GrabarLicOpeExamenFisico(int LicenciaOperacionalID, int ExamenID, int AptitudID)
        {
            CCHEN_FichaMedica_Negocio.Custom.DatosNuevaLicOpeExamenFisico objeto = new CCHEN_FichaMedica_Negocio.Custom.DatosNuevaLicOpeExamenFisico();

            objeto.idLicenciaOperacional = LicenciaOperacionalID;
            objeto.idExamen = ExamenID;
            objeto.idAptitud = AptitudID;
            
            DataSet LicOpeExamenFisico = new DataSet();
            LicOpeExamenFisico = CCHEN_FichaMedica_Negocio.RegistroClinico.NuevaLicOpeExamenFisico(objeto);
        }

        protected void btn_volvernueva_licenciaoperacional_clic(object sender, EventArgs e)
        {
            Buscar_LicenciaOperacional(Convert.ToInt32(Request.QueryString["rut"].ToString()), Convert.ToInt32(Session["RUT_Sesion"].ToString()));
            div_nueva_licenciaoperacional.Visible = false;
            div_detalle_licenciaoperacional.Visible = false;
        }

        protected void ControlDisplayDiv()
        {
            string ModificarPaciente = "RC_Accion_ModificarPaciente";
            string HistorialAtenciones = "RC_Ver_HistorialAtenciones";
            string LicenciaOperacional = "RC_Ver_LicenciaOperacional";
            string AnalisisClinico = "RC_Ver_AnalisisClinico";
            string RegistroHistorico = "RC_Ver_RegistroHistorico";

            if (ControlDisplay(ModificarPaciente)) btn_modificar_paciente.Visible = true; else btn_modificar_paciente.Visible = false;
            if (ControlDisplay(HistorialAtenciones)) div_historial_atenciones.Visible = true; else { div_historial_atenciones.Visible = false; div_alert_historial_atenciones_error.Visible = true; }
            if (ControlDisplay(LicenciaOperacional)) div_licencias_operacionales.Visible = true; else { div_licencias_operacionales.Visible = false; div_alert_licencias_operacionales_error.Visible = true; }
            if (ControlDisplay(AnalisisClinico)) div_analisis_clinicos.Visible = true; else { div_analisis_clinicos.Visible = false; div_alert_analisis_clinicos_error.Visible = true; }
            if (ControlDisplay(RegistroHistorico)) div_registros_historicos.Visible = true; else { div_registros_historicos.Visible = false; div_alert_registros_historicos_error.Visible = true; }

            }

        protected bool ControlDisplay(string Accion)
        {
            DataSet tarea = new DataSet();
            tarea = CCHEN_FichaMedica_Negocio.Menu.ConsultaTarea(Int32.Parse(Session["Rol_id"].ToString()), Accion);
            if (tarea.Tables[0].Rows[0][0].ToString() != "0") { return true; } else return false;
        }

        protected void ControlAlert()
        {
            //esconde todos los alert que esten visibles; usar antes de mostrar otro alert, antes de limpiar, o al volver de otra página
            div_alert_analisis_clinicos_error.Visible = false;
            div_alert_historial_atenciones_error.Visible = false;
            div_alert_licencias_operacionales_error.Visible = false;
            div_alert_registros_historicos_error.Visible = false;
            div_alert_registros_historicos_vacio.Visible = false;
            div_alert_subir_archivo_error.Visible = false;
            div_alert_subir_archivo_extension.Visible = false;
            div_alert_subir_archivo_ok.Visible = false;
            div_alert_subir_archivo_tamano.Visible = false;
            div_alert_subir_archivo_vacio.Visible = false;
            div_alert_examen_vacio.Visible = false;
            div_alert_licenciaOperacional_vacio.Visible = false;
            div_alert_nuevalicope_ok.Visible = false;
            div_alert_nuevalicope_error.Visible = false;
            div_alert_eliminarlicope_ok.Visible = false;
            div_alert_modificarlicope_ok.Visible = false;
            div_alert_busqueda_analisislab_error.Visible = false;
            div_alert_analisis_clinicos_exito.Visible = false;
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
            //lbl_nivel_educacional.Text = Paciente.Tables[0].Rows[0][5].ToString();
            lbl_ocupacion.Text = Paciente.Tables[0].Rows[0][6].ToString();
            //lbl_departamento.Text = Paciente.Tables[0].Rows[0][7].ToString();
            lbl_direccion.Text = Paciente.Tables[0].Rows[0][8].ToString();
            //lbl_estado_civil.Text = Paciente.Tables[0].Rows[0][9].ToString();
            //lbl_sede.Text = Paciente.Tables[0].Rows[0][10].ToString();
            //lbl_prevision.Text = Paciente.Tables[0].Rows[0][11].ToString();
            lbl_fono_contacto.Text = Paciente.Tables[0].Rows[0][12].ToString();
            lbl_fono_emergencia.Text = Paciente.Tables[0].Rows[0][13].ToString();
            lbl_contacto_emergencia.Text = Paciente.Tables[0].Rows[0][14].ToString();
            Session["IdRegistroClinico"] = Paciente.Tables[0].Rows[0][15].ToString();
            Llena_Sede(DropDownList_sede_detalle, Convert.ToInt32(Paciente.Tables[0].Rows[0][10].ToString()));
            Llena_NivelEducacional(DropDownList_niveleducacional_detalle, Convert.ToInt32(Paciente.Tables[0].Rows[0][5].ToString()));
            Llena_Departamento(DropDownList_departamento_detalle, Convert.ToInt32(Paciente.Tables[0].Rows[0][7].ToString()));
            Llena_EstadoCivil(DropDownList_estadocivil_detalle, Convert.ToInt32(Paciente.Tables[0].Rows[0][9].ToString()));
            Llena_Prevision(DropDownList_prevision_detalle, Convert.ToInt32(Paciente.Tables[0].Rows[0][11].ToString()));

            lbl_rut.Attributes["disabled"] = "disabled";
            lbl_nombre.Attributes["disabled"] = "disabled";
            lbl_fecha_nacimiento.Attributes["disabled"] = "disabled";
            lbl_sexo.Attributes["disabled"] = "disabled";

            lbl_profesion.Attributes["disabled"] = "disabled";
            lbl_ocupacion.Attributes["disabled"] = "disabled";
            lbl_direccion.Attributes["disabled"] = "disabled";
            lbl_fono_contacto.Attributes["disabled"] = "disabled";
            lbl_fono_emergencia.Attributes["disabled"] = "disabled";
            lbl_contacto_emergencia.Attributes["disabled"] = "disabled";
            DropDownList_niveleducacional_detalle.Attributes["disabled"] = "disabled";
            DropDownList_departamento_detalle.Attributes["disabled"] = "disabled";
            DropDownList_estadocivil_detalle.Attributes["disabled"] = "disabled";
            DropDownList_prevision_detalle.Attributes["disabled"] = "disabled";
            DropDownList_sede_detalle.Attributes["disabled"] = "disabled";

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

        protected void Buscar_RegistroHistorico(int rut)
        {
            IList<CCHEN_FichaMedica_Negocio.Custom.ResultadoRegistroHistorico> Lista = CCHEN_FichaMedica_Negocio.RegistroClinico.ObtenerRegistroHistorico(rut, null);

            if (Lista == null || Lista.Count == 0)
            {
                ControlAlert();
                div_alert_registros_historicos_vacio.Visible = true;
            }

            else
            {
                TableRegistroHistorico = ToDataTable(Lista.ToList());
                gvRegistroHistorico.DataSource = Lista.OrderBy(p => p.NombreArchivo).ThenBy(p => p.Tamano).ToList();
                gvRegistroHistorico.DataBind();
                div_resultado_registrohistorico.Visible = true;
            }
        }

        protected void Buscar_LicenciaOperacional(int rutpaciente, int rutmedico)
        {
            IList<CCHEN_FichaMedica_Negocio.Custom.ResultadoLicenciaOperacional> Lista = CCHEN_FichaMedica_Negocio.RegistroClinico.ObtenerLicenciaOperacional(rutpaciente, rutmedico);

            if (Lista == null || Lista.Count == 0)
            {
                ControlAlert();
                div_alert_licenciaOperacional_vacio.Visible = true;
            }

            else
            {
                TableLicenciaOperacional = ToDataTable(Lista.ToList());
                gvLicenciaOperacional.DataSource = Lista.OrderBy(p => p.IdLicenciaOperacional).ThenBy(p => p.FechaRegistro).ToList();
                gvLicenciaOperacional.DataBind();
                div_resultado_licenciaoperacional.Visible = true;
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

        protected void DescargarArchivo(int ArchivoSeleccionado)
        {
            IList<CCHEN_FichaMedica_Negocio.Custom.ResultadoRegistroHistorico> Lista = CCHEN_FichaMedica_Negocio.RegistroClinico.ObtenerRegistroHistorico(Convert.ToInt32(Session["RutPaciente"].ToString()), ArchivoSeleccionado);
            string[] url = Server.MapPath(Lista[0].Ruta.ToString()).Split('/');
            string nombreArchivo = Session["RutPaciente"].ToString() + '_' + Lista[0].NombreArchivo.ToString();//url[url.Length - 1];
            FileInfo _objFileInfo;
            BinaryReader _objReader;
            FileStream _objFiles;
            Byte[] bytes;
            MemoryStream mem = new MemoryStream();
            _objFileInfo = new FileInfo(HttpContext.Current.Server.MapPath(Lista[0].Ruta.ToString()));
            _objFiles = new FileStream(HttpContext.Current.Server.MapPath(Lista[0].Ruta.ToString()), FileMode.Open);
            _objReader = new BinaryReader(_objFiles);
            bytes = _objReader.ReadBytes((int)_objFileInfo.Length);
            mem.Write(bytes, 0, bytes.Length);
            Page.Response.ClearHeaders();
            Page.Response.ClearContent();
            Page.Response.Buffer = true;
            Page.Response.ContentType = "application/octet-stream";
            Page.Response.AddHeader("Content-Disposition", string.Format("attachment; filename=\"{0}\"", nombreArchivo));
            Page.Response.OutputStream.Write(mem.ToArray(), 0, Convert.ToInt32(mem.Length));
            Page.Response.Flush();
            Page.Response.Close();
            _objFiles.Dispose();
            _objReader.Close();
            mem.Close();
        }

        protected void CargarNuevaLicenciaOperacional()
        {
            div_nueva_licenciaoperacional.Visible = true;
            div_resultado_licenciaoperacional.Visible = false;
            div_detalle_licenciaoperacional.Visible = false;

            IList<CCHEN_FichaMedica_Negocio.Custom.DatosNuevoExamen> Lista = CCHEN_FichaMedica_Negocio.RegistroClinico.ObtenerNuevoExamenFisico();

            if (Lista == null || Lista.Count == 0)
            {
                //ControlAlert();
                //div_alert_licenciaOperacional_vacio.Visible = true;
            }

            else
            {
                TableNuevaLicenciaOperacional = ToDataTable(Lista.ToList());
                gvNuevaLicenciaOperacional.DataSource = Lista.OrderBy(p => p.idExamen).ThenBy(p => p.NombreExamen).ToList();
                gvNuevaLicenciaOperacional.DataBind();
            }

            CargarDdlEstadoLicenciaOperacional(DropDownList_EstadoLicencia, null);
        }

        protected void CargarDdlEstadoLicenciaOperacional(DropDownList Lista, int? id)
        {
            Lista.DataSource = CCHEN_FichaMedica_Negocio.RegistroClinico.EstadoLicenciaOperacional();
            Lista.DataTextField = "NOMBRE";
            Lista.DataValueField = "ID";

            // Bind the data to the control.
            Lista.DataBind();

            if (id != null)
            {
                ListItem selectedListItem = Lista.Items.FindByValue(id.ToString());

                if (selectedListItem != null)
                {
                    selectedListItem.Selected = true;
                }
                else Lista.SelectedIndex = 1;
            }
            else
            {
                //Lista.Items.Insert(0, new ListItem("-- Seleccione --", "-1"));

                // Set the default selected item, if desired.
                Lista.SelectedIndex = 0;
            }
        }

        protected void CargarDetalleLicenciaOperacional(int id)
        {
            ControlAlert();
            DataSet LicOpe = new DataSet();
            LicOpe = CCHEN_FichaMedica_Negocio.RegistroClinico.ObtenerDetalleLicenciaOperacional(id);

            div_detalle_licenciaoperacional.Visible = true;
            div_nueva_licenciaoperacional.Visible = false;

            
            txt_fechaini_detalle.Text = LicOpe.Tables[0].Rows[0][4].ToString();
            txt_fechafin_detalle.Text = LicOpe.Tables[0].Rows[0][5].ToString();
            txt_apreciacion_detalle.Text = LicOpe.Tables[0].Rows[0][7].ToString();
            txt_dias_detalle.Text = LicOpe.Tables[0].Rows[0][8].ToString();
            CargarDdlEstadoLicenciaOperacional(DropDownList_estadolicencia_detalle, Convert.ToInt32(LicOpe.Tables[0].Rows[0][9].ToString()));
            lbl_detalle_licencia_operacional.Text = "Detalle Licencia Operacional : " + LicOpe.Tables[0].Rows[0][1].ToString();

            IList<CCHEN_FichaMedica_Negocio.Custom.DatosDetalleExamen> Lista = CCHEN_FichaMedica_Negocio.RegistroClinico.ObtenerDetalleExamen(id);

            if (Lista == null || Lista.Count == 0)
            {
                ControlAlert();
                div_alert_licenciaOperacional_vacio.Visible = true;
            }

            else
            {
                TableDetalleLicenciaOperacional = ToDataTable(Lista.ToList());
                gvDetalleLicenciaOperacional.DataSource = Lista.OrderBy(p => p.IDLicencia).ThenBy(p => p.IDExamen).ToList();
                gvDetalleLicenciaOperacional.DataBind();
            }

            if(Convert.ToInt32(LicOpe.Tables[0].Rows[0][9].ToString()) == 3)
            {
                txt_dias_detalle.Attributes["disabled"] = "disabled";
                DropDownList_estadolicencia_detalle.Attributes["disabled"] = "disabled";
                txt_apreciacion_detalle.Attributes["disabled"] = "disabled";
                btn_modificar_licenciaoperacional.Visible = false;
                btn_eliminar_licenciaoperacional.Visible = false;

                foreach (GridViewRow Row in gvDetalleLicenciaOperacional.Rows)
                {
                    var apto = Row.FindControl("rb_d_apto") as RadioButton;
                    var rest = Row.FindControl("rb_d_rest") as RadioButton;
                    var noapto = Row.FindControl("rb_d_noapto") as RadioButton;

                    apto.Enabled = false;
                    rest.Enabled = false;
                    noapto.Enabled = false;
                }
            }
            else
            {
                txt_dias_detalle.Attributes.Remove("disabled");
                DropDownList_estadolicencia_detalle.Attributes.Remove("disabled");
                txt_apreciacion_detalle.Attributes.Remove("disabled");
                btn_modificar_licenciaoperacional.Visible = true;
                btn_eliminar_licenciaoperacional.Visible = true;
            }
        }



        protected void gvRegistroHistorico_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                switch (e.CommandName)
                {
                    case "Seleccionar":
                        _ArchivoSeleccionado = Convert.ToInt32(e.CommandArgument);
                        if (_ArchivoSeleccionado == 0)
                        {
                            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "Mensaje", "alert('El Archivo que ha seleccionado, no contiene información.')", true);
                            break;
                        }
                        DescargarArchivo(_ArchivoSeleccionado);
                        break;
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "Mensaje", "alert('Ha ocurrido un error, favor contacte al administrador del sistema.')", true);
            }
        }

        protected void gvLicenciaOperacional_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                switch (e.CommandName)
                {
                    case "Seleccionar":
                        _LicenciaSeleccionada = Convert.ToInt32(e.CommandArgument);
                        if (_LicenciaSeleccionada == 0)
                        {
                            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "Mensaje", "alert('La Licencia Operacional que ha seleccionado, no contiene información.')", true);
                            break;
                        }
                        //variable para la persistencia
                        hidTAB.Value = "licencias_operacionales";
                        CargarDetalleLicenciaOperacional(_LicenciaSeleccionada);
                        break;
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "Mensaje", "alert('Ha ocurrido un error, favor contacte al administrador del sistema.')", true);
            }
        }

        protected void gvNuevaLicenciaOperacional_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                switch (e.CommandName)
                {

                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "Mensaje", "alert('Ha ocurrido un error, favor contacte al administrador del sistema.')", true);
            }
        }

        protected void gvDetalleLicenciaOperacional_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                switch (e.CommandName)
                {

                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "Mensaje", "alert('Ha ocurrido un error, favor contacte al administrador del sistema.')", true);
            }
        }

        protected void gvRegistroHistorico_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void gvLicenciaOperacional_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void gvDetalleLicenciaOperacional_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void gvNuevaLicenciaOperacional_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void gvDetalleLicenciaOperacional_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if(e.Row.RowType == DataControlRowType.DataRow)
            {
                int aptitud = (int)System.Web.UI.DataBinder.Eval(e.Row.DataItem, "IDAptitud");
                var apto = e.Row.FindControl("rb_d_apto") as RadioButton;
                var rest = e.Row.FindControl("rb_d_rest") as RadioButton;
                var noapto = e.Row.FindControl("rb_d_noapto") as RadioButton;
                if (aptitud == 1) apto.Checked = true;
                if (aptitud == 2) rest.Checked = true;
                if (aptitud == 3) noapto.Checked = true;
            }
        }

        protected void DropDownList_EstadoLicencia_SelectedIndexChanged(object sender, EventArgs e)
        {

        }






        //ERIC
        protected void btn_Ingresar_Click(object sender, EventArgs e)
        {
            int id = CCHEN_FichaMedica_Negocio.Paciente.ObtenerIdRegistroClinico(Int32.Parse(Session["RutPaciente"].ToString()));
            int analisis = Int32.Parse(ddl_AnalisisLab.SelectedValue);
            DateTime fechaAnalisis = DateTime.Parse(tb_fecha.Text);
            string resultado = tb_resultado.Text;
            string unidad = lbl_unidad_medida.Text;
            string lugar = tb_lugarRealizacion.Text;
            int estado = 1; // Iniciado
            string nombreArchivo = "";
            string extArchivo = "";
            byte[] archivo = null;
            string ruta = "";
            int tamano = 0;
            bool exito = false;

            try
            {
                if (fu_examen.HasFile)
                {
                    // Verificar que coincida con los formatos.
                    string ext = fu_examen.PostedFile.FileName;
                    ext = ext.Substring(ext.LastIndexOf(".") + 1).ToLower();
                    string[] formatos = new string[] { "jpg", "jpeg", "bmp", "png", "gif", "pdf", "doc", "docx" };
                    if (Array.IndexOf(formatos, ext) < 0)
                    {
                        // Mensaje de que el formato no es válido.
                    }
                    else
                    {
                        nombreArchivo = fu_examen.PostedFile.FileName.Substring(0, fu_examen.PostedFile.FileName.LastIndexOf("."));
                        extArchivo = ext;
                        archivo = new byte[fu_examen.PostedFile.InputStream.Length];
                        fu_examen.PostedFile.InputStream.Read(archivo, 0, archivo.Length);
                        ruta = Server.MapPath("Upload/Laboratorio/" + Session["RutPaciente"].ToString());
                        tamano = fu_examen.PostedFile.ContentLength;
                        exito = true;
                    }
                }
            }
            catch (Exception ex)
            {
                // Mensaje de que hubo un error al subir.
                return;
            }

            if (exito)
            {
                // Si no existe la ruta, la crea.
                if (!Directory.Exists(ruta))
                    Directory.CreateDirectory(ruta);

                string archivoServidor = String.Format("{0}\\{1}", ruta, fu_examen.PostedFile.FileName);
                // Verificar que el archivo no exista
                if (File.Exists(archivoServidor))
                {
                    // Mensaje de que el nombre de archivo ya existe.
                }
                else
                {
                    try
                    {
                        fu_examen.PostedFile.SaveAs(archivoServidor);
                        int insertar = CCHEN_FichaMedica_Negocio.RegistroClinico.insertar_analisisLab_archivo(id, analisis, fechaAnalisis, resultado, unidad, lugar, estado, nombreArchivo, extArchivo, null, ruta, tamano);
                        if (insertar == 0)
                        {
                            File.Delete(archivoServidor);
                        }
                        else
                        {
                            if (!Directory.Exists(ruta + "/" + insertar.ToString()))
                                Directory.CreateDirectory(ruta + "/" + insertar.ToString());

                            File.Move(archivoServidor, ruta + "/" + insertar.ToString() + "/" + fu_examen.PostedFile.FileName);

                            ControlAlert();
                            div_alert_analisis_clinicos_exito.Visible = true;
                            LimpiaNuevoanalisis();
                        }
                    }
                    catch (Exception ex)
                    {
                        // Mensaje que hubo un error al guardar.
                    }
                }
            }
            else
            {

            }


        }

        protected void hidTAB_ValueChanged(object sender, EventArgs e)
        {

        }

        protected void ddl_AnalisisLab_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddl = (DropDownList)sender;
            hidTAB.Value = "analisis_clinicos";

            if (ddl.SelectedValue != "-1")
            {
                lbl_unidad_medida.Text = CCHEN_FichaMedica_Negocio.RegistroClinico.UnidadMedidaDeLaboratorio(Int32.Parse(ddl.SelectedValue));
            }
            else
            {
                lbl_unidad_medida.Text = "";
            }

            //colapse_nuevo_analisis.Attributes.Remove("class");
            //colapse_nuevo_analisis.Attributes.Add("class", "panel-collapse collapse in");
        }

        protected void LimpiaNuevoanalisis()
        {
            ddl_AnalisisLab.SelectedValue = "-1";
            tb_fecha.Text = "";
            tb_resultado.Text = "";
            lbl_unidad_medida.Text = "";
            tb_lugarRealizacion.Text = "";
        }

        protected void Cargar_ConsultaAnalisis()
        {
            Llena_AnalisisLaboratorio(ddl_consulta_analisis);
            Llena_EstadoAnalisis(ddl_consulta_estado);
        }

        protected void Llena_EstadoAnalisis(DropDownList ddl)
        {
            ddl.DataSource = CCHEN_FichaMedica_Negocio.RegistroClinico.EstadodeAnalisisLaboratorio();
            ddl.DataValueField = "ID";
            ddl.DataTextField = "NOMBRE";
            ddl.DataBind();

            ddl.Items.Insert(0, new ListItem("-- Seleccione --", "-1"));
            ddl.SelectedIndex = 0;
        }

        protected void btn_consulta_buscar_Click(object sender, EventArgs e)
        {
            div_nuevo_analisis.Visible = false;
            div_resultado_analisis.Visible = false;
            btn_nuevo_analisis.Visible = true;

            hidTAB.Value = "analisis_clinicos";
            ControlAlert();
            CCHEN_FichaMedica_Negocio.Custom.DatosBuscadorAnalisisLab objeto = new CCHEN_FichaMedica_Negocio.Custom.DatosBuscadorAnalisisLab();
            objeto.Rut = Int32.Parse(Session["RutPaciente"].ToString());
            if (ddl_consulta_analisis.SelectedValue == "-1")
                objeto.AnaLisisLab = null;
            else
                objeto.AnaLisisLab = Int32.Parse(ddl_consulta_analisis.SelectedValue);

            if (ddl_consulta_estado.SelectedValue == "-1")
                objeto.Estado = null;
            else
                objeto.Estado = Int32.Parse(ddl_consulta_estado.SelectedValue);

            if (tb_consulta_desde.Text.Trim() == "")
                objeto.Desde = null;
            else
                objeto.Desde = DateTime.Parse(tb_consulta_desde.Text);

            if (tb_consulta_hasta.Text.Trim() == "")
                objeto.Hasta = null;
            else
                objeto.Hasta = DateTime.Parse(tb_consulta_hasta.Text);

            IList<CCHEN_FichaMedica_Negocio.Custom.ResultadoBuscadorAnalisisLab> Lista = CCHEN_FichaMedica_Negocio.RegistroClinico.ObtenerAnalisisClinico(objeto);

            if (Lista == null || Lista.Count == 0)
            {
                ControlAlert();
                div_alert_busqueda_analisislab_error.Visible = true;
                div_resultado_analisis.Visible = false;
            }
            else
            {
                ControlAlert();
                div_resultado_analisis.Visible = true;
                TableAnalisisLab = ToDataTable(Lista.ToList());
                gvAnalisisLab.DataSource = Lista.OrderBy(p => p.ID);
                gvAnalisisLab.DataBind();
                //colapse_consulta_analisis_clinico.Attributes.Remove("class");
                //colapse_consulta_analisis_clinico.Attributes.Add("class", "panel-collapse collapse in");
            }

        }

        protected void gvAnalisisLab_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                switch (e.CommandName)
                {
                    case "Descargar":
                        string[] separador = e.CommandArgument.ToString().Split(':');
                        int id_carpeta = Int32.Parse(separador[0].ToString());
                        string nombreArchivo = separador[1].ToString();
                        string filePath = Server.MapPath("Upload/Laboratorio/" + Session["RutPaciente"].ToString() + "/" + id_carpeta);
                        System.IO.FileInfo toDownload =
                                    new System.IO.FileInfo(filePath + "/" + nombreArchivo);

                        HttpContext.Current.Response.Clear();
                        HttpContext.Current.Response.AddHeader("Content-Disposition",
                                    "attachment; filename=" + nombreArchivo);
                        HttpContext.Current.Response.AddHeader("Content-Length",
                                    toDownload.Length.ToString());
                        HttpContext.Current.Response.ContentType = "application/octet-stream";
                        HttpContext.Current.Response.WriteFile("Upload/Laboratorio/" + Session["RutPaciente"].ToString() + "/" + id_carpeta + "/" + nombreArchivo);
                        HttpContext.Current.Response.End();
                        break;

                    case "Seleccionar":
                        int index = Int32.Parse(e.CommandArgument.ToString());
                        Cargar_EditarAnalisisCli(index);
                        break;
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "Mensaje", "alert('Ha ocurrido un error, favor contacte al administrador del sistema.')", true);
            }
        }

        protected void Cargar_EditarAnalisisCli(int index)
        {
            GridViewRow gvRow = gvAnalisisLab.Rows[index];
            ControlAlert();
            div_detalle_analisis.Visible = true;
            Llena_AnalisisLaboratorio(ddl_edit_analisisLab);
            Llena_EstadoAnalisis(ddl_edit_estado);
            ddl_edit_analisisLab.SelectedValue = gvAnalisisLab.DataKeys[index].Values["Id_AnalisisLab"].ToString();
            hdnFechaEdit.Value = DateTime.Parse(Server.HtmlDecode(gvRow.Cells[4].Text)).ToShortDateString();
            tb_edit_resultado.Text = gvAnalisisLab.DataKeys[index].Values["Resultado"].ToString(); ;
            lb_edit_resultado.Text = gvAnalisisLab.DataKeys[index].Values["Unidad"].ToString();
            tb_edit_lugar.Text = Server.HtmlDecode(gvRow.Cells[7].Text);
            ddl_edit_estado.SelectedValue = gvAnalisisLab.DataKeys[index].Values["idEstado"].ToString();
            Session["idAnacli"] = Int32.Parse(gvAnalisisLab.DataKeys[index].Values["ID"].ToString());
            Session["nombreArchivo"] = gvAnalisisLab.DataKeys[index].Values["NombreArchivo"].ToString();
            lb_edit_nombreArchivo.Text = Session["nombreArchivo"].ToString();
            Session["ruta"] = gvAnalisisLab.DataKeys[index].Values["Ruta"].ToString();
            Session["Tamano"] = Int32.Parse(gvAnalisisLab.DataKeys[index].Values["Tamano"].ToString());
            /* TRAER EL ARCHIVO CARGADO. POR AHORA NO SE PUEDE.*/

        }

        protected void btn_edit_editar_Click(object sender, EventArgs e)
        {
            int id = CCHEN_FichaMedica_Negocio.Paciente.ObtenerIdRegistroClinico(Int32.Parse(Session["RutPaciente"].ToString()));
            int analisis = Int32.Parse(ddl_edit_analisisLab.SelectedValue);
            DateTime fechaAnalisis = DateTime.Parse(tb_edit_fecha.Text);
            string resultado = tb_edit_resultado.Text;
            string unidad = lb_edit_resultado.Text;
            string lugar = tb_edit_lugar.Text;
            int estado = Int32.Parse(ddl_edit_estado.SelectedValue);
            string nombreArchivo = Session["NombreArchivo"].ToString();
            string[] archivoExt = nombreArchivo.Split('.');
            string extArchivo = archivoExt[archivoExt.Length - 1];
            byte[] archivo = null;
            string ruta = Session["ruta"].ToString();
            int tamano = (Int32)Session["Tamano"];
            bool exito = true;
            int id_anacli = (Int32)Session["idAnaCli"];

            try
            {
                CCHEN_FichaMedica_Negocio.RegistroClinico.actualizar_analisisLab_archivo(id, analisis, fechaAnalisis, resultado, unidad, lugar, estado, nombreArchivo, extArchivo, archivo, ruta, tamano, id_anacli);

            }
            catch (Exception ex)
            {
                // Mensaje que hubo un error al guardar.
            }
        }


        protected void btn_grabar_modificacion_paciente_clic(object sender, EventArgs e)
        {
            CCHEN_FichaMedica_Negocio.Custom.DatosNuevoPaciente objeto = new CCHEN_FichaMedica_Negocio.Custom.DatosNuevoPaciente();

            objeto.Profesion = lbl_profesion.Text.ToString();
            objeto.Ocupacion = lbl_ocupacion.Text.ToString();
            objeto.FonoContacto = lbl_fono_contacto.Text.ToString();
            objeto.FonoEmergencia = lbl_fono_emergencia.Text.ToString();
            objeto.ContactoEmergencia = lbl_contacto_emergencia.Text.ToString();
            objeto.Direccion = lbl_direccion.Text.ToString();
            objeto.NivelEducacional = Convert.ToInt32(DropDownList_niveleducacional_detalle.SelectedValue.ToString());
            objeto.Departamento = Convert.ToInt32(DropDownList_departamento_detalle.SelectedValue.ToString());
            objeto.EstadoCivil = Convert.ToInt32(DropDownList_estadocivil_detalle.SelectedValue.ToString());
            objeto.Prevision = Convert.ToInt32(DropDownList_prevision_detalle.SelectedValue.ToString());
            objeto.Sede = Convert.ToInt32(DropDownList_sede_detalle.SelectedValue.ToString());

            DataSet ModificarPaciente = new DataSet();
            ModificarPaciente = CCHEN_FichaMedica_Negocio.RegistroClinico.ModificarPaciente(objeto);
            Response.Redirect("Paciente.aspx?rut="+ Session["RutPaciente"].ToString());
        }

        protected void btn_nuevo_analisis_Click(object sender, EventArgs e)
        {
            hidTAB.Value = "analisis_clinicos";
            ControlAlert();
            div_detalle_analisis.Visible = false;
            div_nuevo_analisis.Visible = true;
            div_resultado_analisis.Visible = false;
            btn_nuevo_analisis.Visible = false;
        }

        protected void btn_edit_eliminar_Click(object sender, EventArgs e)
        {

        }
    }
}