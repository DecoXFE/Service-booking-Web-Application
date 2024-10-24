/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function agregarCampoServicioEditar() {
    var serviciosContainer = document.getElementById("serviciosContainer2");

    // Obtener el número actual de campos
    var numCampos = serviciosContainer.getElementsByClassName("servicio").length;

    // Crear el nuevo campo servicio-precio
    var nuevoCampo = document.createElement("div");
    nuevoCampo.className = "servicio";

    var nuevoServicioLabel = document.createElement("label");
    nuevoServicioLabel.textContent = "Servicio " + numCampos + ":";
    nuevoCampo.appendChild(nuevoServicioLabel);

    var nuevoServicioInput = document.createElement("input");
    nuevoServicioInput.type = "text";
    nuevoServicioInput.id = "servicio_" + numCampos;
    nuevoServicioInput.name = "servicio_" + numCampos;
    nuevoServicioInput.required = true;
    nuevoCampo.appendChild(nuevoServicioInput);

    var nuevoPrecioLabel = document.createElement("label");
    nuevoPrecioLabel.textContent = "Precio " + numCampos + ":";
    nuevoCampo.appendChild(nuevoPrecioLabel);

    var nuevoPrecioInput = document.createElement("input");
    nuevoPrecioInput.type = "text";
    nuevoPrecioInput.id = "precio_" + numCampos;
    nuevoPrecioInput.name = "precio_" + numCampos;
    nuevoPrecioInput.required = true;
    nuevoCampo.appendChild(nuevoPrecioInput);

    // Agregar el nuevo campo al contenedor
    serviciosContainer.appendChild(nuevoCampo);
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
    
function eliminarCampoServicioAnadir() {
    const serviciosContainer = document.getElementById("serviciosContainer");

    // Obtener los campos de servicio y precio existentes
    const camposServicioPrecio = serviciosContainer.getElementsByClassName("servicio");

    // Verificar que haya más de un par de servicio y precio
    if (camposServicioPrecio.length > 1) {
        // Eliminar el último par de servicio y precio
        serviciosContainer.removeChild(camposServicioPrecio[camposServicioPrecio.length - 1]);
    }
}