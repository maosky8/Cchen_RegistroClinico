<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Paciente.aspx.cs" Inherits="CCHEN_FichaMedica_Web.RegistroClinico.Paciente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

<form id="Form1" class=form-horizontal runat="server">

<div id="divCarga">
    <asp:ScriptManager ID="ScriptManager1" EnableScriptGlobalization="true" EnableScriptLocalization="true" runat="server"></asp:ScriptManager>
    <asp:UpdateProgress ID="updProgress" DynamicLayout="true" runat="server" AssociatedUpdatePanelID="upNuevoPaciente">
        <ProgressTemplate>
            <div id="divUpdateProgress" runat="server" class="overlay">
                <center >
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

<script language="javascript" type="text/javascript">

        function EliminarLicenciaOperacional() {
            if (confirm("¿Está seguro que desea eliminar la Licencia Operacional?"))
                return true;
            else
                return false;
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
            <div class="col-sm-4"><asp:TextBox id="lbl_profesion" runat="server" class="form-control"  style="border: 0px;background-color: #ffffff;"></asp:TextBox></div>
            <div class="col-sm-2"><label for="inputName" class="control-label" >Nivel Educacional :</label></div>
            <div class="col-sm-4"><asp:DropDownList ID="DropDownList_niveleducacional_detalle" runat="server" class="form-control" ></asp:DropDownList></div>
            <%--<div class="col-sm-4"><asp:TextBox id="lbl_nivel_educacional" runat="server" class="form-control"  style="border: 0px;background-color: #ffffff;" readonly=true></asp:TextBox></div>--%>
            <div class="col-sm-2"><label for="inputName" class="control-label" >Ocupación :</label></div>
            <div class="col-sm-4"><asp:TextBox id="lbl_ocupacion" runat="server" class="form-control"  style="border: 0px;background-color: #ffffff;"></asp:TextBox></div>
            <div class="col-sm-2"><label for="inputName" class="control-label" >Departamento :</label></div>
            <div class="col-sm-4"><asp:DropDownList ID="DropDownList_departamento_detalle" runat="server" class="form-control"  ></asp:DropDownList></div>
            <%--<div class="col-sm-4"><asp:TextBox id="lbl_departamento" runat="server" class="form-control"  style="border: 0px;background-color: #ffffff;" readonly=true></asp:TextBox></div>--%>
            <div class="col-sm-2"><label for="inputName" class="control-label" >Dirección :</label></div>
            <div class="col-sm-4"><asp:TextBox id="lbl_direccion" runat="server" class="form-control"  style="border: 0px;background-color: #ffffff;" ></asp:TextBox></div>
            <div class="col-sm-2"><label for="inputName" class="control-label" >Estado Civil :</label></div>
            <div class="col-sm-4"><asp:DropDownList ID="DropDownList_estadocivil_detalle" runat="server" class="form-control" ></asp:DropDownList></div>
            <%--<div class="col-sm-4"><asp:TextBox id="lbl_estado_civil" runat="server" class="form-control"  style="border: 0px;background-color: #ffffff;" readonly=true></asp:TextBox></div>--%>
            <div class="col-sm-2"><label for="inputName" class="control-label" >Sede :</label></div>
            <div class="col-sm-4"><asp:DropDownList ID="DropDownList_sede_detalle" runat="server" class="form-control" ></asp:DropDownList></div>
            <%--<div class="col-sm-4"><asp:TextBox id="lbl_sede" runat="server" class="form-control"  style="border: 0px;background-color: #ffffff;" readonly=true></asp:TextBox></div>--%>
            <div class="col-sm-2"><label for="inputName" class="control-label" >Previsión :</label></div>
            <div class="col-sm-4"><asp:DropDownList ID="DropDownList_prevision_detalle" runat="server" class="form-control" ></asp:DropDownList></div>
            <%--<div class="col-sm-4"><asp:TextBox id="lbl_prevision" runat="server" class="form-control"  style="border: 0px;background-color: #ffffff;" readonly=true></asp:TextBox></div>--%>
            <div class="col-sm-2"><label for="inputName" class="control-label" >Fono Contacto :</label></div>
            <div class="col-sm-4"><asp:TextBox id="lbl_fono_contacto" runat="server" type="number" class="form-control"  style="border: 0px;background-color: #ffffff;" ></asp:TextBox></div>
            <div class="col-sm-2"><label for="inputName" class="control-label" >Fono Emergencia :</label></div>
            <div class="col-sm-4"><asp:TextBox id="lbl_fono_emergencia" runat="server"  type="number" class="form-control"  style="border: 0px;background-color: #ffffff;" ></asp:TextBox></div>
            <div class="col-sm-2"><label for="inputName" class="control-label" >Contacto Emergencia :</label></div>
            <div class="col-sm-4"><asp:TextBox id="lbl_contacto_emergencia" runat="server" class="form-control"  style="border: 0px;background-color: #ffffff;" ></asp:TextBox></div>
           
           
            <div class="col-sm-12">&nbsp;</div>
            <div class="col-sm-12">&nbsp;</div>  

            <div class="col-sm-12" align="center">
            <asp:Button ID="btn_modificar_paciente" class="btn btn-primary" runat="server" onclick="btn_modificar_clic" Text="Modificar Paciente" />&nbsp;
            <asp:Button ID="btn_grabar_modificacion_paciente" class="btn btn-primary" runat="server" onclick="btn_grabar_modificacion_paciente_clic" Text="Grabar Paciente" Visible ="false" />&nbsp;
            <asp:Button ID="btn_volver" class="btn btn-primary" runat="server" formnovalidate  onclick="btn_volver_clic" Text="Volver" />                

            </div>
            
            </div>          
          
    </div>
</div>


<div class="panel panel-info" id="div_detalle_paciente" runat="server" visible="true">
    <div class="panel-heading"><h3 class="panel-title">Detalle del Paciente</h3></div>
    <div class="panel-body">

<ul class="nav nav-tabs nav-justified" id="myTabs">
  <li id="li_historial_atenciones"><a href="historial_atenciones" data-toggle="tab" class="tablinks" onclick="openTabs(event, 'historial_atenciones')">Historial de Atenciones</a></li>
  <li id="li_licencias_operacionales"><a href="licencias_operacionales" data-toggle="tab" class="tablinks" onclick="openTabs(event, 'licencias_operacionales')">Licencias Operacionales</a></li>
  <li id="li_analisis_clinicos"><a href="analisis_clinicos" data-toggle="tab" class="tablinks" onclick="openTabs(event, 'analisis_clinicos')">Análisis Clínicos</a></li>
  <li id="li_registros_historicos"><a href="registros_historicos" data-toggle="tab" class="tablinks" onclick="openTabs(event, 'registros_historicos')">Registros Históricos</a></li>
</ul>

<div id="historial_atenciones" class="tabcontent"  style="display:none" >
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

<div id="licencias_operacionales" class="tabcontent" style="display:none" >

    <div class="alert alert-warning alert-dismissable" id="div_alert_licencias_operacionales_error" runat="server" visible="false">
            <strong>¡Lástima!</strong> Tu Rol no tiene acceso a esta información. </div>

    <div class="panel-body" id="div_licencias_operacionales" runat="server">
        
    <div class="alert alert-warning alert-dismissable" id="div_alert_licenciaOperacional_vacio" runat="server" visible="false">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
            <strong>¡Lástima!</strong> El paciente no tiene licencias que mostrar. </div>

    <div class="alert alert-success" id="div_alert_nuevalicope_ok" runat="server" visible="false">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <strong>¡Bien hecho!</strong> La Licencia Operacional se ha creado correctamente. </div>

        <div class="alert alert-success" id="div_alert_eliminarlicope_ok" runat="server" visible="false">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <strong>¡Bien hecho!</strong> La Licencia Operacional se ha eliminado correctamente. </div>

                <div class="alert alert-success" id="div_alert_modificarlicope_ok" runat="server" visible="false">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <strong>¡Bien hecho!</strong> La Licencia Operacional se ha modificado correctamente. </div>

    <div class="alert alert-danger alert-dismissable" id="div_alert_nuevalicope_error" runat="server" visible="false">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <strong>¡Error!</strong> Ha ocurrido un inconveniente, si ésto persiste, contacta al Administrador del Sistema. </div>

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

        <div class="alert alert-warning alert-dismissable" id="div_alert_examen_vacio" runat="server" visible="false">
            <strong>¡Hey!</strong> Debes indicar la aptitud de al menos 1 exámen físico. </div>

    <asp:GridView   CssClass="table table-striped" 
            ID="gvNuevaLicenciaOperacional" 
            runat="server"
            AutoGenerateColumns="False" 
            OnRowCommand="gvNuevaLicenciaOperacional_RowCommand" 
            DataKeyNames="IDExamen" 
            Width="100%" onselectedindexchanged="gvNuevaLicenciaOperacional_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="IDExamen" HeaderText="ID EF" Visible="false" ItemStyle-Width="10%"></asp:BoundField>
                        <asp:BoundField DataField="NombreExamen" HeaderText="Condición" ItemStyle-Width="40%"></asp:BoundField>
                        <asp:TemplateField HeaderText="Apto" ItemStyle-Width="20%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" >
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
            <div class="col-sm-3"><label for="inputName" class="control-label">Fecha Inicio Licencia :</label></div>
            <div class="col-sm-3"><asp:TextBox id="txt_fechainicio_nueva_lo" runat="server" class="form-control" type="date" name="fechainicio" step="1" min="2016-01-01" required></asp:TextBox></div>

            <div class="col-sm-3"><label for="inputName" class="control-label">Fecha Término Licencia :</label></div>
            <div class="col-sm-3"><asp:TextBox id="txt_fechatermino_nueva_lo" runat="server" class="form-control" type="date" name="fechatermino" step="1" min="2016-01-01" required></asp:TextBox></div>

            <div class="col-sm-3"><label for="inputName" class="control-label" >Dias de Licencia :</label></div>
            <div class="col-sm-3"><asp:TextBox id="txt_dias_nueva_lo" type="number" runat="server" MaxLength="11" class="form-control" required></asp:TextBox></div>

            <div class="col-sm-3"><label for="inputName" class="control-label">Estado Licencia:</label></div>
            <div class="col-sm-3"><asp:DropDownList ID="DropDownList_EstadoLicencia" runat="server" class="form-control"
                    onselectedindexchanged="DropDownList_EstadoLicencia_SelectedIndexChanged"></asp:DropDownList></div>

            <div class="col-sm-3"><label for="inputName" class="control-label">Apreciación del Médico :</label></div>
            <div class="col-sm-3"><asp:TextBox id="txt_apreciacion_nueva_lo" style="Z-INDEX: 501; OVERFLOW: hidden;  " runat="server" TextMode="MultiLine" class="form-control" required></asp:TextBox></div>  

            
    <div>&nbsp;</div><div>&nbsp;</div>
    <div class="col-sm-12" align="center">
    <asp:Button ID="btn_grabarnueva_licenciaoperacional" class="btn btn-primary" runat="server" onclick="btn_grabarnueva_licenciaoperacional_clic" Text="Grabar Nueva Licencia Operacional"  />&nbsp;
    <asp:Button ID="btn_volvernueva_licenciaoperacional" class="btn btn-primary" runat="server" onclick="btn_volvernueva_licenciaoperacional_clic" formnovalidate Text="Volver"  />
    </div>
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
           

            <div class="col-sm-3"><label for="inputName" class="control-label">Fecha Inicio Licencia :</label></div>
            <div class="col-sm-3"><asp:TextBox id="txt_fechaini_detalle" runat="server" class="form-control"  disabled></asp:TextBox></div>

            <div class="col-sm-3"><label for="inputName" class="control-label">Fecha Término Licencia :</label></div>
            <div class="col-sm-3"><asp:TextBox id="txt_fechafin_detalle" runat="server" class="form-control"  disabled></asp:TextBox></div>

            <div class="col-sm-3"><label for="inputName" class="control-label" >Dias de Licencia :</label></div>
            <div class="col-sm-3"><asp:TextBox id="txt_dias_detalle" type="number" runat="server" MaxLength="11" class="form-control" required></asp:TextBox></div>

            <div class="col-sm-3"><label for="inputName" class="control-label">Estado Licencia:</label></div>
            <div class="col-sm-3"><asp:DropDownList ID="DropDownList_estadolicencia_detalle" runat="server" class="form-control"
                    ></asp:DropDownList></div>

            <div class="col-sm-3"><label for="inputName" class="control-label">Apreciación del Médico :</label></div>
            <div class="col-sm-3"><asp:TextBox id="txt_apreciacion_detalle" style="Z-INDEX: 501; OVERFLOW: hidden;  " runat="server" TextMode="MultiLine" class="form-control" required></asp:TextBox></div>  


    <div>&nbsp;</div><div>&nbsp;</div>
    <div class="col-sm-12" align="center">
    <asp:Button ID="btn_modificar_licenciaoperacional" class="btn btn-primary" runat="server" onclick="btn_modificar_licenciaoperacional_clic" Text="Modificar Licencia Operacional"  />&nbsp;&nbsp;
    <asp:Button ID="btn_eliminar_licenciaoperacional" class="btn btn-primary" runat="server" onclick="btn_eliminar_licenciaoperacional_clic" Text="Eliminar Licencia Operacional" OnClientClick="return EliminarLicenciaOperacional();"  />
    </div>
    </div>
        

    </div>
    </div>
    </div>

<div id="analisis_clinicos" class="tabcontent" style="display:block"  >
        <div class="alert alert-warning alert-dismissable" id="div_alert_analisis_clinicos_error" runat="server" visible="false">
                <strong>¡Lástima!</strong> Tu Rol no tiene acceso a esta información. 
        </div>

    <div class="panel-body" id="div_analisis_clinicos" runat="server">

        <div class="alert alert-success" id="div_alert_analisis_clinicos_exito" runat="server" visible="false">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <strong>¡Bien hecho!</strong> El Análisis Clínico ha sido ingresado correctamente. 
        </div>

        <div class="panel panel-info" id="div_filtros_analisis" runat="server" visible="true">
            
            <div class="panel-heading"><h3 class="panel-title">Filtros de búsqueda</h3></div>
            <div class="panel-body">
    <div class="col-sm-3"><label for="inputName" class="control-label">Análisis :</label></div>
    <div class="col-sm-3"><asp:DropDownList ID="ddl_consulta_analisis" runat="server" CssClass="form-control"></asp:DropDownList></div>
    <div class="col-sm-3"><label for="inputName" class="control-label">Estado :</label></div>
    <div class="col-sm-3"><asp:DropDownList ID="ddl_consulta_estado" runat="server" CssClass="form-control"></asp:DropDownList></div>

    <div class="col-sm-3"><label for="inputName" class="control-label">Desde :</label></div>
    <div class="col-sm-3"><asp:TextBox id="tb_consulta_desde" runat="server" class="form-control" type="date" step="1" min="2016-01-01"></asp:TextBox></div>
    <div class="col-sm-3"><label for="inputName" class="control-label">Hasta :</label></div>
    <div class="col-sm-3"><asp:TextBox id="tb_consulta_hasta" runat="server" class="form-control" type="date" step="1" min="2016-01-01"></asp:TextBox></div>
    <div>&nbsp;</div><div>&nbsp;</div>
    <div class="col-sm-12" align="center">
    <asp:Button ID="btn_consulta_buscar" runat="server" Text="Buscar Análisis Clínicos" class="btn btn-primary" OnClick="btn_consulta_buscar_Click" formnovalidate/>&nbsp;
    <asp:Button ID="btn_nuevo_analisis" runat="server" Text="Nuevo Análisis Clínico" class="btn btn-primary" OnClick="btn_nuevo_analisis_Click" formnovalidate/>
    </div></div>
            </div>

    <div class="alert alert-warning alert-dismissable" id="div_alert_busqueda_analisislab_error" runat="server" visible="false">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
            <strong>¡Lástima!</strong> La búsqueda realizada no arrojó resultados. </div>


        <div class="panel panel-info" id="div_resultado_analisis" runat="server" visible="false">
            <div class="panel-heading"><h3 class="panel-title">Resultado de la búsqueda</h3></div>
                     <div class="panel-body">  
                <asp:GridView ID="gvAnalisisLab" CssClass="table table-striped" 
                    AutoGenerateColumns="False" 
                    Width="100%" DataKeyNames="ID, Id_AnalisisLab, Resultado, Unidad, idEstado, NombreArchivo, Ruta, Tamano, Lugar"
                    runat="server" OnRowCommand="gvAnalisisLab_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" Visible="false" ItemStyle-Width="0%"></asp:BoundField>
                        <asp:BoundField DataField="Id_AnalisisLab" HeaderText="id_lab" Visible="false"></asp:BoundField>
                        <asp:TemplateField HeaderText="Identificador" ItemStyle-Width="15%" HeaderStyle-HorizontalAlign="Left">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnk_AnalisisClinico" runat="server" Text='<%#Eval("IDnombreAnalisisClinico")%>' OnClientClick="GenerarControles(this);"
                                        CommandName="Seleccionar" CommandArgument='<%# DataBinder.Eval(Container,"RowIndex") %>'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        <asp:BoundField DataField="AnalisisLab" HeaderText="Análisis de Lab." Visible="true" ItemStyle-Width="15%"></asp:BoundField>
                        <asp:BoundField DataField="Fecha" HeaderText="Fecha" Visible="true" ItemStyle-Width="15%"></asp:BoundField>
                        <asp:BoundField DataField="Resultado" HeaderText="ResultadoOculto" Visible="false"></asp:BoundField>
                        <asp:BoundField DataField="Unidad" HeaderText="Unidad" Visible="false"></asp:BoundField>
                        <asp:TemplateField HeaderText="Resultado" ItemStyle-Width="15%" HeaderStyle-HorizontalAlign="Left">
                            <ItemTemplate>
                                <asp:Label ID="lbl_grid_resultado" runat="server" Text='<%# Eval("Resultado") + " " + Eval("Unidad") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Lugar" HeaderText="Lugar" Visible="true" ItemStyle-Width="15%"></asp:BoundField>
                        <asp:BoundField DataField="Estado" HeaderText="Estado" Visible="true" ItemStyle-Width="15%"></asp:BoundField>
                        <asp:BoundField DataField="idEstado" HeaderText="idEstado" Visible="false" />
                        <asp:TemplateField HeaderText="Archivo" ItemStyle-Width="10%" HeaderStyle-HorizontalAlign="Left">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnk_grid_descarga" runat="server" Text="Descargar" CommandName="Descargar"
                                    CommandArgument='<%# Eval("ID") + ":" + Eval("NombreArchivo") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--<asp:TemplateField HeaderText="Editar " ItemStyle-Width="15%" HeaderStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnk_Editar" runat="server" Text='<%#Eval("Editar")%>'
                                CommandName="Seleccionar" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'></asp:LinkButton>
                        </ItemTemplate>
                        </asp:TemplateField>--%>
                        
                        <asp:BoundField DataField="NombreArchivo" Visible="false" HeaderText="NombreArchivo"/>
                        <asp:BoundField DataField="Ruta" HeaderText="Ruta" Visible="false" />
                        <asp:BoundField DataField="Tamano" HeaderText="Tamaño" Visible="false" />
                    </Columns>
                </asp:GridView>
                          </div>
        </div>


        <div class="panel panel-info" id="div_nuevo_analisis" runat="server" visible="false">
            <div class="panel-heading"><h3 class="panel-title">Ingresar Nuevo Análisis de Laboratorio</h3></div>
             <div class="panel-body">  
        <div class="col-sm-3"><label for="inputName" class="control-label">Análisis de Laboratorio:</label></div>
        <div class="col-sm-3"><asp:DropDownList ID="ddl_AnalisisLab" runat="server" class="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddl_AnalisisLab_SelectedIndexChanged"></asp:DropDownList></div>
        <div class="col-sm-3"><label for="inputName" class="control-label">Fecha :</label></div>
        <div class="col-sm-3"><asp:TextBox id="tb_fecha" runat="server" class="form-control" type="date" step="1" min="2016-01-01" required></asp:TextBox></div>

        <div class="col-sm-3"><label for="inputName" class="control-label">Resultado :</label></div>
        <div class="col-sm-3"><asp:TextBox id="tb_resultado" runat="server" class="form-control" required></asp:TextBox></div>
        <div class="col-sm-6"><asp:Label id="lbl_unidad_medida" runat="server" class="form-control" BorderStyle="None"></asp:Label></div>

        <div class="col-sm-3"><label for="inputName" class="control-label">Lugar de Realización :</label></div>
        <div class="col-sm-3"><asp:TextBox id="tb_lugarRealizacion" runat="server" class="form-control" required></asp:TextBox></div>
        <div class="col-sm-6">
            <asp:FileUpload runat="server" ID="fu_examen" AllowMultiple="false" class="btn btn-info" required />
        </div>
<div>&nbsp;</div><div>&nbsp;</div>
        <div class="col-sm-12" align="center"><asp:Button ID="btn_Ingresar" runat="server" Text="Grabar Nuevo Análisis de Laboratorio" class="btn btn-primary" OnClick="btn_Ingresar_Click"/></div>
</div></div>

         
        <div class="panel panel-info" id="div_detalle_analisis" runat="server" visible="false">
                            <div class="panel-heading"><h3 class="panel-title">Detalle Análisis de Laboratorio</h3></div>
                            <div class="panel-body">
                                <div id="div_edit_form" class="form-group" runat="server">
                                    <div class="col-sm-3"><label for="inputName" class="control-label">Análisis de Laboratorio:</label></div>
                                    <div class="col-sm-3"><asp:DropDownList ID="ddl_edit_analisisLab" runat="server" class="form-control" AutoPostBack="True"></asp:DropDownList></div>

                                    <div class="col-sm-3"><label for="inputName" class="control-label">Fecha :</label></div>
                                    <div class="col-sm-3"><asp:TextBox id="tb_edit_fecha" runat="server" class="form-control" type="date" step="1" min="2016-01-01" required ></asp:TextBox></div>

                                    <div class="col-sm-3"><label for="inputName" class="control-label">Resultado :</label></div>
                                    <div class="col-sm-3"><asp:TextBox id="tb_edit_resultado" runat="server" class="form-control" required></asp:TextBox></div>

                                    <div class="col-sm-6"><asp:TextBox id="lb_edit_resultado" runat="server"  class="form-control" disabled ></asp:TextBox></div>

                                    <div class="col-sm-3"><label for="inputName" class="control-label">Lugar de Realización :</label></div>
                                    <div class="col-sm-3"><asp:TextBox id="tb_edit_lugar" runat="server" class="form-control" required></asp:TextBox></div>

                                    <div class="col-sm-3"><label for="inputName" class="control-label">Estado :</label></div>
                                    <div class="col-sm-3"><asp:DropDownList ID="ddl_edit_estado" runat="server" CssClass="form-control"></asp:DropDownList></div>

                                   <%-- <asp:Label ID="lb_mensaje_edit" ForeColor="Red" Text="ESCOJA UN NUEVO ARCHIVO PARA REEMPLAZAR EL ANTERIOR." runat="server"> </asp:Label>--%>

                                    <div class="col-sm-3"><label for="inputName" class="control-label">Archivo :</label></div>
                                    <div class="col-sm-3"><asp:TextBox ID="lb_edit_nombreArchivo" runat="server" CssClass="form-control" disabled> </asp:TextBox></div>
                                    <div class="col-sm-6">
                                        <asp:FileUpload runat="server" ID="fu_edit_examen" AllowMultiple="false" class="btn btn-info"  required />
                                    </div>
                                    <div>&nbsp;</div><div>&nbsp;</div>
                                    <div class="col-sm-12" align="center"><asp:Button ID="btn_edit_editar" runat="server" Text="Grabar Análisis Clínico" class="btn btn-primary" OnClick="btn_edit_editar_Click" />
                                        &nbsp;<asp:Button ID="btn_edit_eliminar" runat="server" Text="Eliminar Análisis Clínico" class="btn btn-primary" OnClick="btn_edit_eliminar_Click" formnovalidate />
                                    </div>
                                    <div class="alert alert-success" id="div_edit_exito" runat="server" visible="false">
                                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                                        <strong>¡Bien hecho!</strong> El archivo se ha cargado correctamente. 
                                    </div>
                                </div>
                            </div>
                        </div>

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
<asp:HiddenField ID="hdnFechaEdit" runat="server" />
</div>
                      
</ContentTemplate>
    <Triggers>
        <asp:PostBackTrigger ControlID="btn_subir_registrohistorico" />
        <asp:PostBackTrigger ControlID="btn_nueva_licenciaoperacional" />
        <asp:PostBackTrigger ControlID="btn_grabarnueva_licenciaoperacional" />
        <asp:PostBackTrigger ControlID="btn_volvernueva_licenciaoperacional" />
        <asp:PostBackTrigger ControlID="btn_eliminar_licenciaoperacional" />
        <asp:PostBackTrigger ControlID="btn_modificar_licenciaoperacional" />
        <asp:PostBackTrigger ControlID="btn_grabar_modificacion_paciente" />
        <asp:AsyncPostBackTrigger ControlID="gvRegistroHistorico" EventName="RowCommand" />
        <asp:AsyncPostBackTrigger ControlID="gvDetalleLicenciaOperacional" EventName="RowCommand" />
        <asp:AsyncPostBackTrigger ControlID="gvNuevaLicenciaOperacional" EventName="RowCommand" />
        <asp:AsyncPostBackTrigger ControlID="gvLicenciaOperacional" EventName="RowCommand" />
        <asp:PostBackTrigger ControlID="btn_consulta_buscar" />
        <asp:PostBackTrigger ControlID="btn_subir_registrohistorico"/>
        <asp:PostBackTrigger ControlID="btn_Ingresar"/>
        <asp:PostBackTrigger ControlID="ddl_AnalisisLab" />
        <asp:PostBackTrigger ControlID="ddl_edit_analisisLab" />
        <asp:PostBackTrigger ControlID="btn_edit_editar" />
        <asp:PostBackTrigger ControlID="btn_nuevo_analisis" />
        <asp:PostBackTrigger ControlID="btn_edit_eliminar" />
        
        <asp:AsyncPostBackTrigger ControlID="gvAnalisisLab" EventName="RowCommand" />
        
        
        
        
    </Triggers>
</asp:UpdatePanel>
</form>  

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server"> </asp:Content>
