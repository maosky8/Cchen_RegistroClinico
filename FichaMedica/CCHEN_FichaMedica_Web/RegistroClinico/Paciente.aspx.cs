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
        //FileUpload SubirArchivos = new FileUpload();
        #endregion

        protected void Page_Load(object sender, EventArgs e)
            {
                if (!IsPostBack)
                {
                Session["RutPaciente"] = Convert.ToInt32(Request.QueryString["rut"].ToString());
                    LLena_Paciente(Convert.ToInt32(Session["RutPaciente"].ToString()));
                    ControlDisplayDiv();
                    Buscar_RegistroHistorico(Convert.ToInt32(Request.QueryString["rut"].ToString()));
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
            lbl_fono_emergencia.Text = Paciente.Tables[0].Rows[0][13].ToString();
            lbl_contacto_emergencia.Text = Paciente.Tables[0].Rows[0][14].ToString();


        }

        protected void btn_modificar_clic(object sender, EventArgs e)
        {

        }

        protected void btn_volver_clic(object sender, EventArgs e)
        {
            Response.Redirect("RegistroClinico.aspx");
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
                            objeto.Tamano =  tamañoArchivo.ToString() + " KB";
                            objeto.Ruta = "/Upload/"+ Session["RutPaciente"].ToString() + "/" + nombreArchivo.ToString();


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

        protected void gvRegistroHistorico_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DescargarArchivo(int ArchivoSeleccionado)
        {
            IList<CCHEN_FichaMedica_Negocio.Custom.ResultadoRegistroHistorico> Lista = CCHEN_FichaMedica_Negocio.RegistroClinico.ObtenerRegistroHistorico(Convert.ToInt32(Session["RutPaciente"].ToString()),ArchivoSeleccionado);
            string[] url = Server.MapPath(Lista[0].Ruta.ToString()).Split('/');
            string nombreArchivo = Session["RutPaciente"].ToString()+'_'+Lista[0].NombreArchivo.ToString();//url[url.Length - 1];
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
    }
}