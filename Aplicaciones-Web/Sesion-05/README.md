# 🏗️ Sesión 05 — Patrón de Diseño MVC

> **Aplicaciones Web — Universidad Politécnica de Baja California (UPBC)**  
> Implementación del patrón **Model–View–Controller (MVC)** utilizando PHP, MySQL, HTML y CSS.

---

## 📖 Descripción

En esta sesión se introduce el patrón de diseño **MVC — Model, View, Controller**.

MVC permite organizar una aplicación web separando sus responsabilidades principales en tres capas:

```text
MODEL
VIEW
CONTROLLER
```

Esta separación ayuda a crear proyectos más organizados, mantenibles y fáciles de trabajar en equipo.

---

## 🎯 Objetivos de aprendizaje

Durante esta sesión se busca comprender y aplicar:

- Qué problema resuelve el patrón MVC.
- La responsabilidad del Model.
- La responsabilidad de la View.
- La responsabilidad del Controller.
- El flujo completo de una petición.
- Organización de carpetas en un proyecto MVC.
- Conexión de PHP con MySQL utilizando PDO.
- Uso de un punto de entrada mediante `index.php`.
- Enrutamiento utilizando parámetros en la URL.
- Creación de una base de datos con phpMyAdmin.
- Creación de una tabla de contactos.
- Separación entre lógica, datos e interfaz.

---

# 🧩 ¿Qué es MVC?

MVC significa:

```text
Model
View
Controller
```

Es un patrón de arquitectura que divide una aplicación en tres responsabilidades principales.

```text
                 MVC
                  │
        ┌─────────┼─────────┐
        │         │         │
      MODEL      VIEW    CONTROLLER
        │         │         │
      Datos     Interfaz   Control
```

---

# 🗄️ Model — Modelo

El **Model** se encarga de los datos de la aplicación.

Su responsabilidad principal es comunicarse con la base de datos.

Puede realizar operaciones como:

```text
SELECT
INSERT
UPDATE
DELETE
```

El modelo:

```text
✓ Trabaja con datos
✓ Ejecuta consultas SQL
✓ Se comunica con MySQL

✗ No genera HTML
✗ No controla la interfaz
```

---

# 🖥️ View — Vista

La **View** representa lo que el usuario observa en el navegador.

Contiene principalmente:

```text
HTML
CSS
JavaScript
```

La vista:

```text
✓ Muestra información
✓ Presenta formularios
✓ Genera la interfaz

✗ No debe hacer consultas SQL
✗ No debe controlar la lógica de negocio
```

---

# 🎛️ Controller — Controlador

El **Controller** funciona como intermediario entre el usuario, el modelo y la vista.

Su función es:

```text
Recibir petición
      ↓
Decidir qué acción ejecutar
      ↓
Llamar al Model
      ↓
Recibir datos
      ↓
Enviar datos a la View
```

El controlador coordina el flujo de la aplicación.

---

# 🔄 Flujo de una Petición MVC

```text
[ USUARIO ]
     │
     │ Petición
     ▼
[ CONTROLLER ]
     │
     │ Solicita datos
     ▼
[ MODEL ]
     │
     │ Consulta MySQL
     ▼
[ DATABASE ]
     │
     │ Devuelve resultados
     ▼
[ MODEL ]
     │
     ▼
[ CONTROLLER ]
     │
     │ Envía datos
     ▼
[ VIEW ]
     │
     │ Genera HTML
     ▼
[ USUARIO ]
```

Este flujo permite mantener separada cada responsabilidad.

---

# 📂 Estructura del Proyecto

El proyecto de esta sesión utiliza la siguiente estructura:

```text
Sesion-05/
│
├── index.php
│
├── config/
│   └── database.php
│
├── controllers/
│   └── ContactoController.php
│
├── models/
│   └── Contacto.php
│
├── views/
│   ├── layout.php
│   └── contactos/
│       ├── lista.php
│       └── formulario.php
│
└── public/
    └── estilos.css
```

---

# 📄 Responsabilidad de los Archivos

| Archivo | Responsabilidad |
|---|---|
| `index.php` | Punto de entrada principal |
| `config/database.php` | Conexión con MySQL |
| `controllers/ContactoController.php` | Controla las acciones del usuario |
| `models/Contacto.php` | Ejecuta operaciones sobre los contactos |
| `views/layout.php` | Plantilla principal de la aplicación |
| `views/contactos/lista.php` | Muestra los contactos |
| `views/contactos/formulario.php` | Formulario para agregar contactos |
| `public/estilos.css` | Estilos visuales |

