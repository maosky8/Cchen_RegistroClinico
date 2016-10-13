<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistroClinico.aspx.cs" Inherits="CCHEN_FichaMedica_Web.RegistroClinico.RegistroClinico" %>


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

</script> 



<div class="panel panel-info" id="div_filtros" runat="server">
    <div class="panel-heading"><h3 class="panel-title">Filtros de búsqueda</h3></div>
    <div class="panel-body">          
    <div id="Div1" class="form-group" runat="server">
            <div class="col-sm-3"><label for="inputName" class="control-label">RUT Paciente :</label></div>
            <div class="col-sm-3"><asp:TextBox id="txt_bsq_rut" type="number" runat="server" class="form-control" ToolTip="RUT sin dígito ni guión"></asp:TextBox></div>

            <div class="col-sm-3"><label for="inputName" class="control-label">Nombre Paciente:</label></div>
            <div class="col-sm-3"><asp:DropDownList ID="ddl_bsq_NombrePaciente" runat="server" class="form-control"
                    onselectedindexchanged="ddl_bsq_NombrePaciente_SelectedIndexChanged"></asp:DropDownList></div>

            <div class="col-sm-3"><label for="inputName" class="control-label">Sexo:</label></div>
            <div class="col-sm-3"><asp:DropDownList ID="ddl_bsq_sexo" runat="server" class="form-control"
                    onselectedindexchanged="ddl_bsq_sexo_SelectedIndexChanged"></asp:DropDownList></div>

            <div class="col-sm-3"><label for="inputName" class="control-label">Sede :</label></div>
            <div class="col-sm-3"><asp:DropDownList ID="ddl_bsq_sede" runat="server" class="form-control"
                    onselectedindexchanged="ddl_bsq_sede_SelectedIndexChanged"></asp:DropDownList></div>
                    <div>&nbsp;</div>

            <div class="col-sm-12" align="center">
            <asp:Button ID="btn_buscar" class="btn btn-primary" runat="server" onclick="btn_buscar_clic"  Text="Buscar" />
            &nbsp;
            <asp:Button ID="btn_limpiar" class="btn btn-primary" runat="server" onclick="btn_limpiar_clic" Text="Limpiar" />
            &nbsp;
            <asp:Button ID="btn_nuevopaciente" class="btn btn-primary" runat="server" onclick="btn_nuevopaciente_clic" Text="Nuevo Paciente" />
            </div>
            
            </div>                 
    </div>
</div>

<div class="alert alert-warning alert-dismissable" id="div_alert_busqueda_error" runat="server" visible="false">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <strong>¡Lástima!</strong> La búsqueda no arrojó resultados, prueba con otros filtros. </div>

<div class="panel panel-info" id="div_resultado" runat="server" visible="false">
    <div class="panel-heading"><h3 class="panel-title">Resultado de la búsqueda</h3></div>
    <div class="panel-body">

    <asp:GridView   CssClass="table table-striped" 
                    ID="gvRegistroClinico" 
                    runat="server"
                    AutoGenerateColumns="False" 
                    OnRowCommand="gvRegistroClinico_RowCommand" 
                    DataKeyNames="IdRutPaciente" 
                    Width="100%" onselectedindexchanged="gvRegistroClinico_SelectedIndexChanged">
                            <Columns>
                                <asp:BoundField DataField="IdRutPaciente" HeaderText="IdRutPaciente" Visible="false" ItemStyle-Width="10%"></asp:BoundField>
                                <asp:TemplateField HeaderText="RUT Paciente" ItemStyle-Width="10%" HeaderStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnk_RutPaciente" runat="server" Text='<%#Eval("RutPaciente")%>'
                                            CommandName="Seleccionar" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"idRutPaciente") %>'></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="NombrePaciente" HeaderText="Nombre Paciente" ItemStyle-Width="50%"></asp:BoundField>
                                <asp:BoundField DataField="Sexo" HeaderText="Sexo" ItemStyle-Width="10%"></asp:BoundField>
                                <asp:BoundField DataField="Sede" HeaderText="Sede" ItemStyle-Width="10%"></asp:BoundField>                                
                                <asp:BoundField DataField="Departamento" HeaderText="Departamento" ItemStyle-Width="20%"></asp:BoundField>

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






<div style="display: none">  
<%--<asp:HiddenField ID="hdnIdCita" runat="server" /> --%>
<asp:HiddenField ID="hdnRutPaciente" runat="server" /> 
</div>
                      
</ContentTemplate>
</asp:UpdatePanel>
</form>  

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server"> </asp:Content>