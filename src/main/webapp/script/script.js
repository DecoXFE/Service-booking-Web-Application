function mostrarLogin() {
    document.getElementById("modalBackground").style.display = "block";
    document.getElementById("modalLogin").style.display = "block";
    document.getElementById("modalSignUp").style.display = "none";
    document.getElementById("modalSignUp-empresa").style.display = "none";
}

function mostrarSignUp() {
    document.getElementById("modalBackground").style.display = "block";
    document.getElementById("modalSignUp").style.display = "block";
}

function mostrarSignUpEmpresa() {
    document.getElementById("modalBackground").style.display = "block";
    document.getElementById("modalSignUp-empresa").style.display = "block";
}

function cerrarModal() {
    document.getElementById("modalBackground").style.display = "none";
    document.getElementById("modalLogin").style.display = "none";
    document.getElementById("modalSignUp").style.display = "none";
    document.getElementById("modalSignUp-empresa").style.display = "none";
}
function editarPerfil() {
    // Crear un formulario para editar el perfil
    var form = document.createElement("form");

    // Agregar campos de formulario para la información del perfil
    var nombreInput = document.createElement("input");
    nombreInput.setAttribute("type", "text");
    nombreInput.setAttribute("placeholder", "Nombre");

    var correoInput = document.createElement("input");
    correoInput.setAttribute("type", "email");
    correoInput.setAttribute("placeholder", "Correo electrónico");

    var passwordInput = document.createElement("input");
    passwordInput.setAttribute("type", "password");
    passwordInput.setAttribute("placeholder", "Contraseña");

    // Agregar botón de enviar
    var submitButton = document.createElement("button");
    submitButton.setAttribute("type", "submit");
    submitButton.innerText = "Guardar cambios";

    // Agregar campos de formulario y botón de enviar al formulario
    form.appendChild(nombreInput);
    form.appendChild(correoInput);
    form.appendChild(passwordInput);
    form.appendChild(submitButton);

    // Agregar el formulario al cuerpo de la página
    document.body.appendChild(form);
}

function dejarReseña() {

    const reviewText = document.getElementById('reviewText');
    const submitButton = document.getElementById('submitButton');
    const reviewList = document.getElementById('reviewList');

    // Evento click para el botón de enviar reseña
    submitButton.addEventListener('click', function () {
        const review = reviewText.value;

        if (review.trim() !== '') {
            // Crear elemento de lista para la reseña
            const listItem = document.createElement('li');
            listItem.innerText = review;

            // Agregar la reseña a la lista
            reviewList.appendChild(listItem);

            // Limpiar el campo de texto de reseña
            reviewText.value = '';
        }
    });


}
function cerrarSesion(){
     window.location.href = 'LogoutServlet';

}


