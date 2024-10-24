<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="uva.inf.ssw.quickbook.modelo.Comentario"%>
<%@page import="uva.inf.ssw.quickbook.modelo.Empresa"%>

<%
    Empresa servicio = (Empresa) session.getAttribute("servicio");

    ArrayList<Comentario> comentarios = servicio.getComentarios();

    for (Comentario c : comentarios) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
        LocalDateTime fecha = c.getFecha();
        String fechaFormateada = fecha.format(formatter);
%>
<div id='caja-comentario'>
    <div id='c1-comentario'>
        <div id='f1-comentario'>
            <img id='icono-cliente' src="icono?idUsuario=<%=c.getCliente()%>" alt="Icono del cliente">
            <div id='info-cliente'>
                <p><%=fechaFormateada%></p>
                <p><%=c.getCliente()%></p>
            </div>
        </div>
        <div id='texto-comentario'>
            <p><%=c.getComentario()%></p>
        </div>
    </div>
    <%if (c.isVoto()) {%>
    <div id='c2-comentario'>
        <img src="img/like.jpg" alt="Like">
        <p>Recomendado</p>
    </div>
    <%} else {%>
    <div id='c2-comentario'>
        <img src="img/dislike.jpg" alt="Dislike">
        <p>No recomendado</p>
    </div>
    <%}%>
</div>
<%
    }
%>