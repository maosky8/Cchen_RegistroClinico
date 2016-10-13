<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CCHEN_FichaMedica_Web.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]>      <html class="no-js"> <![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width">
<title> CCHEN - Ficha Médica</title>

<link rel="icon" type="images/png" href="favicon.ico" />


<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
    
<script src="/_base/js/jquery.min.js" type="text/javascript"></script>     
<script src="/_base/js/bootstrap.js" type="text/javascript"></script> 
<script src="/_base/js/modernizr.js" type="text/javascript"></script> 
<script src="/_base/js/jquery.scrollto.min.js" type="text/javascript"></script> 
<script src="/_base/js/smooth_scroll.js" type="text/javascript"></script> 
<script src="/_base/js/a11y.js" type="text/javascript"></script> 
<script src="/_base/js/backstretch.js" type="text/javascript"></script> 
<link href="/css/bootstrap.css" rel="stylesheet" type="text/css" />     
<link href="/css/smooth_scroll.css" rel="stylesheet" type="text/css" /> 
<link href="/css/jquery-ui-1.8.16.custom.css" rel="stylesheet" type="text/css"  />
<link href="/css/style.css?SyncToken=1" rel="stylesheet" type="text/css"  />
<link href="/css/a11y.css" rel="stylesheet" type="text/css"  />
<link href="/css/a11y-toolbar.css" rel="stylesheet" type="text/css"  />
<link href="/css/a11y-fontsize.css" rel="stylesheet" type="text/css"  />
<script type="text/javascript">    var a11y_stylesheet_path = "/css/a11y-contrast.css"; </script>

<%--<script type="text/javascript">    $(document).ready(function () { $('#content').backstretch("/images/bg-alternativo2.jpg");  });</script>--%>
  	
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
<script src="/js/html5shiv.js"></script> 
<script src="/js/respond.min.js"></script>
<script src="/js/css3-mediaqueries.js"></script>
<![endif]-->

</head>


<body class="inside cat-urbanismo">


<!-- /////////////////////////
********** HEADER ************
///////////////////////// --> 
<!-- menu principal -->
<nav class="navbar nav-minvu navbar-default header-site" role="navigation">  
  <div class="container">	
  <div class="navbar-header">



  <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-1">
		  <span class="sr-only">Toggle navigation</span>
		  <span class="icon-bar"></span>
		  <span class="icon-bar"></span>
		  <span class="icon-bar"></span>
		</button>
		<h1 class="title"> 
			<a class="navbar-brand" sl-processed="1"> Sistema de Registro Clínico</a>
		</h1>
		<br />
		<h2 class="cat-app-minvu cat-title default-title">Comisión Chilena de Energía Nuclear</h2>
		<br />
  </div>

  <div class="collapse navbar-collapse" id="navbar-collapse-1">
    

    <ul class="nav navbar-nav navbar-right">
        <li><a href="http://intranet.cchen.cl/">Salir <asp:Label ID="lblSalir" runat="server" Text="" ></asp:Label></a></li>
    </ul>
  </div><!-- /.navbar-collapse -->
  </div>	
</nav>




<!-- /////////////////////////
********** CONTENIDO ********
///////////////////////// --> 
<div id="content" class="container clearfix" align="center" >

    <h2 id="formularios" class="titles-site">Ingreso al Sistema </h2>
<h1></h1>

    <form id="form1" runat="server">

<div class="alert alert-danger" id="divAlert" runat="server" visible="false">
              <button type="button" class="close" data-dismiss="alert">×</button><br>
              <strong>Acceso inválido!</strong> el nombre de usuario o contraseña que ha ingresado no es válido, intente denuevo.
</div>

  <div class="form-group">
    <label for="inputName" class="col-sm-5 control-label">Usuario (*) :</label>
    <div class="col-sm-5" style="height: 46px">
      <input type="text" class="form-control" id="txtNombre" placeholder="Usuario" runat="server">
    </div>
  </div>
  <div class="form-group">
    <label for="inputApellido" class="col-sm-5 control-label">Contraseña (*) :</label>
    <div class="col-sm-5">
      <input type="password" class="form-control" id="txtContraseña" placeholder="Contraseña" runat="server">
    </div>
  </div>
  <div class="form-group">
    <label for="inputApellido" class="col-sm-3 control-label" 
          style="font-size: x-small; font-style: italic">(*) Campos Obligatorios</label>
    
  </div>


  
  
  
    

  <div class="form-group">
    <div class="col-sm col-sm-10" align="center" style="height: 57px">
        <%--<button type="submit" class="btn btn-primary" id="btn_ingresar" runat="server" OnClick="btn_ingresar_clic" > Ingresar   </button>--%>
        <asp:Button ID="btn_ingresar" class="btn btn-primary" runat="server" onclick="btn_ingresar_clic" Text="Ingresar" />
    </div>
  </div>
  <h1></h1>

    </form>

</div>	<!-- fin de .content -->	



<!-- /////////////////////////
********** FOOTER ************
///////////////////////// -->
 <!-- begin footer -->
<footer class="footer-site" role="contentinfo">
	<div class="container clearfix">


<div class="col-md-15 address-footer info-footer ">				
				<ul>
					<li class="address-f">
					<h2 class="minvu-name">
					Centro Estudio Nucleares La Reina
					</h2>
					<p>
					 Avda. Nueva Bilbao Nº 12.501, Santiago, Chile
					<br>
					Mesa Central: (56-2) 23646100
					<br>
					 
					<br>
					 <br>

 
					</li>
					<li>
					<a href="http://www.cchen.cl" target="_blank" title="ir a CCHEN"><img src="/images/cchen-logo-footer.png" alt="Logo minvu"></a>
					</li>
				</ul>					
			</div>											
	</div> <!-- end #inner-footer -->
</footer> 
<!-- end footer -->

<a href="#" class="scrollup" style="display: inline;">Scroll</a>


</body>
</html>