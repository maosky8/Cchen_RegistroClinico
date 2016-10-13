<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cita.aspx.cs" Inherits="CCHEN_FichaMedica_Web.Cita.Cita" %>
<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

<form id="Form1" class=form-horizontal runat="server">

<div id="divCarga">
    <asp:ScriptManager ID="ScriptManager1" EnableScriptGlobalization="true" EnableScriptLocalization="true" runat="server"></asp:ScriptManager>
    <asp:UpdateProgress ID="updProgress" DynamicLayout="true" runat="server" AssociatedUpdatePanelID="upCitas">
        <ProgressTemplate>
            <div id="divUpdateProgress" runat="server" class="overlay">
                <center>
                    <img src="../images/loading.gif" alt="Cargando...." />
                </center>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
</div>
<asp:UpdatePanel ID="upCitas" runat="server">
<ContentTemplate>

<script language="javascript" type="text/javascript">

        function EliminarCita() {
            if (confirm("¿Está seguro que desea eliminar la cita?"))
                return true;
            else
                return false;
        }

        function ModificarCita() {
            if (confirm("¿Está seguro que desea modificar la cita?"))
                return true;
            else
                return false;
        }

    </script> 

  <!-- Modal -->
  <div class="modal fade" id="mdl_modificar" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modificar Cita</h4>
        </div>
        <div class="modal-body">
          <p>¿Está seguro de modificar la Cita?.</p>
        </div>
        <div class="modal-footer">
          <button  class="btn btn-success"><span class="glyphicon glyphicon-save" onclick="$('#modal-container').hide();"></span> Aceptar</button>
          <button  class="btn btn-danger" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancelar</button>
          
        </div>
      </div>
      
    </div>
  </div>

<div class="panel panel-info" id="div_filtros" runat="server">
    <div class="panel-heading"><h3 class="panel-title">Filtros de búsqueda</h3></div>
    <div class="panel-body">          
    <div class="form-group" runat="server">
            <div class="col-sm-3"><label for="inputName" class="control-label">Fecha Cita :</label></div>
            <div class="col-sm-3"><asp:TextBox id="txt_fechacita" runat="server" class="form-control" type="date" name="fechacita" step="1" min="2016-01-01"></asp:TextBox></div>

            <div class="col-sm-3"><label for="inputName" class="control-label">Nombre Paciente:</label></div>
            <div class="col-sm-3"><asp:DropDownList ID="DropDownList_NombrePaciente" runat="server" class="form-control"
                    onselectedindexchanged="DropDownList_NombrePaciente_SelectedIndexChanged"></asp:DropDownList></div>

            <div class="col-sm-3"><label for="inputName" class="control-label">Estado Cita:</label></div>
            <div class="col-sm-3"><asp:DropDownList ID="DropDownList_EstadoCita" runat="server" class="form-control"
                    onselectedindexchanged="DropDownList_EstadoCita_SelectedIndexChanged"></asp:DropDownList></div>

            <div class="col-sm-3"><label for="inputName" class="control-label">Tipo Cita :</label></div>
            <div class="col-sm-3"><asp:DropDownList ID="DropDownList_TipoCita" runat="server" class="form-control"
                    onselectedindexchanged="DropDownList_TipoCita_SelectedIndexChanged"></asp:DropDownList></div>
                    <div>&nbsp;</div>

            <div class="col-sm-12" align="center">
            <asp:Button ID="btn_buscar" class="btn btn-primary" runat="server" onclick="btn_buscar_clic"  Text="Buscar" />
            &nbsp;
            <asp:Button ID="btn_limpiar" class="btn btn-primary" runat="server" onclick="btn_limpiar_clic" Text="Limpiar" />
            &nbsp;
            <asp:Button ID="btn_nuevacita" class="btn btn-primary" runat="server" onclick="btn_nuevacita_clic" Text="Nueva Cita" />
            </div>
            
            </div>                 
    </div>
</div>

