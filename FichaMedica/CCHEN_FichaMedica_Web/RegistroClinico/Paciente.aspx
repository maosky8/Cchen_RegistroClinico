<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Paciente.aspx.cs" Inherits="CCHEN_FichaMedica_Web.RegistroClinico.Paciente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

<form id="Form1" class=form-horizontal runat="server">

<div id="divCarga">
    <asp:ScriptManager ID="ScriptManager1" EnableScriptGlobalization="true" EnableScriptLocalization="true" runat="server"></asp:ScriptManager>
    <asp:UpdateProgress ID="updProgress" DynamicLayout="true" runat="server" AssociatedUpdatePanelID="upNuevoPaciente">
        <ProgressTemplate>
            <div id="divUpdateProgress" runat="server" class="overlay">
                <center>
                    <img src="../images/loading.gif" alt="Cargando...." />
                </center>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
</div>
<asp:UpdatePanel ID="upNuevoPaciente" runat="server">
<ContentTemplate>


<script language="javascript" type="text/javascript">

    function openTabs(evt, Name) {

        var i, tabcontent, tablinks;

        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }

        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
        }

        document.getElementById(Name).style.display = "block";
        evt.currentTarget.className += " active";

    }



    $(document).ready(function () {
        var tabActivo;
        var tab = document.getElementById('<%= hidTAB.ClientID%>').value;
        //$('#myTabs a[href="' + tab + '"]').tab('show');
        if (tab != "") {
            openTabs(event, tab);
            tabActivo = document.getElementById('li_'+tab);
            tabActivo.className += " active";
        }

    });

</script>

    <script type="text/javascript" language="javascript">
           function GenerarControles(args) {
               var idBoton = args.id;
               var updatePanel = '<%= upNuevoPaciente.UniqueID %>';
               Sys.WebForms.PageRequestManager.getInstance()._updateControls(["t" + updatePanel], [], [idBoton], 90); //PostBack
           }
    </script>

