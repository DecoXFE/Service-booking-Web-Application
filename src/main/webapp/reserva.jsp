<%@page language="java"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="uva.inf.ssw.quickbook.modelo.Empresa"%>
<%@page import="uva.inf.ssw.quickbook.modelo.Cliente"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>

<!DOCTYPE html>
<html lang="es">
    <%
        Cliente cliente = (Cliente) session.getAttribute("cliente");
        Empresa empresa = (Empresa) session.getAttribute("empresa");
        Empresa servicio = (Empresa) session.getAttribute("servicio");
        String idServicio = (String) session.getAttribute("idServicio");
    %>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>QuickBook - Reserva</title>

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@300;400&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
        <link rel="stylesheet" href="styles/comun.css">
        <link rel="stylesheet" href="styles/reserva.css">
        <link rel="stylesheet" href="styles/login-signup.css">

        <script src="script/script.js"></script>
        <script src="script/reserva.js" defer></script>
    </head>

    <body class="bodyheader noSelect">         

        <%@include file="includes/cabecera.jsp"%>

        <div class="banner"><img src="fondo?idUsuario=<%=idServicio%>" alt="Banner"></div>

        <div class="container1">
            <h1 class="headerR"><%=servicio.getNombre()%> - Reserva</h1>
            <div class="chooseDate">Escoge un dia de los disponibles:

                <div class="calendario">
                    <div class="wrapper">
                        <header class ="header">
                            <p class="current-date"></p>
                            <div class="icons">
                                <span id="prev" class="material-symbols-rounded"><</span>
                                <span id="next" class="material-symbols-rounded">></span>
                            </div>
                        </header>
                        <div class="calendar">
                            <ul class="weeks">
                                <li>Dom</li>
                                <li>Lun</li>
                                <li>Mar</li>
                                <li>Mie</li>
                                <li>Jue</li>
                                <li>Vie</li>
                                <li>Sab</li>
                            </ul>
                            <ul class="days"></ul>
                        </div>
                    </div>
                </div>
                <div class="horasDisp">
                    <p class ="textHoras"></p>
                    <div class="horasDispL">
                        <ul>
                            <!--selección de horas -->
                            <li>10:00</li>
                            <li>10:30</li>
                            <li class="horaSelec">12:00</li>
                            <li>15:00</li>
                            <li>15:30</li>
                            <li>16:30</li>
                            <li>17:00</li>
                        </ul>
                    </div>
                </div>
                <div class="confReserva"><button>Confirmar Reserva</button></div>
            </div>

    </body>

</html>       