<div class="alert alert-warning alert-dismissable" id="div_alert_busqueda_error" runat="server" visible="false">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <strong>¡Lástima!</strong> La búsqueda no arrojó resultados, prueba con otros filtros. </div>

<div class="alert alert-warning alert-dismissable" id="div_alert_resultado_sininfo" runat="server" visible="false">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <strong>¡Cuidado!</strong> La Cita que ha seleccionado, no contiene información. </div>

<div class="alert alert-danger alert-dismissable" id="div_alert_resultado_error" runat="server" visible="false">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <strong>¡Error!</strong> Ha ocurrido un inconveniente, si ésto persiste, contacta al Administrador del Sistema. </div>

<div class="alert alert-success" id="div_alert_eliminar_ok" runat="server" visible="false">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <strong>¡Bien hecho!</strong> La Cita se ha eliminado correctamente. </div>

<div class="panel panel-info" id="div_resultado" runat="server" visible="false">
    <div class="panel-heading"><h3 class="panel-title">Resultado de la búsqueda</h3></div>
    <div class="panel-body">

    <asp:GridView   CssClass="table table-striped" 
                    ID="gvCitas" 
                    runat="server"
                    AutoGenerateColumns="False" 
                    OnRowCommand="gvCitas_RowCommand" 
                    DataKeyNames="HoraCita" 
                    Width="100%" onselectedindexchanged="gvCitas_SelectedIndexChanged">
                            <Columns>
                                <asp:BoundField DataField="IdCita" HeaderText="ID Cita" Visible="false" ItemStyle-Width="10%"></asp:BoundField>
                                <asp:BoundField DataField="FechaCita" HeaderText="Fecha Cita" ItemStyle-Width="10%"></asp:BoundField>
                                <%--<asp:BoundField DataField="HoraCita" HeaderText="Hora Cita" ItemStyle-Width="10%"></asp:BoundField>--%>
                                <asp:TemplateField HeaderText="Hora Cita" ItemStyle-Width="10%" HeaderStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnk_HoraCita" runat="server" Text='<%#Eval("HoraCita")%>'
                                            CommandName="Seleccionar" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"IdCita") %>'></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="HoraRealCita" HeaderText="Hora Real Cita" ItemStyle-Width="10%"></asp:BoundField>
                                <asp:BoundField DataField="NombrePaciente" HeaderText="Paciente" ItemStyle-Width="25%"></asp:BoundField>
                                <asp:BoundField DataField="RutPaciente" HeaderText="RUT" ItemStyle-Width="10%"></asp:BoundField>
                                <asp:BoundField DataField="TipoCita" HeaderText="Tipo Cita" ItemStyle-Width="20%"></asp:BoundField>                                
                                <asp:BoundField DataField="EstadoCita" HeaderText="Estado Cita" ItemStyle-Width="10%"></asp:BoundField>

                            </Columns>
                        </asp:GridView>

<%--    <div class="panel-body">
    <ul class="nav nav-tabs">
  <li class="active"><a href="#">Inicio</a></li>
  <li><a href="#">Perfil</a></li>
  <li><a href="#">Mensajes</a></li>
</ul>
      Contenido del panel--%>

    </div>
</div>

<div class="alert alert-danger alert-dismissable" id="div_alert_detalle_editar_error" runat="server" visible="false">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <strong>¡Error!</strong> No se ha podido editar la Cita, si ésto persiste, contacta al Administrador del Sistema. </div>

<div class="alert alert-success" id="div_alert_detalle_editar_ok" runat="server" visible="false">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <strong>¡Bien hecho!</strong> La Cita se ha modificado correctamente. </div>