<div class="panel panel-info" id="div_info_paciente" runat="server" visible="true">
    <div class="panel-heading"><h3 class="panel-title">Información del Paciente</h3></div>
    <div class="panel-body">
            
        <div id="div_form_nuevo" class="form-group" runat="server">
            
            <div class="col-sm-2"><label for="inputName" class="control-label" >RUT :</label></div>
            <div class="col-sm-4"><asp:TextBox id="lbl_rut" runat="server" class="form-control" style="border: 0px;background-color: #ffffff;" readonly=true></asp:TextBox></div>
            <div class="col-sm-2"><label for="inputName" class="control-label" >Nombre :</label></div>
            <div class="col-sm-4"><asp:TextBox id="lbl_nombre" runat="server" class="form-control" style="border: 0px;background-color: #ffffff;" readonly=true></asp:TextBox></div>            
            <div class="col-sm-2"><label for="inputName" class="control-label" >Fecha Nacimiento :</label></div>
            <div class="col-sm-4"><asp:TextBox id="lbl_fecha_nacimiento" runat="server" class="form-control"  style="border: 0px;background-color: #ffffff;" readonly=true></asp:TextBox></div>            
            <div class="col-sm-2"><label for="inputName" class="control-label" >Sexo :</label></div>
            <div class="col-sm-4"><asp:TextBox id="lbl_sexo" runat="server" class="form-control"  style="border: 0px;background-color: #ffffff;" readonly=true></asp:TextBox></div>
            <div class="col-sm-2"><label for="inputName" class="control-label" >Profesión :</label></div>
            <div class="col-sm-4"><asp:TextBox id="lbl_profesion" runat="server" class="form-control"  style="border: 0px;background-color: #ffffff;" readonly=true></asp:TextBox></div>
            <div class="col-sm-2"><label for="inputName" class="control-label" >Nivel Educacional :</label></div>
            <div class="col-sm-4"><asp:TextBox id="lbl_nivel_educacional" runat="server" class="form-control"  style="border: 0px;background-color: #ffffff;" readonly=true></asp:TextBox></div>
            <div class="col-sm-2"><label for="inputName" class="control-label" >Ocupación :</label></div>
            <div class="col-sm-4"><asp:TextBox id="lbl_ocupacion" runat="server" class="form-control"  style="border: 0px;background-color: #ffffff;" readonly=true></asp:TextBox></div>
            <div class="col-sm-2"><label for="inputName" class="control-label" >Departamento :</label></div>
            <div class="col-sm-4"><asp:TextBox id="lbl_departamento" runat="server" class="form-control"  style="border: 0px;background-color: #ffffff;" readonly=true></asp:TextBox></div>
            <div class="col-sm-2"><label for="inputName" class="control-label" >Dirección :</label></div>
            <div class="col-sm-4"><asp:TextBox id="lbl_direccion" runat="server" class="form-control"  style="border: 0px;background-color: #ffffff;" readonly=true></asp:TextBox></div>
            <div class="col-sm-2"><label for="inputName" class="control-label" >Estado Civil :</label></div>
            <div class="col-sm-4"><asp:TextBox id="lbl_estado_civil" runat="server" class="form-control"  style="border: 0px;background-color: #ffffff;" readonly=true></asp:TextBox></div>
            <div class="col-sm-2"><label for="inputName" class="control-label" >Sede :</label></div>
            <div class="col-sm-4"><asp:TextBox id="lbl_sede" runat="server" class="form-control"  style="border: 0px;background-color: #ffffff;" readonly=true></asp:TextBox></div>
            <div class="col-sm-2"><label for="inputName" class="control-label" >Previsión :</label></div>
            <div class="col-sm-4"><asp:TextBox id="lbl_prevision" runat="server" class="form-control"  style="border: 0px;background-color: #ffffff;" readonly=true></asp:TextBox></div>
            <div class="col-sm-2"><label for="inputName" class="control-label" >Fono Contacto :</label></div>
            <div class="col-sm-4"><asp:TextBox id="lbl_fono_contacto" runat="server" class="form-control"  style="border: 0px;background-color: #ffffff;" readonly=true></asp:TextBox></div>
            <div class="col-sm-2"><label for="inputName" class="control-label" >Fono Emergencia :</label></div>
            <div class="col-sm-4"><asp:TextBox id="lbl_fono_emergencia" runat="server" class="form-control"  style="border: 0px;background-color: #ffffff;" readonly=true></asp:TextBox></div>
            <div class="col-sm-2"><label for="inputName" class="control-label" >Contacto Emergencia :</label></div>
            <div class="col-sm-4"><asp:TextBox id="lbl_contacto_emergencia" runat="server" class="form-control"  style="border: 0px;background-color: #ffffff;" readonly=true></asp:TextBox></div>
           
           
            <div class="col-sm-12">&nbsp;</div>
            <div class="col-sm-12">&nbsp;</div>  

            <div class="col-sm-12" align="center">
            <asp:Button ID="btn_modificar_paciente" class="btn btn-primary" runat="server" onclick="btn_modificar_clic" Text="Modificar Paciente" />&nbsp;
            <asp:Button ID="btn_volver" class="btn btn-primary" runat="server" formnovalidate  onclick="btn_volver_clic" Text="Volver" />                

            </div>
            
            </div>
            



            
    </div>
</div>


<div class="panel panel-info" id="div1" runat="server" visible="true">
    <div class="panel-heading"><h3 class="panel-title">Detalle del Paciente</h3></div>
    <div class="panel-body">

<ul class="nav nav-tabs nav-justified" id="myTabs">
  <li id="li_historial_atenciones"><a href="historial_atenciones" data-toggle="tab" class="tablinks" onclick="openTabs(event, 'historial_atenciones')">Historial de Atenciones</a></li>
  <li id="li_licencias_operacionales"><a href="licencias_operacionales" data-toggle="tab" class="tablinks" onclick="openTabs(event, 'licencias_operacionales')">Licencias Operacionales</a></li>
  <li id="li_analisis_clinicos"><a href="analisis_clinicos" data-toggle="tab" class="tablinks" onclick="openTabs(event, 'analisis_clinicos')">Análisis Clínicos</a></li>
  <li id="li_registros_historicos"><a href="registros_historicos" data-toggle="tab" class="tablinks" onclick="openTabs(event, 'registros_historicos')">Registros Históricos</a></li>
</ul>

