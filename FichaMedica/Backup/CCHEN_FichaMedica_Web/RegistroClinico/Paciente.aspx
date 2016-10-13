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

    function openTabs(evt, cityName) {
        var i, tabcontent, tablinks;
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
        }
        document.getElementById(cityName).style.display = "block";
        evt.currentTarget.className += " active";
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

    <ul class="nav nav-tabs nav-justified">
  <li class="active"><a href="#" class="tablinks" onclick="openTabs(event, 'historial_atenciones')">Historial de Atenciones</a></li>
  <li><a href="#" class="tablinks" onclick="openTabs(event, 'licencias_operacionales')">Licencias Operacionales</a></li>
  <li><a href="#" class="tablinks" onclick="openTabs(event, 'analisis_clinicos')">Análisis Clínicos</a></li>
  <li><a href="#" class="tablinks" onclick="openTabs(event, 'registros_históricos')">Registros Históricos</a></li>
</ul>

<div id="historial_atenciones" class="tabcontent">

  <div class="panel-group" id="accordion">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">Collapsible Group 1</a>
        </h4>
      </div>
      <div id="collapse1" class="panel-collapse collapse in">
        <div class="panel-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit,
        sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">Collapsible Group 2</a>
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
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">Collapsible Group 3</a>
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

<div id="licencias_operacionales" class="tabcontent">
  <p>Paris is the capital of France.</p>
</div>

<div id="analisis_clinicos" class="tabcontent">
  <p>Tokyo is the capital of Japan.</p>
</div>

<div id="registros_históricos" class="tabcontent">
  <p>Tokyo is the capital of Chile.</p>
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
