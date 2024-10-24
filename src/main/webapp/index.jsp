<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uva.inf.ssw.quickbook.modelo.Empresa"%>
<%@page import="uva.inf.ssw.quickbook.modelo.Cliente"%>

<!DOCTYPE html>
<html lang="es">
    <%
        Cliente cliente = (Cliente) session.getAttribute("cliente");
        Empresa empresa = (Empresa) session.getAttribute("empresa");
    %>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>QuickBook - Inicio</title>

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@300;400&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />

        <link rel="stylesheet" href="styles/comun.css">
        <link rel="stylesheet" href="styles/style.css">
        <link rel="stylesheet" href="styles/login-signup.css">

        <script src="script/script.js"></script>

        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js" type="text/javascript"></script>
        <script>
            $(function () {
                $.ajax({
                    url: "tipos",
                    method: "GET",
                    success: function (response) {
                        $("#tipoServicio").html(response);
                    }
                });
                return(false);
            });
        </script>
    </head>

    <body class="bodyheader">

        <%@ include file="includes/registro_y_login.jsp" %>

        <%@ include file="includes/cabecera.jsp" %>

        <div>
            <img src ="img/imagenFondo.jpeg" alt="imagenFondo" id="imagenFondo">

            <form action="servicios" method="get">
                <div class="container"> <!--Contenedor ubicacion-->
                    <label for="ubicacion">Selecciona tu ubicación</label>
                    <input type="text" id="ubicacion" name="ubicacion" placeholder="ej. Calle Alcalá 48, Valladolid">
                    <a href="#" class="ubicacion_actual">Usar ubicación actual</a>
                </div>

                <div class="container"> <!--Contenedor Servicios-->
                    <label for="tipoServicio">Selecciona el servicio deseado:</label>
                    <select id="tipoServicio" name="tipoServicio">

                    </select>
                    <div>
                        <button  id="botonbusqueda" type="submit">Buscar</button>
                    </div>
                </div>
            </form>
            
        </div> 
    </body>
</html>