<div id="historial_atenciones" class="tabcontent"  >
    <div class="alert alert-warning alert-dismissable" id="div_alert_historial_atenciones_error" runat="server" visible="false">
            <strong>¡Lástima!</strong> Tu Rol no tiene acceso a esta información. </div>
    <div class="panel-body" id="div_historial_atenciones" runat="server">
        
        
  <div class="panel-group" id="accordion">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">Fichas de Atención</a>
        </h4>
      </div>
      <div id="collapse1" class="panel-collapse collapse"><%--in--%>
        <div class="panel-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit,
        sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">Antecedentes</a>
        </h4>
      </div>
      <div id="collapse2" class="panel-collapse collapse">
        <div class="panel-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit,
        sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">Alergias</a>
        </h4>
      </div>
      <div id="collapse3" class="panel-collapse collapse">
        <div class="panel-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit,
        sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</div>
      </div>
    </div>
  </div>

        </div>
</div>

<div id="licencias_operacionales" class="tabcontent" <%--style="display:none"--%>  >
    <div class="alert alert-warning alert-dismissable" id="div_alert_licencias_operacionales_error" runat="server" visible="false">
            <strong>¡Lástima!</strong> Tu Rol no tiene acceso a esta información. </div>

    <div class="panel-body" id="div_licencias_operacionales" runat="server">
        
    <div class="alert alert-warning alert-dismissable" id="div_alert_licenciaOperacional_vacio" runat="server" visible="false">
            <strong>¡Lástima!</strong> El paciente no tiene licencias que mostrar. </div>

    <div class="panel-body" id="div5" runat="server">
        
                <div id="div_resultado_licenciaoperacional" runat="server" visible="false">
            <asp:GridView   CssClass="table table-striped" 
                    ID="gvLicenciaOperacional" 
                    runat="server"
                    AutoGenerateColumns="False" 
                    OnRowCommand="gvLicenciaOperacional_RowCommand" 
                    DataKeyNames="IdLicenciaOperacional" 
                    Width="100%" onselectedindexchanged="gvLicenciaOperacional_SelectedIndexChanged">
                            <Columns>
                                <asp:BoundField DataField="IdLicenciaOperacional" HeaderText="ID LO" Visible="false" ItemStyle-Width="10%"></asp:BoundField>
                                <asp:TemplateField HeaderText="Licencia Operacional" ItemStyle-Width="20%" HeaderStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnk_LicenciaOperacional" runat="server" Text='<%#Eval("IDNombreLicenciaOperacional")%>' OnClientClick="GenerarControles(this);"
                                            CommandName="Seleccionar" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"IDLicenciaOperacional") %>'></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="NOMBREMEDICO" HeaderText="Nombre Médico" ItemStyle-Width="25%"></asp:BoundField>
                                <asp:BoundField DataField="FECHAREGISTRO" HeaderText="Fecha de Registro" ItemStyle-Width="15%"></asp:BoundField>
                                <asp:BoundField DataField="FECHAINICIO" HeaderText="Fecha de Inicio" ItemStyle-Width="15%"></asp:BoundField>
                                <asp:BoundField DataField="FECHAFIN" HeaderText="Fecha de Fin" ItemStyle-Width="15%"></asp:BoundField>
                                <asp:BoundField DataField="ESTADOLICENCIAOPERACIONAL" HeaderText="Estado" ItemStyle-Width="10%"></asp:BoundField>

                            </Columns>
                        </asp:GridView>
            </div>
            <div class="col-sm-12" align="center">
            <asp:Button ID="btn_nueva_licenciaoperacional" class="btn btn-primary" runat="server" onclick="btn_nueva_licenciaoperacional_clic" Text="Nueva Licencia Operacional"  />
            </div>
        <div>&nbsp;</div>
        <div id="div_nueva_licenciaoperacional" runat="server" visible="false">
            <asp:GridView   CssClass="table table-striped" 
                    ID="gvNuevaLicenciaOperacional" 
                    runat="server"
                    AutoGenerateColumns="False" 
                    OnRowCommand="gvNuevaLicenciaOperacional_RowCommand" 
                    DataKeyNames="AptitudExamen" 
                    Width="100%" onselectedindexchanged="gvNuevaLicenciaOperacional_SelectedIndexChanged">
                            <Columns>
                                <asp:BoundField DataField="ID_ExamenFisico" HeaderText="ID EF" Visible="false" ItemStyle-Width="10%"></asp:BoundField>
                                <asp:BoundField DataField="AptitudExamen" HeaderText="Condición" ItemStyle-Width="40%"></asp:BoundField>
                                <asp:TemplateField HeaderText="Apto" ItemStyle-Width="20%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:RadioButton ID="rb_apto" runat="server" GroupName="aptitud" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Con Restricciones" ItemStyle-Width="20%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:RadioButton ID="rb_rest" runat="server" GroupName="aptitud" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="No Apto" ItemStyle-Width="20%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:RadioButton ID="rb_noapto" runat="server" GroupName="aptitud" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
            </div>
        <div>&nbsp;</div>
           <div id="div_detalle_licenciaoperacional" runat="server" visible="false">
           <div class="panel-heading"><h3 class="panel-title"><asp:Label ID="lbl_detalle_licencia_operacional" runat="server" Text=""></asp:Label></h3></div>
            <asp:GridView   CssClass="table table-striped" 
                    ID="gvDetalleLicenciaOperacional" 
                    runat="server"
                    AutoGenerateColumns="False" 
                    OnRowCommand="gvDetalleLicenciaOperacional_RowCommand" 
                    OnRowDataBound ="gvDetalleLicenciaOperacional_RowDataBound" 
                    DataKeyNames="NombreExamen" 
                    Width="100%" onselectedindexchanged="gvDetalleLicenciaOperacional_SelectedIndexChanged">
                            <Columns>
                                <asp:BoundField DataField="ID_LicenciaOperacional_ExamenFisico" HeaderText="ID LOEF" Visible="false" ItemStyle-Width="10%"></asp:BoundField>
                                <asp:BoundField DataField="ID_ExamenFisico" HeaderText="ID EF" Visible="false" ItemStyle-Width="10%"></asp:BoundField>
                                <asp:BoundField DataField="ID_Aptitud" HeaderText="ID AP" Visible="false" ItemStyle-Width="10%"></asp:BoundField>
                                <asp:BoundField DataField="NombreExamen" HeaderText="Condición" ItemStyle-Width="40%"></asp:BoundField>
                                <asp:TemplateField HeaderText="Apto" ItemStyle-Width="20%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:RadioButton ID="rb_d_apto" runat="server" GroupName="aptitud" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Con Restricciones" ItemStyle-Width="20%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:RadioButton ID="rb_d_rest" runat="server" GroupName="aptitud" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="No Apto" ItemStyle-Width="20%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:RadioButton ID="rb_d_noapto" runat="server" GroupName="aptitud" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
            <div class="col-sm-3"><label for="inputName" class="control-label">Apreciación del Médico Autorizado :</label></div>
            <div class="col-sm-3"><asp:TextBox id="txt_apreciacion_detalle" style="Z-INDEX: 501; OVERFLOW: hidden;  " runat="server" TextMode="MultiLine" class="form-control"></asp:TextBox></div>
             
            <div class="col-sm-3"><label for="inputName" class="control-label">Dias de Licencia :</label></div>
            <div class="col-sm-3"><asp:TextBox id="txt_dias_detalle" runat="server" class="form-control"></asp:TextBox></div>
               <div>&nbsp;</div><div>&nbsp;</div>
            <div class="col-sm-12" align="center">
            <asp:Button ID="btn_modificar_licenciaoperacional" class="btn btn-primary" runat="server" onclick="btn_modificar_licenciaoperacional_clic" Text="Modificar Licencia Operacional"  />
            </div>
            </div>
        

        </div>
