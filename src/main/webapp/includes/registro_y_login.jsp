<!-- Fondo difuminado y cuadro flotante para iniciar sesión -->
<div class="modal-background" id="modalBackground"></div>
<div class="modal" id="modalLogin">
    <div class="modal-header">
        <h2>Iniciar sesión en QuickBook</h2>
        <span class="close" onclick="cerrarModal()">×</span>
    </div>
    <div class="modal-body">
        <form action="inicioSesion" method="post">
            <div class="input-container">
                <label for="username" class="fas fa-user"></label>
                <input type="text" id="username" name="username" placeholder="Usuario" required>
            </div>
            <div class="input-container">
                <label for="password" class="fas fa-lock"></label>
                <input type="password" id="password" name="password" placeholder="Contraseña" required>
            </div>
            <input type="submit" class="boton" value="Iniciar sesión">
        </form>
        <div class="modal-footer">
            <p>¿No tienes una cuenta? <a href="#" onclick="mostrarSignUp()">Regístrate aquí</a></p>
        </div>
    </div>
</div>

<!-- Fondo difuminado y cuadro flotante para registrarse -->
<div class="modal-background" id="modalBackground"></div>
<div class="modal" id="modalSignUp">
    <div class="modal-header">
        <h2>Registrarse en QuickBook</h2>
        <span class="close" onclick="cerrarModal()">×</span>
    </div>
    <div class="modal-body">
        <form action="registroCliente" method="post">
            <div class="input-container">
                <label for="nombreC"><i class="fas fa-user"></i></label>
                <input maxlength="30" type="text" id="nombreC" name="nombreC" placeholder="Nombre" required>
            </div>

            <div class="input-container">
                <label for="apellidosC"><i class="fas fa-user-tie"></i></label>
                <input maxlength="30" type="text" id="apellidosC" name="apellidosC" placeholder="Apellidos" required>
            </div>

            <div class="input-container">
                <label for="idUsuarioC"><i class="fas fa-user-tie"></i></label>
                <input maxlength="30" type="text" id="idUsuarioC" name="idUsuarioC" placeholder="idUsuario" required>
            </div>

            <div class="input-container">
                <label for="emailC" class="fas fa-envelope"></label>
                <input maxlength="50" type="email" id="emailC" name="emailC" placeholder="Correo electrónico" required>
            </div>

            <div class="input-container">
                <label for="phoneC" class="fas fa-phone-alt"></label>
                <input maxlength="15" type="tel" id="phoneC" name="phoneC" placeholder="Número de teléfono (Opcional)">
            </div>

            <div class="input-container">
                <label for="direccionC" class="fas fa-location-arrow"></label>
                <input maxlength="50" type="text" id="direccionC" name="direccionC" placeholder="Dirección" required>
            </div>

            <div class="input-container">
                <label for="passwordC" class="fas fa-lock"></label>
                <input maxlength="20" type="password" id="passwordC" name="passwordC" placeholder="Contraseña" required>
            </div>

            <input type="submit" class="boton" value="Registrarse">
        </form>
        <div class="modal-footer">
            <p>¿Ya tienes una cuenta? <a href="#" onclick="mostrarLogin()">Inicia sesión aquí</a></p>
        </div>
    </div>
</div>

<!-- Fondo difuminado y cuadro flotante para registrarse empresa -->
<div class="modal-background" id="modalBackground"></div>
<div class="modal" id="modalSignUp-empresa">
    <div class="modal-header">
        <h2>Registrarse en QuickBook</h2>
        <span class="close" onclick="cerrarModal()">×</span>
    </div>
    <div class="modal-body">
        <form action="registroEmpresa" method="post">
            <div class="input-container">
                <label for="fullname-empresa"><i class="fas fa-user"></i></label>
                <input maxlength="30" type="text" id="fullname-empresa" name="fullname-empresa" placeholder="Nombre empresa" required>
            </div>

            <div class="input-container">
                <label for="idUsuario-empresa"><i class="fas fa-user-tie"></i></label>
                <input maxlength="30" type="text" id="idUsuario-empresa" name="idUsuario-empresa" placeholder="idEmpresa" required>
            </div>

            <div class="input-container">
                <label for="email-empresa" class="fas fa-envelope"></label>
                <input maxlength="50" type="email" id="email-empresa" name="email-empresa" placeholder="Correo electrónico" required>
            </div>

            <div class="input-container">
                <label for="phone-empresa" class="fas fa-phone-alt"></label>
                <input maxlength="15" type="tel" id="phone-empresa" name="phone-empresa" placeholder="Número de teléfono" required>
            </div>

            <div class="input-container">
                <label for="location-empresa" class="fas fa-location-arrow"></label>
                <input maxlength="50" type="text" id="direccion-empresa" name="direccion-empresa" placeholder="Dirección" required>
            </div>

            <div class="input-container">
                <label for="password-empresa" class="fas fa-lock"></label>
                <input maxlength="20" type="password" id="password-empresa" name="password-empresa" placeholder="Contraseña" required>
            </div>

            <input type="submit" class="boton" value="Registrarse">
        </form>
        <div class="modal-footer">
            <p>¿Ya tienes una cuenta? <a href="#" onclick="mostrarLogin()">Inicia sesión aquí</a></p>
        </div>
    </div>
</div>