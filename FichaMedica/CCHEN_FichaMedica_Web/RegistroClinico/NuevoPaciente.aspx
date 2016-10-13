<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NuevoPaciente.aspx.cs" Inherits="CCHEN_FichaMedica_Web.RegistroClinico.NuevoPaciente" %>

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

</script> 

<div class="panel panel-info" id="div_nueva" runat="server" visible="true">
    <div class="panel-heading"><h3 class="panel-title">Nuevo Paciente</h3></div>
    <div class="panel-body">
            
        <div id="div_form_nuevo" class="form-group" runat="server">

            <div class="alert alert-success" id="div_grabar_ok" runat="server" visible="false">
            <strong>¡Bien hecho!</strong> Haz grabado correctamente el nuevo paciente. </div>

            <div class="alert alert-danger alert-dismissable" id="div_grabar_error" runat="server" visible="false">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <strong>¡Error!</strong> Ha ocurrido un inconveniente al grabar, si ésto persiste, contacta al Administrador del Sistema. </div>

            <div class="col-sm-3"><label for="inputName" class="control-label" >RUT :</label></div>
            <div class="col-sm-2"><asp:TextBox id="txt_np_rut" runat="server" class="form-control" type="number" ValidationExpression = "^[\s\S]{1,8}$" required></asp:TextBox></div>
            <div class="col-sm-1"><asp:TextBox id="txt_np_dv" runat="server" class="form-control" MaxLength=1 required></asp:TextBox></div>

            <div class="col-sm-3"><label for="inputName" class="control-label" >Nombres :</label></div>
            <div class="col-sm-3"><asp:TextBox id="txt_np_nombre" runat="server" class="form-control" required></asp:TextBox></div>

            <div class="col-sm-3"><label for="inputName" class="control-label" >Apellido Paterno :</label></div>
            <div class="col-sm-3"><asp:TextBox id="txt_np_app_pat" runat="server" class="form-control" required></asp:TextBox></div>

            <div class="col-sm-3"><label for="inputName" class="control-label" >Apellido Materno :</label></div>
            <div class="col-sm-3"><asp:TextBox id="txt_np_app_mat" runat="server" class="form-control" required></asp:TextBox></div>

            <div class="col-sm-3"><label for="inputName" class="control-label" >Fecha Nacimiento :</label></div>
            <div class="col-sm-3"><asp:TextBox id="txt_np_fechanacimiento" runat="server" class="form-control" type="date" name="fechanacimiento" step="1" min="1900-01-01" ontextchanged="txt_np_fechanacimiento_TextChanged" required></asp:TextBox></div>

            <div class="col-sm-3"><label for="inputName" class="control-label" >Sexo :</label></div>
            <div class="col-sm-3"><asp:DropDownList ID="ddl_np_sexo" runat="server" class="form-control" onselectedindexchanged="ddl_np_sexo_SelectedIndexChanged" required></asp:DropDownList></div>

            <div class="col-sm-3"><label for="inputName" class="control-label" >Profesión :</label></div>
            <div class="col-sm-3"><asp:TextBox id="txt_np_profesion" runat="server" class="form-control" required></asp:TextBox></div>
            
            <div class="col-sm-3"><label for="inputName" class="control-label" >Nivel Educacional :</label></div>
            <div class="col-sm-3"><asp:DropDownList ID="ddl_np_niveleducacional" runat="server" class="form-control" onselectedindexchanged="dl_np_niveleducacional_SelectedIndexChanged"></asp:DropDownList></div>

            <div class="col-sm-3"><label for="inputName" class="control-label" >Ocupación :</label></div>
            <div class="col-sm-3"><asp:TextBox id="txt_np_ocupacion" runat="server" class="form-control" required></asp:TextBox></div>

            <div class="col-sm-3"><label for="inputName" class="control-label" >Departamento :</label></div>
            <div class="col-sm-3"><asp:DropDownList ID="ddl_np_departamento" runat="server" class="form-control" onselectedindexchanged="ddl_np_departamento_SelectedIndexChanged" required></asp:DropDownList></div>

            <div class="col-sm-3"><label for="inputName" class="control-label" >Dirección :</label></div>
            <div class="col-sm-3"><asp:TextBox id="txt_np_direccion" runat="server" class="form-control" required></asp:TextBox></div>

            <div class="col-sm-3"><label for="inputName" class="control-label" >Estado Civil :</label></div>
            <div class="col-sm-3"><asp:DropDownList ID="ddl_np_estadocivil" runat="server" class="form-control" onselectedindexchanged="ddl_np_estadocivil_SelectedIndexChanged" required></asp:DropDownList></div>

            <div class="col-sm-3"><label for="inputName" class="control-label" >Sede :</label></div>
            <div class="col-sm-3"><asp:DropDownList ID="ddl_np_sede" runat="server" class="form-control" onselectedindexchanged="ddl_np_sede_SelectedIndexChanged" required></asp:DropDownList></div>

            <div class="col-sm-3"><label for="inputName" class="control-label" >Previsión :</label></div>
            <div class="col-sm-3"><asp:DropDownList ID="ddl_np_prevision" runat="server" class="form-control" onselectedindexchanged="ddl_np_prevision_SelectedIndexChanged" required></asp:DropDownList></div>

            <div class="col-sm-3"><label for="inputName" class="control-label" >Fono Contacto :</label></div>
            <div class="col-sm-3"><asp:TextBox id="txt_np_fonocontacto" type="number" runat="server" MaxLength="11" class="form-control" required></asp:TextBox></div>

            <div class="col-sm-3"><label for="inputName" class="control-label" >Fono Emergencia :</label></div>
            <div class="col-sm-3"><asp:TextBox id="txt_np_fonoemergencia" type="number" runat="server" MaxLength="11" class="form-control" required></asp:TextBox></div>

            <div class="col-sm-3"><label for="inputName" class="control-label" >Contacto Emergencia :</label></div>
            <div class="col-sm-3"><asp:TextBox id="txt_np_contactoemergencia" runat="server" class="form-control" required></asp:TextBox></div>
           

            <div>&nbsp;</div>
            <div>&nbsp;</div>  

            <div class="col-sm-12" align="center">
            <asp:Button ID="btn_grabar_paciente" class="btn btn-primary" runat="server" onclick="btn_grabar_paciente_clic" Text="Grabar Nuevo Paciente" />&nbsp;
            <asp:Button ID="btn_volver" class="btn btn-primary" runat="server" formnovalidate  onclick="btn_grabar_volver_clic" Text="Volver" />                

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