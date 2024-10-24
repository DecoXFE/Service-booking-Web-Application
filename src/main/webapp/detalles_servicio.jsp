<%@page language="java"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uva.inf.ssw.quickbook.modelo.Empresa"%>
<%@page import="uva.inf.ssw.quickbook.modelo.Cliente"%>

<!DOCTYPE html>
<html lang="es">
    <%
        Cliente cliente = (Cliente) session.getAttribute("cliente");
        Empresa empresa = (Empresa) session.getAttribute("empresa");
        String idServicio = (String) session.getAttribute("idServicio");
    %>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>QuickBook - Detalles del negocio</title>

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@300;400&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />

        <link rel="stylesheet" href="styles/comun.css">
        <link rel="stylesheet" href="styles/detalles_servicio.css">
        <link rel="stylesheet" href="styles/login-signup.css">

        <script src="script/script.js"></script>

        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function () {
                var jContent = $("#contenido");
                $(".boton-seleccion").click(function () {
                    var jLink = $(this);
                    $.ajax({
                        url: jLink.attr("href"),
                        type: "get",
                        dataType: "html",

                        success: function (strData) {
                            jContent.html(strData);
                        }
                    });
                    return(false);
                });
            });
        </script>
    </head>

    <body class="bodyheader">

        <%@include file="includes/registro_y_login.jsp"%>

        <%@include file="includes/cabecera.jsp"%>

        <div class="imagen-fondo">
            <img src="fondo?idUsuario=<%=idServicio%>" alt="Imagen de fondo">
        </div>

        <div id="cajas">
            <div id="boton-reserva" class="reserva">
                <% if (cliente != null) {%>
                <a href="reserva?idServicio=<%=idServicio%>">
                    <button>Reservar</button>
                </a>
                <% } else if (empresa != null) {%>
                <!-- Si está logeado como empresa no puede hacer reserva -->
                <% } else { %>
                <a onclick="mostrarLogin()">
                    <button>Reservar</button>
                </a>
                <% }%>
            </div>

            <div id="caja-botones-seleccion">
                <button class="boton-seleccion" id="detalles" href="includes/tab_detalles.jsp">Detalles</button>
                <button class="boton-seleccion" id="comentarios" href="includes/tab_comentarios.jsp">Comentarios</button>
            </div>

            <div id="contenido">
                <%@include file="includes/tab_detalles.jsp"%>
            </div>

        </div>

    </body>
</html>

