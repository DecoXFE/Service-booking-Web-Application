<%@page import="java.util.Map"%>
<%@page import="uva.inf.ssw.quickbook.modelo.Direccion"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uva.inf.ssw.quickbook.modelo.Empresa"%>
<%@page import="uva.inf.ssw.quickbook.modelo.Cliente"%>
<%@page import="java.util.HashMap"%>

<!DOCTYPE html>
<html>
    <%
        Cliente cliente = (Cliente) session.getAttribute("cliente");
        Empresa empresa = (Empresa) session.getAttribute("empresa");
        Direccion direccion = (Direccion) session.getAttribute("direccion");
        String tipoServicio = (String) session.getAttribute("tipoServicio");
        Empresa servicio = (Empresa) session.getAttribute("servicio");
        String idServicio = (String) session.getAttribute("idServicio");
        boolean isPublicado = empresa.isPublicado();
    %>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>QuickBook - Perfil negocio</title>

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@300;400&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
        <link rel="stylesheet" href="styles/comun.css">
        <link rel="stylesheet" href="styles/pagina_perfil.css">

    </head>

    <body class ="bodyheader noSelect">

        <%@ include file="includes/cabecera.jsp" %>

        <!-- Contenedor del menú y del contenido -->
        <div class="container">
            <!-- Menú -->
            <ul class="menu">
                <li onclick="manejarOpcionMenu('editarCuenta')">Editar cuenta</li>
                <li onclick="manejarOpcionMenu('gestionarReservas')">Gestionar reservas</li>
                <li id="anadirAnuncioMenu" onclick="manejarOpcionMenu('anadirAnuncioContenido')">Añadir Anuncio</li>
                <li id="editarAnuncioMenu" onclick="manejarOpcionMenu('editarAnuncioContenido')">Editar anuncio</li>
                <li onclick="manejarOpcionMenu('responderResenas')">Responder reseñas</li>
                <li onclick="manejarOpcionMenu('cerrarSesion')">Cerrar sesión</li>
            </ul>
        </div>

        <!-- Contenido dinámico -->
        <div class="contenido">
            <div id="editarCuenta" style="display: none;">
                <!-- Contenido para la opción 'Editar cuenta' -->
                <form action="EditarCuentaEmpresaServlet" method="post" enctype="multipart/form-data">
                    <!-- Agrega aquí los campos y elementos necesarios para editar el negocio -->
                    <label for="nombre">Nombre de la empresa:</label>
                    <input maxlength="30" type="text" id="nombre" name="nombre-empresa" value="<%=empresa.getNombre()%>" required>

                    <label for="idusuario">ID Usuario:</label>
                    <input maxlength="20" type="text" id="idUsuario" name="idUsuario-empresa" value="<%=empresa.getIdUsuario()%>" required readonly>

                    <label for="email">Correo electrónico:</label>
                    <input maxlength="50" type="email" id="email" name="email-empresa" value="<%=empresa.getCorreo()%>" required>

                    <label for="password">Contraseña:</label>
                    <input maxlength="20" type="password" id="password" name="password-empresa" value="<%=empresa.getContraseña()%>" required>

                    <label for="telefono">Teléfono:</label>
                    <input maxlength="15" type="tel" id="phone" name="phone-empresa" value="<%=empresa.getTelefono()%>" required>

                    <label for="iban">IBAN:</label>
                    <input maxlength="24" type="text" id="iban" name="iban-empresa" value="<%=empresa.getIban()%>" required>

                    <button type="submit">Guardar cambios</button>
                </form>
            </div>
                    
            <div id="gestionarReservas" style="display: none;">
                <!-- Contenido para la opción 'Gestionar reservas' -->
            </div>

            <div id="anadirAnuncioContenido" style="display: none;">
                <!-- Contenido para la opción 'Añadir Anuncio' -->
                <form  action="AnadirAnuncioServlet" method="post" enctype="multipart/form-data">
                    <label for="tipoServicio">Tipo de servicio:</label>
                    <input maxlength="20" type="text" id="tiposervicio" name="servicio-empresa" placeholder="Introduzca el tipo de servicio" required>

                    <label for="descripcion">Descripción:</label>
                    <textarea maxlength="500" id="descripcion" name="descripcion-empresa" maxlength="500" placeholder="Introduzca descripción"></textarea>

                    <label for="iban">IBAN:</label>
                    <input maxlength="24" type="text" id="iban" name="iban-empresa" placeholder="Introduzca el IBAN" required>

                    <label for="direccion">Dirección:</label>
                    <input maxlength="50" type="text" id="direccion" name="direccion-empresa" placeholder="Introducir dirección" required>

                    <label for="horarioL">Horario Lunes:</label>
                    <input maxlength="30" type="text" id="horarioL" name="horarioL-empresa" placeholder="Introducir horario del lunes" required>
                    <label for="horarioM">Horario Martes:</label>
                    <input maxlength="30" type="text" id="horarioM" name="horarioM-empresa" placeholder="Introducir horario del martes" required>
                    <label for="horarioMi">Horario Miércoles:</label>
                    <input maxlength="30" type="text" id="horarioMi" name="horarioMi-empresa" placeholder="Introducir horario del miércoles" required>
                    <label for="horarioJ">Horario Jueves:</label>
                    <input maxlength="30" type="text" id="horarioJ" name="horarioJ-empresa" placeholder="Introducir horario del jueves" required>
                    <label for="horarioV">Horario Viernes:</label>
                    <input maxlength="30" type="text" id="horarioV" name="horarioV-empresa" placeholder="Introducir horario del viernes" required>
                    <label for="horarioS">Horario Sábado:</label>
                    <input maxlength="30" type="text" id="horarioS" name="horarioS-empresa" placeholder="Introducir horario del sábado" required>
                    <label for="horarioD">Horario Domingo:</label>
                    <input maxlength="30" type="text" id="horarioD" name="horarioD-empresa" placeholder="Introducir horario del domingo" required>


                    <div id="serviciosContainer">

                    </div>

                    <div class="button-container">
                        <button type="button" onclick="agregarCampoServicio()">Agregar otro servicio</button>
                        <button type="button" onclick="eliminarCampoServicioAnadir()">Eliminar servicio</button>
                        <button type="submit">Enviar</button>
                    </div>
                </form>
            </div>

            <c:if test="${isPublicado}">
                <div id="editarAnuncioContenido" style="display: none;">
                    <!-- Contenido para la opción 'Editar anuncio' -->
                    <%
                        HashMap<String, String> horarios = empresa.getHorarios();
                    %>
                    <form action="EditarAnuncioServlet" method="post" enctype="multipart/form-data">
                        <label for="tipoServicio">Tipo de servicio:</label>
                        <input maxlength="20" type="text" id="tiposervicio" name="servicio-empresa" value="<%=empresa.getTipoServicio()%>" required>

                        <label for="descripcion">Descripción:</label>
                        <textarea maxlength="500" id="descripcion" name="descripcion-empresa" maxlength="500" value="<%=empresa.getDescripcion()%>" required></textarea>

                        <label for="iban">IBAN:</label>
                        <input maxlength="24" type="text" id="iban" name="iban-empresa" value="<%=empresa.getIban()%>" required>

                        <label for="direccion">Dirección:</label>
                        <input maxlength="50" type="text" id="direccion" name="direccion-empresa" value="<%=empresa.getDireccion().getDireccion()%>" required>

                        <label for="horarioL">Horario Lunes:</label>
                        <input maxlength="30" type="text" id="horarioL" name="horarioL-empresa" value="<%=horarios.get("Lunes")%>" required>
                        <label for="horarioM">Horario Martes:</label>
                        <input maxlength="30" type="text" id="horarioM" name="horarioM-empresa" value="<%=horarios.get("Martes")%>" required>
                        <label for="horarioMi">Horario Miércoles:</label>
                        <input maxlength="30" type="text" id="horarioMi" name="horarioMi-empresa" value="<%=horarios.get("Miércoles")%>" required>
                        <label for="horarioJ">Horario Jueves:</label>
                        <input maxlength="30" type="text" id="horarioJ" name="horarioJ-empresa" value="<%=horarios.get("Jueves")%>" required>
                        <label for="horarioV">Horario Viernes:</label>
                        <input maxlength="30" type="text" id="horarioV" name="horarioV-empresa" value="<%=horarios.get("Viernes")%>" required>
                        <label for="horarioS">Horario Sábado:</label>
                        <input maxlength="30" type="text" id="horarioS" name="horarioS-empresa" value="<%=horarios.get("Sábado")%>" required>
                        <label for="horarioD">Horario Domingo:</label>
                        <input maxlength="30" type="text" id="horarioD" name="horarioD-empresa" value="<%=horarios.get("Domingo")%>" required>

                        <div id="serviciosContainer2">
                            <%
                                HashMap<String, Float> servicios = empresa.getServicios();
                                int contador = 0; // Contador para generar un índice único para cada par servicio-precio
                                for (Map.Entry<String, Float> entry : servicios.entrySet()) {
                                    String clave = entry.getKey();
                                    Float valor = entry.getValue();
                                    String servicioName = "servicio_" + contador; // Nombre del input para el servicio
                                    String precioName = "precio_" + contador; // Nombre del input para el precio
                            %>
                            <div class="servicio">
                                <label for="<%= servicioName%>">Servicio <%= contador%>:</label>
                                <input type="text" id="<%= servicioName%>" name="<%= servicioName%>" value="<%= clave%>" readonly>

                                <label for="<%= precioName%>">Precio <%= contador%>:</label>
                                <input type="text" id="<%= precioName%>" name="<%= precioName%>" value="<%= valor%>" required>
                            </div>
                            <%
                                    contador++;
                                }
                            %>


                        </div>

                        <div class="button-container2">
                            <button type="button" onclick="agregarCampoServicioEditar()">Agregar otro servicio</button>
                            <button type="submit">Enviar</button>
                        </div>
                    </form>

                </div>
            </c:if>
                            
            <div id="responderResenas" style="display: none;">
                <!-- Contenido para la opción 'Responder reseñas' -->
            </div>

            <div id="cerrarSesion" style="display: none;">
                <!-- Contenido para la opción 'Administrar cobros' -->
            </div>
        </div>

        <div class="container2" id="mensajeBienvenida">
            Hola, <%=empresa.getNombre()%>.
            <div>¿Qué deseas realizar?</div>
        </div>

        <script src="script/perfil_empresa.js"></script>
        <script src="script/perfil_empresa2.js"></script>

        <script>
                        // Variable JavaScript con el valor de empresa.isPublicado().
                        var isPublicado = <%= empresa.isPublicado()%>;

                        // Llama a una función del archivo JavaScript externo y pasa el valor de isPublicado.
                        manejarVisibilidadElementos(isPublicado);
        </script>

        <script>
            window.addEventListener('DOMContentLoaded', function () {
                agregarCampoServicio();
            });
        </script>



    </body>
</html>
