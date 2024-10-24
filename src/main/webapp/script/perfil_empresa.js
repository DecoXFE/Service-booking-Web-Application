function manejarOpcionMenu(opcionSeleccionada) {
  var elementoMensajeBienvenida = document.getElementById('mensajeBienvenida');
  var elementosContenido = document.querySelectorAll('.contenido > div');
  
  for (var i = 0; i < elementosContenido.length; i++) {
    elementosContenido[i].style.display = 'none';
  }
  
  var elementoSeleccionado = document.getElementById(opcionSeleccionada);
  
  if (elementoSeleccionado) {
        if (opcionSeleccionada === 'cerrarSesion') {
            // Lógica de cerrar sesión, redirección al servlet de cierre de sesión
            window.location.href = 'LogoutServlet';
        } else {
            elementoSeleccionado.style.display = 'block';
            elementoMensajeBienvenida.style.display = 'none';
        }
    } else {
        elementoMensajeBienvenida.style.display = 'block';
    }
}


function manejarVisibilidadElementos(isPublicado) {
  var elementoAnadirAnuncio = document.getElementById("anadirAnuncioMenu");
  var elementoEditarAnuncio = document.getElementById("editarAnuncioMenu");

  if (isPublicado) {
    elementoAnadirAnuncio.style.display = "none"; // Ocultar Añadir Anuncio
    elementoEditarAnuncio.style.display = "block"; // Mostrar Editar Anuncio
  } else {
    elementoAnadirAnuncio.style.display = "block"; // Mostrar Añadir Anuncio
    elementoEditarAnuncio.style.display = "none"; // Ocultar Editar Anuncio
  }
}

function agregarCampoServicio() {
  const serviciosContainer = document.getElementById("serviciosContainer");

  // Obtener el número de campos de servicio existentes
  const numCamposServicio = serviciosContainer.querySelectorAll(".servicio").length;

  const servicioDiv = document.createElement("div");
  servicioDiv.className = "servicio";

  const nombreLabel = document.createElement("label");
  nombreLabel.className = "servicio-label";
  nombreLabel.textContent = "Servicio " + numCamposServicio + ":";
  servicioDiv.appendChild(nombreLabel);

  const nombreInput = document.createElement("input");
  nombreInput.className = "servicio-input";
  nombreInput.type = "text";
  nombreInput.name = "servicio_" + numCamposServicio; // Nombre único para el campo de servicio
  servicioDiv.appendChild(nombreInput);

  const precioLabel = document.createElement("label");
  precioLabel.className = "servicio-label";
  precioLabel.textContent = "Precio " + numCamposServicio + ":";
  servicioDiv.appendChild(precioLabel);

  const precioInput = document.createElement("input");
  precioInput.className = "servicio-input";
  precioInput.type = "text";
  precioInput.name = "precio_" + numCamposServicio; // Nombre único para el campo de precio
  servicioDiv.appendChild(precioInput);

  serviciosContainer.appendChild(servicioDiv);
}

function eliminarCampoServicioEditar() {
        var serviciosContainer = document.getElementById("serviciosContainer2");
        
        // Obtener los campos de servicio y precio existentes
        var camposServicioPrecio = serviciosContainer.getElementsByClassName("servicio");
        
        // Verificar que haya más de un par de servicio y precio
        if (camposServicioPrecio.length > 1) {
            // Eliminar el último par de servicio y precio
            serviciosContainer.removeChild(camposServicioPrecio[camposServicioPrecio.length - 1]);
        }
    }




