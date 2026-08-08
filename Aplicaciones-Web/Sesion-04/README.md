# 🐘 Sesión 04 — Introducción a PHP

> **Aplicaciones Web — Universidad Politécnica de Baja California (UPBC)**  
> Introducción a la programación del lado del servidor utilizando PHP y XAMPP.

---

## 📖 Descripción

En esta sesión se introduce **PHP** como lenguaje de programación del lado del servidor.

A diferencia de JavaScript, que se ejecuta directamente en el navegador del usuario, PHP se ejecuta en el servidor antes de enviar el contenido final al navegador.

Durante la sesión se trabajó con **XAMPP** como entorno de desarrollo local para ejecutar aplicaciones PHP mediante el servidor Apache.

También se practicó el procesamiento y validación de formularios utilizando el método `POST`.

---

## 🎯 Objetivos de aprendizaje

Al finalizar esta sesión se busca comprender y aplicar:

- La diferencia entre programación del lado del cliente y del servidor.
- El funcionamiento básico de PHP.
- La instalación y configuración de XAMPP.
- El uso del servidor Apache.
- La estructura básica de un archivo `.php`.
- Variables y tipos de datos en PHP.
- Uso de `echo` para generar contenido.
- Procesamiento de formularios.
- Diferencias entre los métodos `GET` y `POST`.
- Validación de datos desde el servidor.
- Uso de `$_POST`.
- Uso de `$_SERVER['REQUEST_METHOD']`.
- Uso de `trim()`, `empty()` y `filter_var()`.
- Protección de datos mediante `htmlspecialchars()`.

---

## 🖥️ PHP y JavaScript

PHP y JavaScript pueden trabajar juntos en una aplicación web, pero se ejecutan en lugares diferentes.

| Tecnología | Ejecución | Uso principal |
|---|---|---|
| HTML | Navegador | Estructura de la página |
| CSS | Navegador | Diseño y presentación |
| JavaScript | Navegador | Interactividad y validación |
| PHP | Servidor | Procesamiento, validación y contenido dinámico |

Cuando el usuario solicita una página PHP:

```text
Usuario
   ↓
Navegador
   ↓
Servidor Apache
   ↓
PHP procesa el código
   ↓
Genera HTML
   ↓
Navegador muestra el resultado
```

El usuario recibe únicamente el HTML generado por el servidor y no el código PHP original.

---

## 🛠️ Entorno de desarrollo

Para ejecutar PHP localmente se utiliza **XAMPP**.

XAMPP proporciona las herramientas necesarias para crear un servidor web local, incluyendo:

- Apache
- PHP
- MariaDB
- phpMyAdmin

Los proyectos PHP se almacenan dentro de:

```text
C:\xampp\htdocs\
```

Por ejemplo:

```text
C:\xampp\htdocs\Sesion-04\
```

Y pueden ejecutarse desde el navegador utilizando:

```text
http://localhost/Sesion-04/
```

---

## 🐘 Sintaxis básica de PHP

El código PHP se escribe utilizando:

```php
<?php

echo "Hola desde PHP";

?>
```

Las variables comienzan con el símbolo `$`.

```php
$nombre = "Peyman";
$semestre = 4;
$promedio = 9.2;
$activo = true;
```

PHP determina automáticamente el tipo de dato almacenado en cada variable.

---

## 📩 Formularios con PHP

PHP permite recibir información enviada desde formularios HTML.

Un formulario puede utilizar principalmente dos métodos:

### GET

Envía los datos como parámetros visibles en la URL.

```text
?nombre=Peyman&semestre=4
```

Es útil para búsquedas y filtros.

### POST

Envía los datos dentro de la solicitud HTTP.

```html
<form action="procesar.php" method="POST">
```

Los datos pueden recuperarse en PHP mediante:

```php
$nombre = $_POST['nombre'];
```

Para formularios donde se envía información del usuario se utiliza normalmente `POST`.

---

## ✅ Validación del lado del servidor

La validación realizada con JavaScript mejora la experiencia del usuario, pero PHP permite validar nuevamente los datos directamente en el servidor.

Para saber si un formulario fue enviado:

```php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Procesar formulario
}
```

También se pueden limpiar los datos recibidos:

```php
$nombre = trim($_POST['nombre']);
```

Y verificar que un campo no esté vacío:

```php
if (empty($nombre)) {
    $errores['nombre'] = 'El nombre es obligatorio.';
}
```

---

## 🔐 Seguridad con `htmlspecialchars()`

Cuando se muestran datos introducidos por un usuario, se utiliza:

```php
htmlspecialchars($nombre)
```

