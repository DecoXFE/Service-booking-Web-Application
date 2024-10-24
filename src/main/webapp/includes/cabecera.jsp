<header>
    <nav>
        <a href="index.jsp" class="logo"><img src="img/logo_quickbook.png" alt="Logo de Quickbook" class="logo"></a>
        <div class="right">

            <% if (cliente != null) {%>
            <div class="cont-profile">
                <a href="pagina_perfil_cliente.jsp">
                    <img src="icono?idUsuario=<%=cliente.getIdUsuario()%>" alt="Icono del usuario" class="profile">
                </a>
            </div>
            <% } else if (empresa != null) {%>
            <div class="cont-profile">
                <a href="pagina_perfil_empresa.jsp">
                    <img src="icono?idUsuario=<%=empresa.getIdUsuario()%>" alt="Icono del usuario" class="profile">
                </a>
            </div>
            <% } else { %>

            <a href="#" id="neg" onclick="mostrarSignUpEmpresa()">Añade tu negocio</a>
            <div class="cont-profile">
                <a onclick="mostrarLogin()">
                    <img src="img/profileIcon.png" alt="Icono del usuario" class="profile">
                </a>
            </div>
            <% }%>

        </div>
    </nav>
</header>