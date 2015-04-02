

<%@page import="java.util.Date"%>
<%@page import="org.joda.time.DateTime"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Calendar.calendarDates"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    DateTime hoy = new DateTime();
    SimpleDateFormat t = new SimpleDateFormat("dd-MM-yyyy");
    String FECHA_TITULO = t.format(hoy.toDate()).toString();
    //  HttpSession sesion = request.getSession();
    if (session.getAttribute("Usuario") == null) {
        response.sendRedirect("login.jsp");
    } else {
        // nesesita una cookie para utilizar valvulas por eso lo regresava a esta pagina 
        //ahora regresa y temanda de nuevo pero ya con la session
       
        response.sendRedirect("../tblMixtas/index.jsp");

%>
<html>
    <head>
        <meta charset="UTF-8">
        
        <title> Gas | Petroquimica Basica</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- bootstrap 3.0.2 -->
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>

        <!-- font Awesome -->
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <!-- Morris chart -->
        <link href="css/morris/morris.css" rel="stylesheet" type="text/css" />
        <!-- jvectormap -->
        <link href="css/jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
        <!-- fullCalendar -->

        <link href="sitio/css/fullcalendar.css" rel="stylesheet" type="text/css"/>
        <link href="sitio/css/fullcalendar.print.css" rel="stylesheet" media="print"/>

        <!-- Data table-->
        <link href="css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css"/>
        <!-- Daterange picker -->
        <!-- <link href="css/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />--->
        <link href="css/daterangepicker/daterangepicker.css" rel="stylesheet" type="text/css"/>
        <!-- bootstrap wysihtml5 - text editor -->
        <link href="css/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="css/AdminLTE.css" rel="stylesheet" type="text/css" />

    </style>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    
    
  
    
</head>
<body  class="skin-blue">
    <!-- header logo: style can be found in header.less -->
    <header class="header">
        <a href="index.jsp" class="logo">
            <!-- Add the class icon to your logo image or logo icon to add the margining -->
            <p>Pemex</p> 
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
            <!-- Sidebar toggle button-->
            <a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas" role="button">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <div class="navbar-right">
                <ul class="nav navbar-nav">
                    <!-- Messages: style can be found in dropdown.less-->
                    <% if (session.getAttribute("Rol").equals(3)) { %>
                    <li class="dropdown messages-menu">
                        <a  id="correor" href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-envelope"></i>
                            <span class="label label-success">4</span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="header">You have 4 messages</li>
                            <li>
                                <!-- inner menu: contains the actual data -->
                                <ul class="menu">
                                    <li><!-- start message -->
                                        <a href="#">
                                            <div class="pull-left">
                                                <img src="img/avatar3.png" class="img-circle" alt="User Image"/>
                                            </div>
                                            <h4>
                                                Support Team
                                                <small><i class="fa fa-clock-o"></i> 5 mins</small>
                                            </h4>
                                            <p>Why not buy a new awesome theme?</p>
                                        </a>
                                    </li><!-- end message -->
                                    <li>
                                        <a href="#">
                                            <div class="pull-left">
                                                <img src="img/avatar2.png" class="img-circle" alt="user image"/>
                                            </div>
                                            <h4>
                                                AdminLTE Design Team
                                                <small><i class="fa fa-clock-o"></i> 2 hours</small>
                                            </h4>
                                            <p>Why not buy a new awesome theme?</p>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="pull-left">
                                                <img src="img/avatar.png" class="img-circle" alt="user image"/>
                                            </div>
                                            <h4>
                                                Developers
                                                <small><i class="fa fa-clock-o"></i> Today</small>
                                            </h4>
                                            <p>Why not buy a new awesome theme?</p>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="pull-left">
                                                <img src="img/avatar2.png" class="img-circle" alt="user image"/>
                                            </div>
                                            <h4>
                                                Sales Department
                                                <small><i class="fa fa-clock-o"></i> Yesterday</small>
                                            </h4>
                                            <p>Why not buy a new awesome theme?</p>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="pull-left">
                                                <img src="img/avatar.png" class="img-circle" alt="user image"/>
                                            </div>
                                            <h4>
                                                Reviewers
                                                <small><i class="fa fa-clock-o"></i> 2 days</small>
                                            </h4>
                                            <p>Why not buy a new awesome theme?</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="footer"><a href="#">See All Messages</a></li>
                        </ul>
                    </li>
                    <% } %>
                    <!-- Notifications: style can be found in dropdown.less -->
                    <% if (session.getAttribute("Rol").equals(1) || session.getAttribute("Rol").equals(3)) { %>
                    <li class="dropdown notifications-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-warning"></i>
                            <span class="label label-warning">5</span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="header">Tiene 5 Notificaciones</li>
                            <li>
                                <!-- inner menu: contains the actual data -->
                                <ul class="menu">
                                    <li>
                                        <a href="../Personal" class="text-center">Registro</a>
                                    </li>
                                    <!--
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-warning danger"></i> Very long description here that may not fit into the page and may cause design problems
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-users warning"></i> 5 new members joined
                                        </a>
                                    </li>

                                    <li>
                                        <a href="#">
                                            <i class="ion ion-ios7-cart success"></i> 25 sales made
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="ion ion-ios7-person danger"></i> You changed your username
                                        </a>
                                    </li>
                                    -->
                                </ul>
                            </li>
                            <li class="footer"><a href="#">Pemex</a></li>
                        </ul>
                    </li>
                    <% } %>
                    <!-- Tasks: style can be found in dropdown.less -->
                    <% if (session.getAttribute("Rol").equals(3)) { %>
                    <li class="dropdown tasks-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-tasks"></i>
                            <span class="label label-danger">9</span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="header">You have 9 tasks</li>
                            <li>
                                <!-- inner menu: contains the actual data -->
                                <ul class="menu">
                                    <li><!-- Task item -->
                                        <a href="#">
                                            <h3>
                                                Design some buttons
                                                <small class="pull-right">20%</small>
                                            </h3>
                                            <div class="progress xs">
                                                <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                    <span class="sr-only">20% Complete</span>
                                                </div>
                                            </div>
                                        </a>
                                    </li><!-- end task item -->
                                    <li><!-- Task item -->
                                        <a href="#">
                                            <h3>
                                                Create a nice theme
                                                <small class="pull-right">40%</small>
                                            </h3>
                                            <div class="progress xs">
                                                <div class="progress-bar progress-bar-green" style="width: 40%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                    <span class="sr-only">40% Complete</span>
                                                </div>
                                            </div>
                                        </a>
                                    </li><!-- end task item -->
                                    <li><!-- Task item -->
                                        <a href="#">
                                            <h3>
                                                Some task I need to do
                                                <small class="pull-right">60%</small>
                                            </h3>
                                            <div class="progress xs">
                                                <div class="progress-bar progress-bar-red" style="width: 60%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                    <span class="sr-only">60% Complete</span>
                                                </div>
                                            </div>
                                        </a>
                                    </li><!-- end task item -->
                                    <li><!-- Task item -->
                                        <a href="#">
                                            <h3>
                                                Make beautiful transitions
                                                <small class="pull-right">80%</small>
                                            </h3>
                                            <div class="progress xs">
                                                <div class="progress-bar progress-bar-yellow" style="width: 80%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                    <span class="sr-only">80% Complete</span>
                                                </div>
                                            </div>
                                        </a>
                                    </li><!-- end task item -->
                                </ul>
                            </li>
                            <li class="footer">
                                <a href="#">View all tasks</a>
                            </li>
                        </ul>
                    </li>
                    <% }%>
                    <!-- User Account: style can be found in dropdown.less -->
                    <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="glyphicon glyphicon-user"></i>
                            <span> <%= session.getAttribute("Usuario")%> <i class="caret"></i></span>
                        </a>
                        <ul class="dropdown-menu">
                            <!-- User image -->
                            <li class="user-header bg-light-blue">
                                <img src= <%= "img/avatar5.png"%>  class="img-circle" alt="User Image" />
                                <p>
                                    <%= session.getAttribute("Usuario")%> - <%= session.getAttribute("Tipo")%>
                                    <!--<small>Member since Nov. 2012</small>-->
                                </p>
                            </li>
                            <!-- Menu Body -->
                            <!--  <li class="user-body">
                                  <div class="col-xs-4 text-center">
                                      <a href="#">Followers</a>
                                  </div>
                                  <div class="col-xs-4 text-center">
                                      <a href="#">Sales</a>
                                  </div>
                                  <div class="col-xs-4 text-center">
                                      <a href="#">Friends</a>
                                  </div>
                              </li> -->
                            <!-- Menu Footer-->
                            <li class="user-footer">
                                <div class="pull-left">
                                    <!-- <a href="#" class="btn btn-default btn-flat">Profile</a>-->
                                </div>
                                <div class="pull-right">
                                    <a id="deslogin" href="#" class="btn btn-default btn-flat">Salir</a>
                                </div>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <div class="wrapper row-offcanvas row-offcanvas-left">
        <!-- Left side column. contains the logo and sidebar -->
        <aside class="left-side sidebar-offcanvas">
            <!-- sidebar: style can be found in sidebar.less -->
            <section class="sidebar">
                <!-- Sidebar user panel -->
                <div class="user-panel">
                    <div class="pull-left image">
                        <img src=<%= "img/avatar5.png"%> class="img-circle" alt="User Image" />
                    </div>
                    <div class="pull-left info">
                        <p>Hola, <%= session.getAttribute("Usuario")%></p>

                        <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                    </div>
                </div>

                <!-- sidebar menu: : style can be found in sidebar.less -->
                <ul class="sidebar-menu">
                    <!--
                    <li class="active">
                        <a href="index.html">
                            <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                        </a>
                    </li>
                    
                    <li>
                        <a href="pages/widgets.html">
                            <i class="fa fa-th"></i> <span>Widgets</span> <small class="badge pull-right bg-green">new</small>
                        </a>
                    </li>
                    <li class="treeview">
                        <a href="#">
                            <i class="fa fa-bar-chart-o"></i>
                            <span>Charts</span>
                            <i class="fa fa-angle-left pull-right"></i>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="pages/charts/morris.html"><i class="fa fa-angle-double-right"></i> Morris</a></li>
                            <li><a href="pages/charts/flot.html"><i class="fa fa-angle-double-right"></i> Flot</a></li>
                            <li><a href="pages/charts/inline.html"><i class="fa fa-angle-double-right"></i> Inline charts</a></li>
                        </ul>
                    </li>
                    <li class="treeview">
                        <a href="#">
                            <i class="fa fa-laptop"></i>
                            <span>UI Elements</span>
                            <i class="fa fa-angle-left pull-right"></i>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="pages/UI/general.html"><i class="fa fa-angle-double-right"></i> General</a></li>
                            <li><a href="pages/UI/icons.html"><i class="fa fa-angle-double-right"></i> Icons</a></li>
                            <li><a href="pages/UI/buttons.html"><i class="fa fa-angle-double-right"></i> Buttons</a></li>
                            <li><a href="pages/UI/sliders.html"><i class="fa fa-angle-double-right"></i> Sliders</a></li>
                            <li><a href="pages/UI/timeline.html"><i class="fa fa-angle-double-right"></i> Timeline</a></li>
                        </ul>
                    </li>
                    <li class="treeview">
                        <a href="#">
                            <i class="fa fa-edit"></i> <span>Forms</span>
                            <i class="fa fa-angle-left pull-right"></i>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="pages/forms/general.html"><i class="fa fa-angle-double-right"></i> General Elements</a></li>
                            <li><a href="pages/forms/advanced.html"><i class="fa fa-angle-double-right"></i> Advanced Elements</a></li>
                            <li><a href="pages/forms/editors.html"><i class="fa fa-angle-double-right"></i> Editors</a></li>
                        </ul>
                    </li> -->
                    <li class="treeview">
                        <a href="#">
                            <i class="fa fa-th-large"></i> <span> Planeación mensual SAP </span>

                        </a>
                        <ul class="treeview-menu">
                            <li><a id="tbl" href="#"><i class="fa fa-angle-double-right"></i> Todas las ordenes </a></li>
                            <li class="treeview">
                                <a href="#">
                                    <i class="fa fa-table"></i> <span>Estado sap</span>
                                    <i class="fa fa-angle-left pull-right"></i>
                                </a>
                                <ul class="treeview-menu">
                                  <!--  <li><a id="status_sap" href="#"><i class="fa fa-angle-double-right"></i> Estatus  SAP  <FECHA_TITULO%> </a></li> -->
                                    <li><a id="mixto_sap" href="#"><i class="fa fa-angle-double-right"></i> mixto SAP <%= FECHA_TITULO%>   </a></li>
                                    <% if (session.getAttribute("Rol").equals(1) || session.getAttribute("Rol").equals(3)) { %>
                                    <li>
                                        <a id="incertar_mixto" href="#">
                                            <i class="fa  fa-refresh"></i> <span>Ordenes mixtas</span>
                                            <small class="badge pull-right bg-red"></small>
                                        </a>
                                    </li>
                                    <% } %>
                                </ul>
                            </li>


                            <!--  <li><a href="pages/tables/data.html"><i class="fa fa-angle-double-right"></i> Data tables</a></li> -->
                            <!--- opciones del calendario -->
                            <li class="treeview">
                                <a href="#">
                                    <i class="fa fa-calendar"></i> <span>Calendarios</span>
                                    <i class="fa fa-angle-left pull-right"></i>
                                </a>
                                <ul class="treeview-menu">
                                    <% if (session.getAttribute("Rol").equals(1) || session.getAttribute("Rol").equals(4) || session.getAttribute("Rol").equals(3)) { %>
                                    <li><a id="calendario" href="#"><i class="fa fa-angle-double-right"></i> Original </a></li>
                                    <li><a id="editCal" href="#"><i class="fa fa-angle-double-right"></i> Modificable </a></li>
                                        <% } %>
                                    <li><a id="todosCal" href="#"><i class="fa fa-angle-double-right"></i> Planeación </a></li>
                                        <% if (session.getAttribute("Rol").equals(1) || session.getAttribute("Rol").equals(3)) { %>
                                    <li>
                                        <a id="incertar" href="#">
                                            <i class="fa  fa-refresh"></i> <span>Ordenes planeadas</span>
                                            <small class="badge pull-right bg-red"></small>
                                        </a>
                                    </li>
                                    <% } %>
                                </ul>
                            </li>

                            <!-- <li>
                                 <a id="" href="#">
                                     <i class="fa fa-calendar"></i> <span>Calendario</span>
                                     <small class="badge pull-right bg-red"></small>
                                 </a>
                             </li> --->

                        </ul>

                    </li>
                             
                    
                    
                    <li class="treeview">
                        <a id="conf" href="#">
                            <i class="glyphicon glyphicon-share-alt"></i> <span>Confiabilidad operacional</span>

                        </a>
                       
                    </li>
                    
                    
                     <% if (session.getAttribute("Rol").equals(1) || session.getAttribute("Rol").equals(3) ) { %>
                     
                     <li class="treeview">
                        <a  href="#">
                            <i class="glyphicon glyphicon-asterisk"></i> <span>Subsistema de administracion de seguridad de los procesos</span>

                        </a>
                        <ul class="treeview-menu">
                            
                            <li><a id="sub_proc" href="#"><i class="fa fa-angle-double-right"></i> sasp </a></li>
                            <li><a id="Edit_Sasp" href="#"><i class="fa  fa-refresh"></i> Actualizar </a></li>
                             
                        </ul>
                    </li>
                     
                     
                     
                     <% } %>
                      <% if (session.getAttribute("Rol").equals(4) || session.getAttribute("Rol").equals(2)  ) { %>
                    <li class="treeview">
                        <a id="sub_proc" href="#">
                            <i class="glyphicon glyphicon-share-alt"></i> <span>Subsistema de administracion de seguridad de los procesos</span>

                        </a>
                    </li>
                    <% } %>
                             
                     <li class="treeview">
                        <a  href="#">
                            <i class="glyphicon glyphicon-asterisk"></i> <span>CALIBRACIÓN DE VALVULAS PSV</span>

                        </a>
                        <ul class="treeview-menu">
                            
                            <li><a id="erm" href="#"><i class="fa fa-angle-double-right"></i> ERM'S </a></li>
                            <li><a id="erm_china" href="#"><i class="fa fa-angle-double-right"></i> Est. N° 3 CHINAMECA </a></li>
                             
                        </ul>
                    </li>
                    

                    

                    <!--
                    <li>
                        <a href="pages/mailbox.html">
                            <i class="fa fa-envelope"></i> <span>Mailbox</span>
                            <small class="badge pull-right bg-yellow">12</small>
                        </a>
                    </li>
                    <li class="treeview">
                        <a href="#">
                            <i class="fa fa-folder"></i> <span>Examples</span>
                            <i class="fa fa-angle-left pull-right"></i>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="pages/examples/invoice.html"><i class="fa fa-angle-double-right"></i> Invoice</a></li>
                            <li><a href="pages/examples/login.html"><i class="fa fa-angle-double-right"></i> Login</a></li>
                            <li><a href="pages/examples/register.html"><i class="fa fa-angle-double-right"></i> Register</a></li>
                            <li><a href="pages/examples/lockscreen.html"><i class="fa fa-angle-double-right"></i> Lockscreen</a></li>
                            <li><a href="pages/examples/404.html"><i class="fa fa-angle-double-right"></i> 404 Error</a></li>
                            <li><a href="pages/examples/500.html"><i class="fa fa-angle-double-right"></i> 500 Error</a></li>
                            <li><a href="pages/examples/blank.html"><i class="fa fa-angle-double-right"></i> Blank Page</a></li>
                        </ul>
                    </li> -->
                </ul>
            </section>
            <!-- /.sidebar -->
        </aside>

        <!-- Right side column. Contains the navbar and content of the page -->
        <aside class="right-side">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
                    Pemex
                    <small id="titl">Vista</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                    <li class="active">Dashboard</li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content">

              
   
                


            </section><!-- /.content -->
        </aside><!-- /.right-side -->
    </div><!-- ./wrapper -->

    <!-- add new calendar event modal -->


    <!-- jQuery 2.0.2 -->
    <a href="Manager/Manager.jsp"></a>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
    <!-- jQuery UI 1.10.3 -->
    <script src="js/jquery-ui-1.10.3.min.js" type="text/javascript"></script>
    <!-- printThis ----> 

    <script src="../sitio/js/printThis.js" type="text/javascript"></script>
    <script type="text/javascript">
        $("document").ready(function() {
            //$(".content").load("pages/tables/TablaDatos.jsp");
            $("#status_sap").click(function() {
                $(".content").load("pages/tables/TablaDatos.jsp");
                $("#titl").html("Estatus");
            });
            $("#calendario").click(function() {
                $(".content").load("pages/calendar.jsp");
                $("#titl").html("Inicio extremo --- Fin extremo");
            });
            $("#tbl").click(function() {
                $(".content").load("pages/tables/TablaTodo.jsp");
                $("#titl").html("TablaTodo");
            });

            $("#incertar").click(function() {
                $(".content").load("admin/Manager/Manager.jsp");
                $("#titl").html("Actualizar calendarios");
            });
             $("#incertar_mixto").click(function() {
                $(".content").load("admin/Manager/mixto/interfas.jsp");
                $("#titl").html("Actualizar mixto");
            });
            $("#editCal").click(function() {
                $(".content").load("admin/editCalendar.jsp");
                $("#titl").html("Edicion");
            });
            $("#mixto_sap").click(function() {
                $(".content").load("pages/tables/ordenesMixtas.jsp");
                $("#titl").html("Estatus");
            });
            $("#todosCal").click(function() {
                $(".content").load("pages/calendarTodos.jsp");
                $("#titl").html("Inicio extremo --- Fin extremo");
            });
            $("#sub_proc").click(function() {
                window.location="../PemexSASP-/";
            });
            $("#erm").click(function() {
                window.location="../Valvulas/ERMs.xhtml";
            });
             $("#erm_china").click(function() {
                window.location="../Valvulas/chinameca.xhtml";
            });
            
             $("#Edit_Sasp").click(function() {
                $(".content").load("admin/Manager/sasp/sasp.jsp");
                $("#titl").html("Actualizar sasp");
            });
            
            
           $("#conf").click(function(){
               window.location="pages/confiabilidad.jsp";
           });

            $("#deslogin").click(function() {

                window.location = "pages/Salir.jsp";

            });



        });
        

    </script>

    
   
    <script>
	function e(q) {
    document.body.appendChild( document.createTextNode(q) );
    document.body.appendChild( document.createElement("BR") );
}
function inactividad() {
      window.location ="pages/Salir.jsp";
   
}
var t=null;
function contadorInactividad() {
    t=setTimeout("inactividad()",1200000);
}
window.onblur=window.onmousemove=function() {
    if(t) clearTimeout(t);
    contadorInactividad();
}  
    </script>     
    <!-- Bootstrap -->
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <!-- Morris.js charts -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
    <script src="js/plugins/morris/morris.min.js" type="text/javascript"></script>
    <!-- Sparkline -->
    <script src="js/plugins/sparkline/jquery.sparkline.min.js" type="text/javascript"></script>
    <!-- jvectormap -->
    <script src="js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js" type="text/javascript"></script>
    <script src="js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js" type="text/javascript"></script>
    <!-- fullCalendar -->
    <script src="sitio/js/moment.min.js" type="text/javascript"></script>
    <script src="sitio/js/fullcalendar.js" type="text/javascript"></script>
    <script src="sitio/js/lang-all.js" type="text/javascript"></script>
    <!-- excel --->
    <script src="js/plugins/excel/jquery.battatech.excelexport.min.js" type="text/javascript"></script>
    <!-- jQuery Knob Chart -->
    <script src="js/plugins/jqueryKnob/jquery.knob.js" type="text/javascript"></script>
    <!-- daterangepicker -->
    <!--<script src="js/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>-->
    <script src="js/plugins/daterangepicker/jquery.daterangepicker.js" type="text/javascript"></script>
    <!-- Bootstrap WYSIHTML5 -->
    <script src="js/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js" type="text/javascript"></script>
    <!-- iCheck -->
    <script src="js/plugins/iCheck/icheck.min.js" type="text/javascript"></script>

    <!-- AdminLTE App -->
    <script src="js/AdminLTE/app.js" type="text/javascript"></script>

    <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
    <script src="js/AdminLTE/dashboard.js" type="text/javascript"></script>     
    <!-- DATA TABES SCRIPT -->
    <script src="js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
    <script src="js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="js/AdminLTE/demo.js" type="text/javascript"></script>
    

</body>
</html>
<% }%>