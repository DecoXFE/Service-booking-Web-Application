<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="uva.inf.ssw.quickbook.modelo.Empresa"%>

<%
    Empresa servicio = (Empresa) session.getAttribute("servicio");
%>

<div id="caja-descripcion">
    <div id="descripcion-cabeza">
        <div id="icono-titulo">
            <img src="icono?idUsuario=<%=servicio.getIdUsuario()%>" alt="Icono de la empresa">
            <h1><%=servicio.getNombre()%></h1>
        </div>
        <div id="puntuacion"><p><b>Puntuación:</b> <%=servicio.getPuntuacion()%>%</p></div>
    </div>
    <div>
        <div>
            <h2>Descripción:</h2>
            <p><%=servicio.getDescripcion()%></p>
        </div>
        <div>
            <h3>Dirección:</h3>
            <p><%=servicio.getDireccion().getDireccion()%></p>
        </div>
        <div>
            <h3>Información de contacto:</h3>
            <p>Correo electrónico: <%=servicio.getCorreo()%></p>
            <p>Teléfono: <%=servicio.getTelefono()%></p>
        </div>
    </div>
</div>

<div id="caja-horario-precio">
    <div id="caja-horarios">
        <h2>Horario de atención</h2>
        <table class="horario">
            <%
                HashMap<String, String> horarios = servicio.getHorarios();
            %>
            <tr>
                <th>Día</th>
                <th>Horario</th>
            </tr>
            <tr>
                <td>Lunes</td>
                <td><%=horarios.get("Lunes")%></td>
            </tr>
            <tr>
                <td>Martes</td>
                <td><%=horarios.get("Martes")%></td>
            </tr>
            <tr>
                <td>Miércoles</td>
                <td><%=horarios.get("Miércoles")%></td>
            </tr>
            <tr>
                <td>Jueves</td>
                <td><%=horarios.get("Jueves")%></td>
            </tr>
            <tr>
                <td>Viernes</td>
                <td><%=horarios.get("Viernes")%></td>
            </tr>
            <tr>
                <td>Sábado</td>
                <td><%=horarios.get("Sábado")%></td>
            </tr>
            <tr>
                <td>Domingo</td>
                <td><%=horarios.get("Domingo")%></td>
            </tr>
        </table>
        <div class="imagenHorario"><img src ="img/reloj.png" alt="imagenHorario"></div>
    </div>
    <div id="caja-precios">
        <h2>Precios</h2>
        <ul>
            <%
                HashMap<String, Float> servicios = servicio.getServicios();
                for (Map.Entry<String, Float> entry : servicios.entrySet()) {
                    String clave = entry.getKey();
                    Float valor = entry.getValue();
            %>
            <li><%=clave%>: <%=valor%>€</li>
                <%}%>
        </ul>
        <div class="imagenDinero"><img src ="img/precio.png" alt="imagenDinero"></div>
    </div>
</div>