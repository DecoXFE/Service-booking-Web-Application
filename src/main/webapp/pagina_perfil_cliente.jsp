<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uva.inf.ssw.quickbook.modelo.Empresa"%>
<%@page import="uva.inf.ssw.quickbook.modelo.Cliente"%>

<!DOCTYPE html>
<html>
    <%
        Cliente cliente = (Cliente) session.getAttribute("cliente");
        Empresa empresa = (Empresa) session.getAttribute("empresa");
    %>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>QuickBook - Perfil cliente</title>

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@300;400&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
        <script src="script/script.js"></script>
        <link rel="stylesheet" href="styles/comun.css">
        <link rel="stylesheet" href="styles/pagina_perfil_cliente.css">
    </head>
    <body class ="bodyheader noSelect">

        <%@ include file="includes/cabecera.jsp" %>

        <div class="container">
            <ul class="menu">
                <li><button onclick="editarPerfil()">Editar perfil</button></li>
                <li><button onclick="gestionarReservas()">Gestionar Reservas</button></li>
                <li><button onclick="favoritos()">Mis Favoritos</button></li>
                <li><button onclick="dejarReseña()">Dejar una Reseña</button></li>
                <li><button onclick="cerrarSesion()">Cerrar Sesion</button></li>  
            </ul>
        </div>
        <div class="contenido">
            <div id="editarPerfil" style="display: none;">
                <!-- Contenido para la opción 'Editar cuenta' -->
                <form action="EditarCuentaClienteServlet" method="post" enctype="multipart/form-data">
                    <!-- Agrega aquí los campos y elementos necesarios para editar el negocio -->
                    <label for="nombre">Nombre del cliente:</label>
                    <input maxlength="30" type="text" id="nombre" name="nombre-empresa" value="<%=cliente.getNombre()%>" required>

                    <label for="idusuario">ID Usuario:</label>
                    <input maxlength="20" type="text" id="idUsuario" name="idUsuario-empresa" value="<%=cliente.getIdUsuario()%>" required readonly>

                    <label for="email">Correo electrónico:</label>
                    <input maxlength="50" type="email" id="email" name="email-empresa" value="<%=cliente.getCorreo()%>" required>

                    <label for="password">Contraseña:</label>
                    <input maxlength="20" type="password" id="password" name="password-empresa" value="<%=cliente.getContraseña()%>" required>


         

                    <button type="submit">Guardar cambios</button>
                </form>
            </div>

        <div class="container2">Hola, <%=cliente.getNombre()%> <%=cliente.getApellidos()%>.
            <div>¿Qué deseas realizar?</div>
        </div>
            
            <script src="script/script.js"></script>

    </body>
</html>