<div class="panel panel-info" id="div_detalle" runat="server" visible="false">
    <div class="panel-heading"><h3 class="panel-title">Detalle de Cita</h3></div>
    <div class="panel-body">
            
        <div id="Div1" class="form-group" runat="server">
            <div class="col-sm-3"><label for="inputName" class="control-label">Fecha Cita :</label></div>
            <div class="col-sm-3"><asp:TextBox id="txt_fecha_cita_detalle" runat="server" class="form-control" disabled></asp:TextBox></div>

            <div class="col-sm-3"><label for="inputName" class="control-label">Hora Cita :</label></div>
            <div class="col-sm-3"><asp:TextBox id="txt_hora_detalle" runat="server" class="form-control" disabled></asp:TextBox></div>

            <div class="col-sm-3"><label for="inputName" class="control-label">Hora Real Cita :</label></div>
            <div class="col-sm-3"><asp:TextBox id="txt_hora_real_detalle" type="time" runat="server" class="form-control"></asp:TextBox></div>
            
            <div class="col-sm-3"><label for="inputName" class="control-label">Tipo Cita :</label></div>
            <%--<div class="col-sm-3"><asp:TextBox id="txt_tipocita_detalle" runat="server" class="form-control"></asp:TextBox></div>--%>
            <div class="col-sm-3"><asp:DropDownList ID="DropDownList_TipoCita_detalle" runat="server" class="form-control" onselectedindexchanged="DropDownList_TipoCita_detalle_SelectedIndexChanged"></asp:DropDownList></div>

            <div class="col-sm-3"><label for="inputName" class="control-label">Nombre Paciente :</label></div>
            <%--<div class="col-sm-3"><asp:TextBox id="txt_paciente_detalle" runat="server" class="form-control"></asp:TextBox></div>--%>
            <div class="col-sm-3"><asp:DropDownList ID="DropDownList_NombrePaciente_detalle" runat="server" class="form-control" onselectedindexchanged="DropDownList_NombrePaciente_detalle_SelectedIndexChanged"></asp:DropDownList></div>

            <div class="col-sm-3"><label for="inputName" class="control-label">Número de Contacto :</label></div>
            <div class="col-sm-3"><asp:TextBox id="txt_numerocontacto_detalle" type="number" runat="server" class="form-control"></asp:TextBox></div>

            <div class="col-sm-3"><label for="inputName" class="control-label">Observaciones :</label></div>
            <div class="col-sm-3"><asp:TextBox id="txt_observaciones_detalle" style="Z-INDEX: 501; OVERFLOW: hidden;  " runat="server" TextMode="MultiLine" class="form-control"></asp:TextBox></div>
             
            <div class="col-sm-3"><label for="inputName" class="control-label">Profesional Responsable :</label></div>
            <div class="col-sm-3"><asp:TextBox id="txt_responsable_detalle" runat="server" class="form-control"></asp:TextBox></div>

            <div class="col-sm-3"><label for="inputName" class="control-label">Estado Cita :</label></div>
            <div class="col-sm-3"><asp:DropDownList ID="DropDownList_EstadoCita_detalle" runat="server" class="form-control" onselectedindexchanged="DropDownList_EstadoCita_detalle_SelectedIndexChanged"></asp:DropDownList></div>


            <div>&nbsp;</div> 
            <div class="col-sm-12" align="center">
            <asp:Button ID="btn_modificar" class="btn btn-primary" runat="server" onclick="btn_modificar_clic" Text="Modificar Cita"  OnClientClick="return ModificarCita();" />
            <asp:Button ID="btn_eliminar" class="btn btn-primary" runat="server" onclick="btn_eliminar_clic" OnClientClick="return EliminarCita();" Text="Eliminar Cita" />
            <asp:Button ID="btn_verpaciente" class="btn btn-primary" runat="server" onclick="btn_verpaciente_clic" Text="Ver Detalle Paciente" />
            </div>
            
            </div>
            



            
    </div>
</div>

<div class="alert alert-success" id="div_alert_crear_cita_ok" runat="server" visible="false">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <strong>¡Bien hecho!</strong> La Cita se ha creado correctamente. </div>

<div class="alert alert-danger alert-dismissable" id="div_alert_crear_cita_error" runat="server" visible="false">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <strong>¡Error!</strong> No se ha podido crear la Cita, si ésto persiste, contacta al Administrador del Sistema. </div>