Esto convierte caracteres especiales en representaciones seguras para HTML y ayuda a prevenir ataques de tipo **Cross-Site Scripting (XSS)**.

Ejemplo:

```php
<p>
    <?php echo htmlspecialchars($nombre); ?>
</p>
```

---

# 💻 Proyecto — Tarjeta de Presentación Dinámica

Como actividad de la sesión se desarrollará una página PHP llamada:

```text
tarjeta.php
```

La aplicación permitirá que un visitante introduzca información personal mediante un formulario y genere dinámicamente una tarjeta de presentación.

---

## 📝 Información solicitada

El formulario contiene cuatro campos:

- 👤 Nombre
- 🎓 Carrera
- 📚 Semestre
- 💬 Frase personal

Al presionar el botón **Generar tarjeta**, PHP procesará y validará los datos.

---

## ⚙️ Funcionamiento

```text
Abrir tarjeta.php
        ↓
Mostrar formulario
        ↓
Usuario completa los datos
        ↓
Enviar mediante POST
        ↓
PHP recibe los datos
        ↓
Validar campos
        ↓
¿Existen errores?
   ↙             ↘
 Sí               No
 ↓                 ↓
Mostrar          Generar
errores           tarjeta
```

La tarjeta únicamente se mostrará cuando todos los campos sean válidos.

---

## 📂 Estructura

```text
Sesion-04/
│
├── README.md
├── tarjeta.php
└── estilos.css
```

### `tarjeta.php`

Contiene:

- Formulario HTML.
- Procesamiento con PHP.
- Recepción de datos mediante `POST`.
- Validación de campos.
- Mensajes de error.
- Generación dinámica de la tarjeta.
- Uso de `htmlspecialchars()`.

### `estilos.css`

Contiene los estilos visuales utilizados para:

- Formulario.
- Campos de entrada.
- Botones.
- Mensajes de error.
- Tarjeta de presentación.
- Colores, bordes y sombras.

---

## 🧪 Validaciones

La aplicación debe comprobar que:

```text
✓ Nombre no esté vacío
✓ Carrera no esté vacía
✓ Semestre no esté vacío
✓ Frase personal no esté vacía
```

Si existe algún problema, se mostrarán mensajes de error y la tarjeta no será generada.

---

## 🚀 Ejecución

1. Iniciar **Apache** desde XAMPP.
2. Colocar la carpeta `Sesion-04` dentro de `htdocs`.
3. Abrir el navegador.
4. Visitar:

```text
http://localhost/Sesion-04/tarjeta.php
```

5. Completar los cuatro campos.
6. Presionar **Generar tarjeta**.
7. Verificar que PHP genere correctamente la tarjeta.

---

## 🧠 Conceptos aplicados

```text
PHP
├── Variables
├── Condicionales
├── Arrays
├── $_POST
├── $_SERVER
├── trim()
├── empty()
├── htmlspecialchars()
└── Formularios
```

---

## 📚 Tecnologías

![PHP](https://img.shields.io/badge/PHP-Server--Side-777BB4?logo=php&logoColor=white)
![HTML5](https://img.shields.io/badge/HTML5-Markup-E34F26?logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/CSS3-Styles-1572B6?logo=css3&logoColor=white)
![XAMPP](https://img.shields.io/badge/XAMPP-Local_Server-FB7A24?logo=xampp&logoColor=white)

---

## 📌 Resultado esperado

Al finalizar la actividad se tendrá una aplicación PHP capaz de:

- Recibir información desde un formulario.
- Procesar datos en el servidor.
- Validar los campos recibidos.
- Mostrar mensajes de error.
- Generar contenido HTML dinámicamente.
- Mostrar una tarjeta de presentación con estilos CSS.
- Proteger la salida de datos introducidos por el usuario.

---

## 🎓 Conclusión

Esta sesión representa la transición del desarrollo web exclusivamente **Front-End** hacia el desarrollo **Server-Side**.

PHP permite que una aplicación deje de ser únicamente una interfaz estática y pueda procesar información enviada por los usuarios.

La actividad de la tarjeta de presentación permite aplicar los fundamentos de PHP, formularios, validación, seguridad básica y generación dinámica de contenido que servirán como base para trabajar posteriormente con bases de datos y arquitecturas web más avanzadas.

---

## 👨‍💻 Autor

**Peyman Miyandashti**  
Ingeniería en Tecnologías de la Información e Innovación Digital  
Universidad Politécnica de Baja California — UPBC

---

> 📘 **Aplicaciones Web — Sesión 04**  
> PHP · Server-Side Programming · Forms · Validation · XAMPP
