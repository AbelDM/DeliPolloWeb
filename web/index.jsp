<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.*" %>

<%@page session="true"%>
<%
    String usu = "";
    String nom = "";
    HttpSession sesionOK = request.getSession();

    if (sesionOK.getAttribute("perfil") != null) {
        nom = (String) sesionOK.getAttribute("nom") + " " + (String) sesionOK.getAttribute("ape");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DeliPollo Delivery</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/estilos.css">
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/flaticon.css"> 
    </head>
    <body>

        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">DeliPollo Logo</a>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li><a href="index.jsp">Catálogo</a></li>
                            <%
                                if (sesionOK.getAttribute("perfil") != null && sesionOK.getAttribute("perfil").equals("Admin")) {
                            %>
                        <li><a href="registrarProducto.jsp">Registrar Producto</a></li>
                            <%
                                }
                                if (sesionOK.getAttribute("perfil") != null) {
                            %>
                        <li><a href="registrarPedido.jsp">Registrar pedidos</a></li>
                            <%
                                }
                                if (sesionOK.getAttribute("perfil") != null && sesionOK.getAttribute("perfil").equals("Admin")) {
                            %>
                        <li><a href="ServletControlador?accion=MostrarPedidos">Consultar Pedidos</a></li>
                            <%
                                }
                            %>
                            <%if (sesionOK.getAttribute("perfil") != null) {
                            %>
                        <li><a href="ServletLogueo?accion=cerrar">Cerrar Sesión</a></li>
                            <%
                                }
                            %>
                    </ul>      
                    <ul class="nav navbar-nav navbar-right">
                        <%if (sesionOK.getAttribute("perfil") != null) {
                        %>
                        <li><%out.println("Bienvenido : " + nom);%>
                        </li>
                        <%
                            }
                        %>

                        <%
                            if (sesionOK.getAttribute("perfil") == null) {
                        %>
                        <li><a href="login.jsp">Iniciar Sesion</a></li>
                            <% } %>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- STAR SLIDER -->
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="jumbotron">
                        <h1>DeliPollo</h1>
                        <p>Delivery</p>
                        <p>Grupo 5</p>
                    </div>
                </div>
            </div>
        </div>
        <!-- END SLIDER -->     


        <!-- STAR PRODUCTO -->
        <section id="producto">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="titulo">
                            <h2>Catalogo de Productos</h2>
                            <div class="hr"></div>
                        </div>
                    </div>


                    <%
                        ArrayList<Producto> lista = ProductoDB.obtenerProducto();

                        for (Producto p : lista) {
                    %>
                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail text-center">                            
                            <img src="img/<%=p.getImagen()%>" class="img-responsive" alt="">                                                                                         
                            <div class="caption">
                                <h4 class="pull-right precio"><%= p.getPrecio()%></h4>
                                <h4><a href="#"><%= p.getNombre()%></a>
                                </h4>

                                <%
                                    if (sesionOK.getAttribute("perfil") != null && sesionOK.getAttribute("perfil").equals("Admin")) {
                                %>
                                <a class="btn btn-primary" href="actualizarProducto.jsp?id=<%= p.getCodigoProducto()%>">MODIFICAR</a> 
                                <%
                                    }
                                %>
                                <a class="btn btn-primary" href="anadirCarrito.jsp?id=<%= p.getCodigoProducto()%>">ORDENAR</a>
                            </div>                                
                        </div>
                    </div>
                    <%
                        }
                    %>


                </div>
            </div>
        </section>

    </main> 
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/owl.carousel.js"></script>
    <script src="js/code.js"></script>

</body>
</html>
