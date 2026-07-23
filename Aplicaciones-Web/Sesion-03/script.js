// ======================================
// SALUDO DINÁMICO
// ======================================

const ahora = new Date();
const hora = ahora.getHours();

let saludo;

if (hora >= 6 && hora < 12) {
    saludo = "☀️ Buenos días. Bienvenido a mi sitio personal.";
}
else if (hora >= 12 && hora < 19) {
    saludo = "🌤️ Buenas tardes. Bienvenido a mi sitio personal.";
}
else {
    saludo = "🌙 Buenas noches. Bienvenido a mi sitio personal.";
}

const elementoSaludo = document.getElementById("saludo");

if (elementoSaludo) {
    elementoSaludo.textContent = saludo;
}


// ======================================
// VALIDACIÓN DEL FORMULARIO
// ======================================

const formulario = document.getElementById("formulario-contacto");

if (formulario) {

    formulario.addEventListener("submit", function (evento) {

        evento.preventDefault();

        let valido = true;

        const campoNombre = document.getElementById("nombre");
        const campoCorreo = document.getElementById("correo");
        const campoMensaje = document.getElementById("mensaje");

        const errorNombre = document.getElementById("error-nombre");
        const errorCorreo = document.getElementById("error-correo");
        const errorMensaje = document.getElementById("error-mensaje");

        // Nombre

        if (campoNombre.value.trim() === "") {

            errorNombre.textContent = "El nombre es obligatorio.";
            campoNombre.classList.add("invalido");

            valido = false;

        } else {

            errorNombre.textContent = "";
            campoNombre.classList.remove("invalido");

        }

        // Correo

        const formatoCorreo = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        if (!formatoCorreo.test(campoCorreo.value.trim())) {

            errorCorreo.textContent = "Ingresa un correo válido.";
            campoCorreo.classList.add("invalido");

            valido = false;

        } else {

            errorCorreo.textContent = "";
            campoCorreo.classList.remove("invalido");

        }

        // Mensaje

        if (campoMensaje.value.trim().length < 20) {

            errorMensaje.textContent = "El mensaje debe contener al menos 20 caracteres.";
            campoMensaje.classList.add("invalido");

            valido = false;

        } else {

            errorMensaje.textContent = "";
            campoMensaje.classList.remove("invalido");

        }

        const mensajeExito = document.getElementById("exito");

        if (valido) {

            mensajeExito.style.display = "block";
            formulario.reset();

        } else {

            mensajeExito.style.display = "none";

        }

    });

}



// ======================================
// BOTÓN VOLVER ARRIBA
// ======================================

const btnArriba = document.getElementById("btn-arriba");

if (btnArriba) {

    window.addEventListener("scroll", function () {

        if (window.scrollY > 300) {

            btnArriba.style.display = "block";

        } else {

            btnArriba.style.display = "none";

        }

    });

    btnArriba.addEventListener("click", function () {

        window.scrollTo({

            top: 0,
            behavior: "smooth"

        });

    });

}



// ======================================
// CONTADOR DE CLICS
// ======================================

const btnLike = document.getElementById("btn-like");
const conteo = document.getElementById("conteo");

let clicks = 0;

if (btnLike) {

    btnLike.addEventListener("click", function () {

        clicks++;

        conteo.textContent = clicks;

    });

}



// ======================================
// MINI QUIZ PERSONAL
// ======================================

const btnQuiz = document.getElementById("btn-quiz");

if (btnQuiz) {

    const respuestasCorrectas = {

        p1: "python",
        p2: "iran",
        p3: "upbc",
        p4: "mexicali",
        p5: "ia"

    };

    btnQuiz.addEventListener("click", function () {

        let aciertos = 0;

        const seleccionP1 = document.querySelector('input[name="p1"]:checked');

        if (seleccionP1 && seleccionP1.value === respuestasCorrectas.p1) {
            aciertos++;
        }


        const seleccionP2 = document.querySelector('input[name="p2"]:checked');

        if (seleccionP2 && seleccionP2.value === respuestasCorrectas.p2) {
            aciertos++;
        }


        const seleccionP3 = document.querySelector('input[name="p3"]:checked');

        if (seleccionP3 && seleccionP3.value === respuestasCorrectas.p3) {
            aciertos++;
        }


        const seleccionP4 = document.querySelector('input[name="p4"]:checked');

        if (seleccionP4 && seleccionP4.value === respuestasCorrectas.p4) {
            aciertos++;
        }


        const seleccionP5 = document.querySelector('input[name="p5"]:checked');

        if (seleccionP5 && seleccionP5.value === respuestasCorrectas.p5) {
            aciertos++;
        }


        const totalPreguntas = Object.keys(respuestasCorrectas).length;

        const resultado = document.getElementById("resultado-quiz");

        resultado.textContent =
            "🎉 Acertaste " +
            aciertos +
            " de " +
            totalPreguntas +
            " preguntas.";

    });

}