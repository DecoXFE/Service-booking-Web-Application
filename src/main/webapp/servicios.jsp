<%@page language="java"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="uva.inf.ssw.quickbook.modelo.Empresa"%>
<%@page import="uva.inf.ssw.quickbook.modelo.Cliente"%>
<%@page import="uva.inf.ssw.quickbook.modelo.Direccion"%>

<!DOCTYPE html>
<html>
    <%
        Cliente cliente = (Cliente) session.getAttribute("cliente");
        Empresa empresa = (Empresa) session.getAttribute("empresa");
        Direccion direccion = (Direccion) session.getAttribute("direccion");
        ArrayList<Empresa> servicios = (ArrayList<Empresa>) session.getAttribute("servicios");
        String tipoServicio = (String) session.getAttribute("tipoServicio");
    %>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quickbook - Búsqueda de servicios</title>

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@300;400&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />

        <link rel="stylesheet" href="styles/comun.css">
        <link rel="stylesheet" href="styles/servicios.css">
        <link rel="stylesheet" href="styles/login-signup.css">
        <script src="script/script.js"></script>
    </head>

    <body>

        <%@ include file="includes/registro_y_login.jsp" %>

        <%@ include file="includes/cabecera.jsp" %>

        <main>
            <div id="filtros">
                <div id="titulo">
                    <h2>Filtros</h2>
                    <button>Quitar filtros</button>
                </div>
                <div id="lista-filtros">
                    <div class="categoria">
                        <div class="filtro-cab">
                            <button class="expand"><span>Distancia</span><span class="icon-expand">-</span></button>
                        </div>
                        <div class="filtro-cont">
                            <span>0</span>
                            <input type="range" min="0" max="1000" step="100">
                            <span>1000</span>
                        </div>
                    </div>
                    <div class="categoria">
                        <div class="filtro-cab">
                            <button class="expand"><span>Precio</span><span class="icon-expand">-</span></button>
                        </div>
                        <div class="filtro-cont">
                            <span>0</span>
                            <input type="range" min="0" max="500" step="10">
                            <span>500</span>
                        </div>
                    </div>
                    <div class="categoria">
                        <div class="filtro-cab">
                            <button class="expand"><span>Puntuación</span><span class="icon-expand">-</span></button>
                        </div>
                        <div class="filtro-cont">
                            <div id="radio-puntuacion">
                                <div>
                                    <input type="radio" id="gt25" name="puntuacion" value="gt25">
                                    <label for="gt25">&gt;25%</label>
                                </div>
                                <div>
                                    <input type="radio" id="gt50" name="puntuacion" value="gt50">
                                    <label for="gt50">&gt;50%</label>
                                </div>
                                <div>
                                    <input type="radio" id="gt75" name="puntuacion" value="gt75">
                                    <label for="gt75">&gt;75%</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="categoria">
                        <div class="filtro-cab">
                            <button class="expand"><span>Ofertas</span><span class="icon-expand">-</span></button>
                        </div>
                        <div class="filtro-cont">
                            <input type="checkbox" name="oferta" id="oferta">
                            <label for="oferta">Mostrar solo ofertas</label>
                        </div>
                    </div>
                </div>
            </div>

            <div id="resultados">
                <h1><%=tipoServicio%> en tu zona: <a href="#">Cambiar dirección</a></h1>
                <div id="servicios">

                    <% for (Empresa s : servicios) {%>
                    <div class="bloque-servicio">
                        <div class="presentacion-cab">
                            <div class="favorito">
                                <button class="boton-favorito"><img class="img-estrella" src="img/star_1.png" alt=""></button>
                            </div>
                            <div class="nombre-negocio">
                                <h3><a href="servicio?idServicio=<%=s.getIdUsuario()%>"><%=s.getNombre()%></a></h3>
                            </div>
                        </div>
                        <div class="presentacion-cuerpo">
                            <div class="servicio-c1">
                                <img src="icono?idUsuario=<%=s.getIdUsuario()%>" alt="Icono de la empresa">
                            </div>
                            <div class="servicio-c2">
                                <div class="descripcion">
                                    <p><%=s.getDescripcion()%></p>
                                    <%String nombreCalle = s.getDireccion().getDireccion();%>
                                    <p><%=nombreCalle%></p>
                                    <p><%=s.getPrecioMin()%>€ - <%=s.getPrecioMax()%>€</p>
                                </div>
                                <div class="informacion">
                                    <a href="servicio?idServicio=<%=s.getIdUsuario()%>">Más información</a>
                                </div>
                            </div>
                            <div class="servicio-c3">
                                <div class="puntuacion">Puntuación: <%=s.getPuntuacion()%>%</div>
                                <%
                                    int distancia;
                                    if (direccion == null) {
                                        distancia = 0;
                                    } else {
                                        distancia = direccion.getDistancia(s.getDireccion());
                                    }
                                %>
                                <div class="distancia">Distancia: <%=distancia%> m</div>
                                <div class="reserva">
                                    <% if (cliente != null) {%>
                                    <a href="reserva?idServicio=<%=s.getIdUsuario()%>">
                                        <button>Reserva ya</button>
                                    </a>
                                    <% } else if (empresa != null) {%>
                                    <!-- Si está logeado como empresa no puede hacer reserva -->
                                    <% } else { %>
                                    <a onclick="mostrarLogin()">
                                        <button>Reserva ya</button>
                                    </a>
                                    <% }%>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%}%>

                </div>

            </div>

        </main>

    </body>

</html>