<div class="panel panel-info" id="div_nueva" runat="server" visible="false">
    <div class="panel-heading"><h3 class="panel-title">Nueva Cita</h3></div>
    <div class="panel-body">
            
        <div id="div_" class="form-group" runat="server">
            <div class="col-sm-3"><label for="inputName" class="control-label">Fecha Cita :</label></div>
            <div class="col-sm-3"><asp:TextBox id="txt_nc_fechacita" runat="server" class="form-control" type="date" name="fechacita" step="1" min="2016-01-01" ontextchanged="txt_nc_fechacita_TextChanged" required></asp:TextBox></div>

            <div class="col-sm-3"><label for="inputName" class="control-label" >Hora Cita :</label></div>
            <div class="col-sm-3"><asp:DropDownList ID="DropDownList_nc_horacita" runat="server" class="form-control" onselectedindexchanged="DropDownList_nc_horacita_SelectedIndexChanged" required></asp:DropDownList></div>
            
            <div class="col-sm-3"><label for="inputName" class="control-label" >Tipo Cita :</label></div>
            <%--<div class="col-sm-3"><asp:TextBox id="txt_tipocita_detalle" runat="server" class="form-control"></asp:TextBox></div>--%>
            <div class="col-sm-3"><asp:DropDownList ID="DropDownList_nc_tipocita" runat="server" class="form-control" onselectedindexchanged="DropDownList_nc_TipoCita_SelectedIndexChanged" required></asp:DropDownList></div>

            <div class="col-sm-3"><label for="inputName" class="control-label">Nombre Paciente :</label></div>
            <%--<div class="col-sm-3"><asp:TextBox id="txt_paciente_detalle" runat="server" class="form-control"></asp:TextBox></div>--%>
            <div class="col-sm-3"><asp:DropDownList ID="DropDownList_nc_nombrepaciente" runat="server" class="form-control" onselectedindexchanged="DropDownList_nc_NombrePaciente_SelectedIndexChanged" required></asp:DropDownList></div>

            <div class="col-sm-3"><label for="inputName" class="control-label">Número de Contacto :</label></div>
            <div class="col-sm-3"><asp:TextBox id="txt_nc_numerocontacto" type="number" runat="server" class="form-control"></asp:TextBox></div>

            <div class="col-sm-3"><label for="inputName" class="control-label">Observaciones :</label></div>
            <div class="col-sm-3"><asp:TextBox id="txt_nc_observaciones" style="Z-INDEX: 501; OVERFLOW: hidden;  " runat="server" TextMode="MultiLine" class="form-control"></asp:TextBox></div>
             
            <div class="col-sm-3"><label for="inputName" class="control-label">Profesional Responsable :</label></div>
            <div class="col-sm-3"><asp:TextBox id="txt_nc_profresponsable" runat="server" class="form-control" required></asp:TextBox></div>

            <div class="col-sm-3"><label for="inputName" class="control-label">Estado Cita :</label></div>
            <div class="col-sm-3"><asp:DropDownList ID="DropDownList_nc_estadocita" runat="server" class="form-control" onselectedindexchanged="DropDownList_nc_EstadoCita_SelectedIndexChanged" required></asp:DropDownList></div>


            <div>&nbsp;</div> 
            <div class="col-sm-12" align="center">
            <asp:Button ID="btn_grabar_nuevacita" class="btn btn-primary" runat="server" onclick="btn_grabar_nuevacita_clic" Text="Grabar Nueva Cita" />&nbsp;
            <asp:Button ID="btn_volver_nuevacita" class="btn btn-primary" runat="server" formnovalidate onclick="btn_volver_nuevacita_clic" Text="Volver" />
                </div>
            
            </div>
            



            
    </div>
</div>

<div style="display: none">  
<asp:HiddenField ID="hdnIdCita" runat="server" /> 
<asp:HiddenField ID="hdnRutCita" runat="server" /> 
</div>
                      
</ContentTemplate>
</asp:UpdatePanel>
</form>  

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server"> </asp:Content>
 