---

# 🚪 `index.php` — Punto de Entrada

Todas las peticiones de la aplicación pasan por:

```text
index.php
```

El archivo utiliza un parámetro llamado:

```text
accion
```

Ejemplos:

```text
index.php?accion=lista
index.php?accion=formulario
index.php?accion=guardar
index.php?accion=eliminar&id=3
```

Esto permite decidir qué función del controlador debe ejecutarse.

---

# 🔀 Enrutamiento

Ejemplo de flujo:

```text
http://localhost/mi-proyecto/index.php?accion=lista
```

La aplicación interpreta:

```text
accion = lista
```

y ejecuta:

```php
accionLista();
```

Otro ejemplo:

```text
?accion=formulario
```

ejecuta:

```php
accionFormulario();
```

---

# 🗄️ Base de Datos

La aplicación utiliza una base de datos llamada:

```text
mi_proyecto
```

La base de datos se administra utilizando:

```text
phpMyAdmin
```

Dirección local:

```text
http://localhost/phpmyadmin
```

---

# 📋 Tabla `contactos`

La tabla utilizada en esta sesión contiene:

```text
contactos
│
├── id
├── nombre
├── correo
├── telefono
└── creado_en
```

SQL:

```sql
CREATE TABLE contactos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(150) NOT NULL,
    telefono VARCHAR(20) DEFAULT NULL,
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

---

# 🔌 PHP + MySQL con PDO

La conexión se realizará utilizando:

```text
PDO
```

PDO significa:

```text
PHP Data Objects
```

Permite conectar PHP con una base de datos de forma moderna y segura.

Ejemplo:

```php
$pdo = new PDO($dsn, DB_USER, DB_PASS);
```

---

# 🧠 Separación de Responsabilidades

Una de las reglas más importantes de MVC es:

```text
MODEL      → Datos
VIEW       → Interfaz
CONTROLLER → Coordinación
```

Ejemplo:

```text
Consulta SQL
    ↓
MODEL

Mostrar tabla HTML
    ↓
VIEW

Decidir qué hacer
    ↓
CONTROLLER
```

---

# 🛠️ Tecnologías

![PHP](https://img.shields.io/badge/PHP-Server--Side-777BB4?logo=php&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-Database-4479A1?logo=mysql&logoColor=white)
![HTML5](https://img.shields.io/badge/HTML5-Markup-E34F26?logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/CSS3-Styles-1572B6?logo=css3&logoColor=white)
![XAMPP](https://img.shields.io/badge/XAMPP-Local_Server-FB7A24?logo=xampp&logoColor=white)

---

# 🧪 Ejecución Local

El proyecto se ejecutará utilizando XAMPP.

Ubicación:

```text
C:\xampp\htdocs\mi-proyecto
```

Servicios necesarios:

```text
Apache ✅
MySQL  ✅
```

Luego se abre:

```text
http://localhost/mi-proyecto/index.php
```

---

# ✅ Resultado Esperado

Al finalizar la sesión se debe poder:

```text
✓ Ejecutar el proyecto mediante localhost
✓ Conectarse correctamente con MySQL
✓ Utilizar una estructura MVC
✓ Navegar entre las vistas
✓ Acceder al formulario
✓ Mostrar la lista de contactos
✓ Utilizar index.php como router
```

---

# 🧠 Conceptos Clave

```text
MVC
├── Model
│   └── Database
│
├── View
│   └── HTML + CSS
│
└── Controller
    └── Application Flow
```

---

# 📚 Lo Aprendido

Durante esta sesión se trabaja con:

- Arquitectura MVC.
- Separación de responsabilidades.
- Organización de proyectos PHP.
- Conexión con MySQL.
- PDO.
- phpMyAdmin.
- Routing.
- Controllers.
- Models.
- Views.
- Bases de datos relacionales.

---

## 👨‍💻 Autor

**Peyman Miyandashti**  
Ingeniería en Tecnologías de la Información e Innovación Digital  
Universidad Politécnica de Baja California — UPBC

---

> 📘 **Aplicaciones Web — Sesión 05**  
> MVC · PHP · MySQL · PDO · XAMPP · Backend Development