</div>
    </div>

<div id="analisis_clinicos" class="tabcontent" style="display:none"  >
    <div class="alert alert-warning alert-dismissable" id="div_alert_analisis_clinicos_error" runat="server" visible="false">
            <strong>¡Lástima!</strong> Tu Rol no tiene acceso a esta información. </div>
    <div class="panel-body" id="div_analisis_clinicos" runat="server">
        asdasdasda
        </div>
</div>

<div id="registros_historicos" class="tabcontent" style="display:none"  >
    <div class="alert alert-warning alert-dismissable" id="div_alert_registros_historicos_error" runat="server" visible="false">
            <strong>¡Lástima!</strong> Tu Rol no tiene acceso a esta información. </div>
    <div class="panel-body" id="div_registros_historicos" runat="server">
        
            <div class="alert alert-warning alert-dismissable" id="div_alert_registros_historicos_vacio" runat="server" visible="false">
            <strong>¡Lástima!</strong> El paciente no tiene archivos que mostrar. </div>
    <div class="panel-body" id="div3" runat="server">

        <div class="alert alert-danger alert-dismissable" id="div_alert_subir_archivo_error" runat="server" visible="false">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <strong>¡Error!</strong> No se ha podido subir el archivo, si ésto persiste, contacta al Administrador del Sistema. </div>

    <div class="alert alert-success" id="div_alert_subir_archivo_ok" runat="server" visible="false">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <strong>¡Bien hecho!</strong> El archivo se ha cargado correctamente. </div>

        <div class="alert alert-danger alert-dismissable" id="div_alert_subir_archivo_extension" runat="server" visible="false">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <strong>¡Error!</strong> El archivo que intentas subir no corresponde a una extensión permitida. </div>

                <div class="alert alert-danger alert-dismissable" id="div_alert_subir_archivo_tamano" runat="server" visible="false">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <strong>¡Error!</strong> El archivo que intentas subir es demasiado pesado. </div>

                        <div class="alert alert-danger alert-dismissable" id="div_alert_subir_archivo_vacio" runat="server" visible="false">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <strong>¡Error!</strong> No has seleccionado un archivo para guardar. </div>



        <div id="div_resultado_registrohistorico" runat="server" visible="false">
            <asp:GridView   CssClass="table table-striped" 
                    ID="gvRegistroHistorico" 
                    runat="server"
                    AutoGenerateColumns="False" 
                    OnRowCommand="gvRegistroHistorico_RowCommand" 
                    DataKeyNames="NombreArchivo" 
                    Width="100%" onselectedindexchanged="gvRegistroHistorico_SelectedIndexChanged">
                            <Columns>
                                <asp:BoundField DataField="IdRegistroHistorico" HeaderText="ID RH" Visible="false" ItemStyle-Width="10%"></asp:BoundField>
                                <asp:TemplateField HeaderText="Nombre Archivo" ItemStyle-Width="30%" HeaderStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnk_NombreArchivo" runat="server" Text='<%#Eval("NombreArchivo")%>' OnClientClick="GenerarControles(this);"
                                            CommandName="Seleccionar" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"IdRegistroHistorico") %>'></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="EXTENSION" HeaderText="Extensión" ItemStyle-Width="10%"></asp:BoundField>
                                <asp:BoundField DataField="TAMANO" HeaderText="Tamaño" ItemStyle-Width="10%"></asp:BoundField>
                                <asp:BoundField DataField="RUTA" HeaderText="Ruta" ItemStyle-Width="40%"></asp:BoundField>

                            </Columns>
                        </asp:GridView>
            </div>
                    <div class="col-sm-12" align="center">
                        <asp:FileUpload runat="server" ID="SubirArchivos" AllowMultiple="false" class="btn btn-info" />
                        
            <asp:Button ID="btn_subir_registrohistorico" class="btn btn-primary" runat="server" onclick="btn_subir_registrohistorico_clic" Text="Subir Archivo"  />
            </div>

        </div>
</div>

    </div>
    
    
    </div></div>
    
    

<div style="display: none">  
<asp:HiddenField ID="hdnIdCita" runat="server" /> 
<asp:HiddenField ID="hdnRutCita" runat="server" /> 
<asp:HiddenField ID="hidTAB" runat="server" Value="historial_atenciones" />
</div>
                      
</ContentTemplate>
    <Triggers>
        <asp:PostBackTrigger ControlID="btn_subir_registrohistorico" />
        <asp:AsyncPostBackTrigger ControlID="gvRegistroHistorico" EventName="RowCommand" />
        <asp:AsyncPostBackTrigger ControlID="gvDetalleLicenciaOperacional" EventName="RowCommand" />
    </Triggers>
</asp:UpdatePanel>
</form>  

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server"> </asp:Content>
