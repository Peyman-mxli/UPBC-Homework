Aplicaciones Web

Sesión 3 — Introducción a JavaScript: interactividad en el sitio personal

M.C. Jesús Naranjo Avilez | UPBC | ITI — 4.° cuatrimestre

¿Qué es JavaScript y para qué sirve?
En las sesiones anteriores aprendiste a estructurar el contenido de una página con HTML5 y a darle
apariencia visual con CSS3. Sin embargo, ambos lenguajes son estáticos: una vez que la página carga
en el navegador, no reacciona a lo que hace el usuario. Si quieres que algo cambie, que aparezca un
mensaje, que se valide un formulario o que un elemento se mueva, necesitas un lenguaje que le dé
comportamiento a la página. Ese lenguaje es JavaScript.
JavaScript es el único lenguaje de programación que los navegadores web ejecutan de forma nativa. A
diferencia de HTML y CSS, JavaScript sí es un lenguaje de programación completo: tiene variables,
condicionales, ciclos, funciones y estructuras de datos. Se ejecuta directamente en el navegador del
usuario, sin necesidad de un servidor.
La combinación de los tres lenguajes define las capas del desarrollo front end:
• HTML define qué hay en la página (estructura y contenido).
• CSS define cómo se ve la página (presentación visual).
• JavaScript define cómo se comporta la página (interactividad y lógica).

Nota
JavaScript no tiene ninguna relación con Java. Son lenguajes completamente distintos.
El nombre fue una decisión de marketing en 1995 para aprovechar la popularidad de Java
en ese momento.

Cómo vincular JavaScript a una página HTML
Existen dos formas de incluir JavaScript en una página. La primera es escribir el código directamente
en el HTML dentro de una etiqueta &lt;script&gt;. La segunda, y la recomendada para proyectos reales, es
escribir el código en un archivo externo con extensión .js y vincularlo desde el HTML.
Para esta sesión crearás un archivo llamado scripts.js dentro de tu carpeta de proyecto. Vincula ese
archivo en cada una de tus páginas HTML agregando la siguiente línea justo antes de cerrar la
etiqueta &lt;/body&gt;:

&lt;script src=&quot;scripts.js&quot;&gt;&lt;/script&gt;
&lt;/body&gt;

Es importante colocar la etiqueta &lt;script&gt; al final del body y no en el &lt;head&gt;. La razón es que el
navegador lee el HTML de arriba hacia abajo: si el script se carga antes de que existan los elementos
de la página, JavaScript no podrá encontrarlos ni manipularlos.

Importante
Crea el archivo scripts.js en la misma carpeta que tus archivos HTML y CSS.
Agrega la línea &lt;script src=&quot;scripts.js&quot;&gt;&lt;/script&gt; en cada página de tu sitio, justo antes de
&lt;/body&gt;.
Guarda todos los archivos antes de continuar.

Práctica 1. Saludo dinámico según la hora del día
El primer contacto con JavaScript será manipular el contenido de la página en función de datos del
momento actual. En la página principal de tu sitio mostrarás un saludo personalizado que cambia
dependiendo de la hora: buenos días, buenas tardes o buenas noches.
Paso 1. Preparar el HTML
Abre tu archivo index.html y agrega un elemento &lt;p&gt; con un id justo debajo de tu encabezado
principal. El id es el identificador que JavaScript usará para encontrar ese elemento específico en la
página:

&lt;h1&gt;Bienvenido a mi sitio personal&lt;/h1&gt;
&lt;p id=&quot;saludo&quot;&gt;&lt;/p&gt;

El párrafo está vacío en el HTML porque JavaScript lo llenará con el texto correcto en el momento en
que la página cargue.
Paso 2. Escribir la lógica en JavaScript
Abre el archivo scripts.js y escribe el siguiente código:

// Saludo dinámico según la hora del día
const ahora = new Date();
const hora = ahora.getHours();
let saludo;
if (hora &gt;= 6 &amp;&amp; hora &lt; 12) {
saludo = &#39;Buenos días. Bienvenido a mi sitio personal.&#39;;
} else if (hora &gt;= 12 &amp;&amp; hora &lt; 19) {
saludo = &#39;Buenas tardes. Bienvenido a mi sitio personal.&#39;;
} else {
saludo = &#39;Buenas noches. Bienvenido a mi sitio personal.&#39;;
}
document.getElementById(&#39;saludo&#39;).textContent = saludo;

Analiza cada parte del código:
• new Date() crea un objeto con la fecha y hora actuales del sistema del usuario.
• getHours() extrae únicamente la hora en formato de 24 horas (0 a 23).
• let saludo declara una variable que almacenará el texto del saludo. Se usa let y no const porque
su valor cambiará dependiendo de la hora.
• La estructura if / else if / else evalúa condiciones en orden y ejecuta el bloque del primero que
sea verdadero.

• document.getElementById(&#39;saludo&#39;) busca en la página el elemento cuyo id sea &#39;saludo&#39; y lo
devuelve para que puedas modificarlo.
• .textContent asigna texto al contenido del elemento encontrado. El texto aparecerá en la página
de forma inmediata.

Nota
Guarda scripts.js y recarga index.html en el navegador.
El saludo aparecerá automáticamente con el texto correspondiente a la hora actual.
Puedes modificar los rangos de horas o el texto del saludo según prefieras.

Práctica 2. Validación del formulario de contacto
La validación de formularios es una de las tareas más comunes en el desarrollo front end. Consiste en
verificar que los datos introducidos por el usuario cumplan ciertas condiciones antes de procesarlos.
Aunque los navegadores modernos ofrecen validaciones básicas mediante atributos HTML, JavaScript
permite crear validaciones personalizadas con mensajes de error específicos y un control total sobre la
experiencia del usuario.
Paso 1. Preparar el formulario en contacto.html
Abre tu archivo contacto.html y asegúrate de que el formulario tenga la siguiente estructura. Si ya
tienes un formulario, adáptalo para que los id y los elementos coincidan:

&lt;form id=&quot;formulario-contacto&quot; novalidate&gt;
&lt;label for=&quot;nombre&quot;&gt;Nombre completo&lt;/label&gt;
&lt;input type=&quot;text&quot; id=&quot;nombre&quot; placeholder=&quot;Tu nombre&quot;&gt;
&lt;span class=&quot;error&quot; id=&quot;error-nombre&quot;&gt;&lt;/span&gt;
&lt;label for=&quot;correo&quot;&gt;Correo electrónico&lt;/label&gt;
&lt;input type=&quot;email&quot; id=&quot;correo&quot; placeholder=&quot;correo@ejemplo.com&quot;&gt;
&lt;span class=&quot;error&quot; id=&quot;error-correo&quot;&gt;&lt;/span&gt;
&lt;label for=&quot;mensaje&quot;&gt;Mensaje&lt;/label&gt;
&lt;textarea id=&quot;mensaje&quot; rows=&quot;5&quot; placeholder=&quot;Escribe tu mensaje
aquí...&quot;&gt;&lt;/textarea&gt;
&lt;span class=&quot;error&quot; id=&quot;error-mensaje&quot;&gt;&lt;/span&gt;
&lt;button type=&quot;submit&quot;&gt;Enviar mensaje&lt;/button&gt;
&lt;p id=&quot;exito&quot; style=&quot;display:none; color: green;&quot;&gt;
Mensaje enviado correctamente. Gracias por escribir.
&lt;/p&gt;
&lt;/form&gt;

El atributo novalidate en el &lt;form&gt; desactiva las validaciones automáticas del navegador para que sea
JavaScript el que tome el control completo. Cada campo tiene un &lt;span&gt; vacío debajo con un id de
error; esos span son los que JavaScript llenará con los mensajes de error cuando sea necesario.
Paso 2. Estilos para los mensajes de error
Agrega las siguientes reglas en tu archivo estilos.css para que los mensajes de error tengan apariencia
visual:

/* Formulario de contacto */
form {
display: flex;

flex-direction: column;
gap: 8px;
max-width: 560px;
}
input, textarea {
padding: 10px 12px;
border: 1px solid #cccccc;
border-radius: 6px;
font-family: &#39;Segoe UI&#39;, Arial, sans-serif;
font-size: 1rem;
}
input.invalido, textarea.invalido {
border-color: #c0392b;
}
.error {
color: #c0392b;
font-size: 0.85rem;
min-height: 18px;
}
button[type=&#39;submit&#39;] {
background-color: #1a5c45;
color: #ffffff;
border: none;
padding: 12px 24px;
border-radius: 6px;
font-size: 1rem;
cursor: pointer;
transition: background-color 0.2s;
}
button[type=&#39;submit&#39;]:hover {
background-color: #2e7d5e;
}

Paso 3. Lógica de validación en JavaScript
Agrega el siguiente código en tu archivo scripts.js, a continuación del código del saludo:

// Validación del formulario de contacto
const formulario = document.getElementById(&#39;formulario-contacto&#39;);
if (formulario) {
formulario.addEventListener(&#39;submit&#39;, function (evento) {

evento.preventDefault();
let valido = true;
// --- Validar nombre ---
const campoNombre = document.getElementById(&#39;nombre&#39;);
const errorNombre = document.getElementById(&#39;error-nombre&#39;);
if (campoNombre.value.trim() === &#39;&#39;) {
errorNombre.textContent = &#39;El nombre es obligatorio.&#39;;
campoNombre.classList.add(&#39;invalido&#39;);
valido = false;
} else {
errorNombre.textContent = &#39;&#39;;
campoNombre.classList.remove(&#39;invalido&#39;);
}
// --- Validar correo ---
const campoCorreo = document.getElementById(&#39;correo&#39;);
const errorCorreo = document.getElementById(&#39;error-correo&#39;);
const formatoCorreo = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
if (!formatoCorreo.test(campoCorreo.value.trim())) {
errorCorreo.textContent = &#39;Ingresa un correo electrónico válido.&#39;;
campoCorreo.classList.add(&#39;invalido&#39;);
valido = false;
} else {
errorCorreo.textContent = &#39;&#39;;
campoCorreo.classList.remove(&#39;invalido&#39;);
}
// --- Validar mensaje ---
const campoMensaje = document.getElementById(&#39;mensaje&#39;);
const errorMensaje = document.getElementById(&#39;error-mensaje&#39;);
if (campoMensaje.value.trim().length &lt; 20) {
errorMensaje.textContent = &#39;El mensaje debe tener al menos 20
caracteres.&#39;;
campoMensaje.classList.add(&#39;invalido&#39;);
valido = false;
} else {
errorMensaje.textContent = &#39;&#39;;
campoMensaje.classList.remove(&#39;invalido&#39;);
}
// --- Mostrar éxito si todo es válido ---
const mensajeExito = document.getElementById(&#39;exito&#39;);
if (valido) {
mensajeExito.style.display = &#39;block&#39;;
formulario.reset();
} else {

mensajeExito.style.display = &#39;none&#39;;
}
});
}

Conceptos clave de este bloque:
• addEventListener(&#39;submit&#39;, ...) escucha el evento de envío del formulario y ejecuta la función
indicada cuando ocurre.
• evento.preventDefault() cancela el comportamiento predeterminado del formulario, que sería
recargar la página al enviarse.
• trim() elimina los espacios en blanco al inicio y al final del texto introducido por el usuario.
• classList.add(&#39;invalido&#39;) y classList.remove(&#39;invalido&#39;) agregan o quitan la clase CSS invalido del
campo, cambiando su borde a rojo o restaurándolo según corresponda.
• La expresión regular /^[^\s@]+@[^\s@]+\.[^\s@]+$/ verifica que el correo tenga el formato
usuario@dominio.extension. No es necesario que la memorices; basta con entender que .test()
devuelve true si el texto cumple el patrón y false si no lo cumple.
• La variable valido actúa como bandera: comienza en true y se pone en false en cuanto alguna
validación falla. Solo si sigue en true al final se muestra el mensaje de éxito.
• El if (formulario) que envuelve todo el código protege el script: si scripts.js está vinculado a
páginas que no tienen el formulario, el código no generará errores al no encontrar el elemento.

Nota
Guarda los archivos y abre contacto.html en el navegador.
Intenta enviar el formulario vacío y observa los mensajes de error.
Llena los campos correctamente y verifica que aparezca el mensaje de confirmación.

Práctica 3. Botón &#39;volver arriba&#39;
En páginas con mucho contenido, un botón flotante que aparece cuando el usuario hace scroll hacia
abajo y lo lleva de regreso al inicio mejora considerablemente la experiencia de navegación. Esta
práctica introduce dos conceptos nuevos: escuchar eventos del navegador y manipular estilos CSS
directamente desde JavaScript.
Paso 1. Agregar el botón en el HTML
Agrega el siguiente elemento en todas las páginas de tu sitio, justo antes de cerrar &lt;/body&gt; y antes de
la etiqueta &lt;script&gt;:

&lt;button id=&quot;btn-arriba&quot; title=&quot;Volver arriba&quot;&gt;&amp;#8679;&lt;/button&gt;

El código &amp;#8679; es una entidad HTML que representa el símbolo de flecha hacia arriba. El atributo
title muestra un texto descriptivo cuando el cursor se detiene sobre el botón.
Paso 2. Estilos del botón en CSS
Agrega estas reglas en estilos.css para que el botón flote en la esquina inferior derecha de la pantalla:

/* Botón volver arriba */
#btn-arriba {
position: fixed;
bottom: 32px;
right: 32px;
background-color: #1a5c45;
color: #ffffff;
border: none;
border-radius: 50%;
width: 48px;
height: 48px;
font-size: 1.4rem;
cursor: pointer;
display: none;
box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
transition: background-color 0.2s;
}
#btn-arriba:hover {
background-color: #2e7d5e;
}

La propiedad position: fixed hace que el botón se mantenga siempre en la misma posición de la
pantalla sin importar cuánto haga scroll el usuario. display: none lo oculta por defecto; JavaScript lo
hará visible cuando sea necesario.

Paso 3. Lógica en JavaScript
Agrega el siguiente código en scripts.js:

// Botón volver arriba
const btnArriba = document.getElementById(&#39;btn-arriba&#39;);
window.addEventListener(&#39;scroll&#39;, function () {
if (window.scrollY &gt; 300) {
btnArriba.style.display = &#39;block&#39;;
} else {
btnArriba.style.display = &#39;none&#39;;
}
});
btnArriba.addEventListener(&#39;click&#39;, function () {
window.scrollTo({ top: 0, behavior: &#39;smooth&#39; });
});

Puntos importantes:
• window es el objeto global del navegador; representa la ventana completa del navegador, no solo
la página.
• El evento scroll se dispara cada vez que el usuario desplaza la página hacia arriba o hacia abajo.
• window.scrollY devuelve la cantidad de píxeles que el usuario ha desplazado la página desde el
inicio. Cuando supera 300 píxeles, el botón se hace visible.
• window.scrollTo({ top: 0, behavior: &#39;smooth&#39; }) desplaza la página de regreso al inicio con una
animación suave en lugar de un salto brusco.

Nota
Para probar esta práctica necesitas que tu página tenga suficiente contenido para hacer
scroll.
Si tu página es corta, agrega párrafos de texto temporales para poder desplazarte y ver el
botón aparecer.

Práctica 4. Contador de clics (actividad en clase)
Esta práctica rápida introduce el concepto de variable de estado: una variable que guarda un valor que
puede cambiar como resultado de las acciones del usuario, y cuyo cambio se refleja de inmediato en la
página.
Qué construirás
Un botón en tu página principal que diga &#39;Me interesa este sitio&#39; y un contador visible que incremente
cada vez que el usuario lo presiona. El contador se reinicia si el usuario recarga la página.
HTML necesario
Agrega lo siguiente en index.html, en la sección que prefieras:

&lt;div style=&quot;margin-top: 24px;&quot;&gt;
&lt;button id=&quot;btn-like&quot;&gt;Me interesa este sitio&lt;/button&gt;
&lt;p&gt;Este sitio ha recibido &lt;span id=&quot;conteo&quot;&gt;0&lt;/span&gt; muestras de
interés.&lt;/p&gt;
&lt;/div&gt;

JavaScript
Agrega el siguiente bloque en scripts.js:

// Contador de clics
const btnLike = document.getElementById(&#39;btn-like&#39;);
const conteo = document.getElementById(&#39;conteo&#39;);
let clicks = 0;
if (btnLike) {
btnLike.addEventListener(&#39;click&#39;, function () {
clicks = clicks + 1;
conteo.textContent = clicks;
});
}

Nota
Esta práctica es intencional­mente sencilla para que puedas seguirla sin dificultad.
Observa que la lógica es la misma que usarás en proyectos más complejos: escuchar un
evento, modificar una variable y reflejar el cambio en la página.

Tarea — Mini quiz personal
Entrega para la siguiente sesión

¿Qué es?
Crearás una página llamada quiz.html dentro de tu sitio personal. En esa página, el visitante podrá
intentar adivinar datos sobre ti: tu lenguaje de programación favorito, tu ciudad de origen, tu
pasatiempo, tu película favorita o cualquier dato que quieras compartir. Al final del quiz, la página
mostrará cuántas respuestas acertó el visitante.
Agrega el enlace a quiz.html en tu barra de navegación para que sea accesible desde todas las
páginas del sitio.

¿Qué necesitas saber para construirlo?
Todo lo que necesitas ya lo viste en clase. Antes de escribir código, responde estas preguntas en
papel o mentalmente:
• ¿Cómo guardarías las preguntas y sus respuestas correctas en JavaScript? ¿Qué estructura de
datos usarías si tuvieras más de una pregunta?
• ¿Cómo obtendrías la respuesta que el usuario seleccionó en un grupo de botones de opción?
• ¿Cómo compararías la respuesta del usuario con la respuesta correcta?
• ¿Dónde acumularías el conteo de respuestas correctas?
• ¿Cómo mostrarías el resultado final sin recargar la página?

Estructura sugerida del HTML
No hay una única forma correcta de construir el HTML. Lo importante es que cada pregunta tenga un
grupo de opciones identificables y que exista un botón para enviar las respuestas y un elemento donde
mostrar el resultado. Una estructura posible:

&lt;h1&gt;¿Qué tanto me conoces?&lt;/h1&gt;
&lt;p&gt;Responde las siguientes preguntas y descubre cuánto sabes sobre
mí.&lt;/p&gt;
&lt;div id=&quot;pregunta-1&quot;&gt;
&lt;p&gt;1. ¿Cuál es mi lenguaje de programación favorito?&lt;/p&gt;
&lt;label&gt;&lt;input type=&quot;radio&quot; name=&quot;p1&quot; value=&quot;opcionA&quot;&gt; Python&lt;/label&gt;
&lt;label&gt;&lt;input type=&quot;radio&quot; name=&quot;p1&quot; value=&quot;opcionB&quot;&gt;
JavaScript&lt;/label&gt;
&lt;label&gt;&lt;input type=&quot;radio&quot; name=&quot;p1&quot; value=&quot;opcionC&quot;&gt; Java&lt;/label&gt;
&lt;/div&gt;
&lt;!-- Repite el bloque anterior por cada pregunta --&gt;
&lt;button id=&quot;btn-quiz&quot;&gt;Ver resultados&lt;/button&gt;

&lt;p id=&quot;resultado-quiz&quot;&gt;&lt;/p&gt;

Punto de partida en JavaScript
A continuación encontrarás un fragmento de código incompleto. Tu tarea es completarlo para que el
quiz funcione correctamente. Los comentarios indican qué debes escribir en cada sección:

// Mini quiz personal
const btnQuiz = document.getElementById(&#39;btn-quiz&#39;);
if (btnQuiz) {
// Define aquí cuáles son las respuestas correctas.
// Piensa: ¿qué valor tiene el atributo &#39;value&#39; de la opción correcta
// en cada pregunta?
const respuestasCorrectas = {
p1: &#39;???&#39;, // reemplaza ??? con el value de la opción correcta
p2: &#39;???&#39;,
p3: &#39;???&#39;,
// agrega más si tienes más preguntas
};
btnQuiz.addEventListener(&#39;click&#39;, function () {
let aciertos = 0;
// Para cada pregunta, obtén la opción seleccionada.
// Pista: document.querySelector(&#39;input[name=&quot;p1&quot;]:checked&#39;)
// devuelve el radio button que el usuario seleccionó en el grupo p1.
// Si no seleccionó ninguno, devuelve null.
// Escribe aquí la lógica para p1:
// 1. Obtén el elemento seleccionado.
// 2. Verifica que no sea null (el usuario sí seleccionó algo).
// 3. Compara su .value con respuestasCorrectas.p1.
// 4. Si coinciden, incrementa aciertos.
// Repite el proceso para p2, p3, etc.
// Al final, muestra el resultado en el elemento #resultado-quiz.
// El mensaje debe indicar cuántas preguntas acertó el visitante
// del total de preguntas.
const totalPreguntas = Object.keys(respuestasCorrectas).length;
document.getElementById(&#39;resultado-quiz&#39;).textContent =
&#39;Acertaste &#39; + aciertos + &#39; de &#39; + totalPreguntas + &#39; preguntas.&#39;;
});

}

Pista
Para obtener la respuesta seleccionada en la pregunta 1 puedes usar:
const seleccionP1 = document.querySelector(&#39;input[name=&quot;p1&quot;]:checked&#39;);
Si el usuario no seleccionó ninguna opción, seleccionP1 será null.
Si sí seleccionó algo, seleccionP1.value tendrá el valor de esa opción.
Compara ese valor con respuestasCorrectas.p1 usando el operador ===.

Pista
¿Cómo sabes cuántas preguntas hay en total sin contarlas manualmente?
Object.keys(respuestasCorrectas).length devuelve el número de propiedades
del objeto respuestasCorrectas. Si tienes 4 preguntas, devuelve 4.
Ya está incluido en el código de inicio para que lo uses directamente.

Importante
El quiz debe tener entre 3 y 5 preguntas.
Las preguntas deben ser sobre ti: datos personales, gustos, metas, experiencias.
La página quiz.html debe estar vinculada desde la barra de navegación de tu sitio.
Entrega el reporte en el formato acordado.

Lo que aprendiste en esta sesión
• Vinculaste un archivo JavaScript externo a todas las páginas de tu sitio con la etiqueta &lt;script&gt;.
• Manipulaste el contenido de elementos HTML desde JavaScript usando getElementById y
textContent.
• Usaste el objeto Date para obtener la hora actual y mostrar un saludo dinámico.
• Validaste un formulario de contacto con mensajes de error personalizados y retroalimentación
visual.
• Escuchaste eventos del navegador (scroll, click, submit) con addEventListener.
• Construiste un botón flotante que aparece y desaparece según la posición del scroll.
• Implementaste un contador de clics que actualiza la página en tiempo real.

M.C. Jesús Naranjo Avilez — UPBC — Aplicaciones Web — ITI 4.° cuatrimestre
