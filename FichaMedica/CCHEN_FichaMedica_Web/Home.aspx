<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="CCHEN_FichaMedica_Web.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

<div align="center">
   <%-- <asp:Image ID="Image1" runat="server" ImageUrl="images/atencion-medica.jpg" Width="60%" />--%>
    <img src="images/atencion-medica2.jpg" class="img-responsive" alt="Imagen responsive" align="center">
        <div class="row">
        <div class="col-md-6" id="div_RC_Menu_Cita" runat="server" visible="false">
            <h2>Registra una Cita</h2>
            <p>
                Aquí puedes revisar tu calendario de Citas, crear nuevos registros y cerrar las citas ya realizadas.
            </p>
            <p>
                <a class="btn btn-primary" href="Cita/Cita.aspx">Leer más &raquo;</a>
            </p>
        </div>
        <div class="col-md-6" id="div_RC_Menu_RegistroClinico" runat="server" visible="false">
            <h2>Ver Registro Clínico</h2>
            <p>
                Aquí puedes ver el Registro Clínico de todos los pacientes, ingresar nuevos, crear fichas de atenciones, antecedenes, entre otros.
            </p>
            <p>
                <a class="btn btn-primary" href="RegistroClinico/RegistroClinico.aspx">Leer más &raquo;</a>
            </p>
        </div>
    </div>
</div>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
</p>
<p>
    <br />
</p>
</asp:Content>
