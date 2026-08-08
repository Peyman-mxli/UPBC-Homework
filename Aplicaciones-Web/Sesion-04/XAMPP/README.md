# 🟧 XAMPP — Local Development Environment

> **Aplicaciones Web — Sesión 04**  
> Universidad Politécnica de Baja California — UPBC

---

## 📖 What is XAMPP?

**XAMPP** is a free local development environment used to run web applications directly on a computer.

Normally, PHP applications require a web server to execute their code. Unlike HTML and CSS files, a PHP file cannot simply be opened by double-clicking it.

PHP must first be processed by a server.

XAMPP makes this possible by installing several web development tools together in one package.

---

## 🧩 What does XAMPP include?

The name **XAMPP** traditionally represents:

```text
X → Cross-platform
A → Apache
M → MariaDB
P → PHP
P → Perl
```

The most important components for this course are:

| Component | Purpose |
|---|---|
| Apache | Local web server |
| PHP | Server-side programming language |
| MariaDB | Relational database server |
| phpMyAdmin | Web interface for managing databases |
| Perl | Programming language included with XAMPP |

For **Sesión 04**, the main components are:

```text
Apache + PHP
```

Later, when working with databases, MariaDB and phpMyAdmin will also become important.

---

# 🌐 How XAMPP Works

When a PHP application runs locally, the request follows this process:

```text
User
  ↓
Browser
  ↓
http://localhost
  ↓
Apache Web Server
  ↓
PHP Interpreter
  ↓
PHP code is executed
  ↓
HTML is generated
  ↓
Apache sends the HTML
  ↓
Browser displays the page
```

The browser never executes PHP directly.

Instead, Apache sends the PHP file to the PHP interpreter.

PHP executes the code and generates HTML.

The final HTML is then returned to the browser.

---

## 💡 Example

Suppose this PHP file exists:

```php
<?php

$nombre = "Peyman";

echo "<h1>Hola, $nombre</h1>";

?>
```

The browser does not receive the PHP source code.

It receives something similar to:

```html
<h1>Hola, Peyman</h1>
```

This is one of the main differences between **server-side programming** and **client-side programming**.

---

# 🖥️ XAMPP Control Panel

After installing XAMPP on Windows, the main administration tool is:

```text
XAMPP Control Panel
```

From this interface it is possible to start and stop the different services.

The most common modules are:

```text
Apache
MySQL
FileZilla
Mercury
Tomcat
```

For PHP development, the most important service is:

```text
Apache
```

For applications that use databases, normally both services are started:

```text
Apache
MySQL
```

---

## ▶️ Starting Apache

Open:

```text
XAMPP Control Panel
```

Find:

```text
Apache
```

and press:

```text
Start
```

When Apache starts successfully, the module normally becomes highlighted and displays its process ID and ports.

Common Apache ports are:

```text
80
443
```

Apache must remain running while testing PHP applications.

---

# 📁 XAMPP Installation Directory

The recommended Windows installation directory is:

```text
C:\xampp
```

A typical XAMPP installation contains folders such as:

```text
C:\xampp\
│
├── apache\
├── htdocs\
├── mysql\
├── php\
├── phpMyAdmin\
├── tmp\
└── xampp-control.exe
```

Each directory has a specific purpose.

---

## 📂 `apache`

Contains the Apache web server files and configuration.

Example:

```text
C:\xampp\apache
```

Apache is responsible for receiving HTTP requests from the browser and serving the application.

---

## 📂 `php`

Contains the PHP interpreter and its configuration.

Example:

```text
C:\xampp\php
```

One important PHP configuration file is:

```text
php.ini
```

It controls PHP settings such as:

- File upload limits
- Memory limits
- PHP extensions
- Error reporting
- Time zone configuration

---

## 📂 `mysql`

Contains the MariaDB/MySQL database server files.

Example:

```text
C:\xampp\mysql
```

This component is used when PHP applications need persistent data.

Examples include:

- Users
- Products
- Contacts
- Messages
- Orders
- Login credentials

---

# 🌍 The `htdocs` Folder

One of the most important XAMPP directories is:

```text
C:\xampp\htdocs
```

`htdocs` is the **document root** of the local Apache server.

Web projects placed inside this directory can be accessed through:

```text
http://localhost/
```

For example:

```text
C:\xampp\htdocs\Sesion-04
```

can be accessed using:

```text
http://localhost/Sesion-04/
```

If the project contains:

```text
tarjeta.php
```

the complete address becomes:

```text
http://localhost/Sesion-04/tarjeta.php
```

---

# 🔗 Relationship Between File Paths and URLs

Local Windows path:

```text
C:\xampp\htdocs\Sesion-04\tarjeta.php
```

Browser URL:

```text
http://localhost/Sesion-04/tarjeta.php
```

The part:

```text
C:\xampp\htdocs
```

is replaced by:

```text
http://localhost
```

Therefore:

```text
C:\xampp\htdocs\Proyecto\archivo.php
```

becomes:

```text
http://localhost/Proyecto/archivo.php
```

---

# 🧪 Why `localhost`?

`localhost` represents the computer currently being used.

It normally resolves to the loopback IP address:

```text
127.0.0.1
```

Therefore:

```text
http://localhost
```

and:

```text
http://127.0.0.1
```

normally refer to the same local machine.

The application is not automatically available on the public Internet.

It is running locally on the developer's computer.

---

# 🗄️ MariaDB / MySQL

XAMPP includes **MariaDB**, a relational database system compatible with MySQL for most common web-development tasks.

PHP applications can connect to MariaDB to:

- Create records
- Read records
- Update information
- Delete information
- Authenticate users
- Store application data

These four fundamental database operations are commonly called:

```text
CRUD
```

which means:

```text
Create
Read
Update
Delete
```

---

# 🗃️ phpMyAdmin

XAMPP also includes **phpMyAdmin**.

phpMyAdmin provides a graphical web interface for working with MariaDB/MySQL databases.

After starting:

```text
Apache
MySQL
```

phpMyAdmin can normally be accessed at:

```text
http://localhost/phpmyadmin
```

From phpMyAdmin it is possible to:

- Create databases
- Create tables
- Insert records
- Edit records
- Delete records
- Run SQL queries
- Import databases
- Export databases
- Manage database structures

---

# ⬇️ Downloading XAMPP

XAMPP should be downloaded from the official **Apache Friends** website.

Official website:

```text
https://www.apachefriends.org/
```

Official downloads:

```text
https://www.apachefriends.org/download.html
```

For a modern Windows computer, use:

```text
XAMPP for Windows — 64 bit
```

The exact PHP version may vary depending on the version currently available.

For this course, a current PHP 8.x version is sufficient for the exercises being developed.

---

# 🛠️ Installation on Windows

## Step 1 — Download

Open the Apache Friends website and download:

```text
XAMPP for Windows
```

---

## Step 2 — Run the Installer

Open the downloaded `.exe` installer.

Windows may display a security or administrator warning.

Allow the installer to continue.

---

## Step 3 — Select Components

Important components include:

```text
Apache
PHP
MySQL / MariaDB
phpMyAdmin
```

For this course, keeping the standard XAMPP components installed is convenient because later sessions use databases.

---

## Step 4 — Choose Installation Directory

Recommended location:

```text
C:\xampp
```

Avoid unnecessarily complicated paths such as:

```text
C:\Program Files\...
```

because permissions can sometimes make local development more difficult.

---

## Step 5 — Complete Installation

Wait until XAMPP finishes copying and configuring its components.

Then open:

```text
XAMPP Control Panel
```

---

# ✅ Testing the Installation

Start:

```text
Apache
```

Then visit:

```text
http://localhost
```

If the XAMPP dashboard appears, Apache is working correctly.

---

## Testing PHP

Create:

```text
C:\xampp\htdocs\test.php
```

with:

```php
<?php

echo "PHP is working correctly!";

?>
```

Then visit:

```text
http://localhost/test.php
```

Expected result:

```text
PHP is working correctly!
```

This confirms that:

```text
Browser
+
Apache
+
PHP
```

are communicating correctly.

---

# 🔢 Ports

Web servers communicate using network ports.

Apache commonly uses:

```text
HTTP  → Port 80
HTTPS → Port 443
```

MariaDB/MySQL commonly uses:

```text
3306
```

When Apache starts, the XAMPP Control Panel may display:

```text
80, 443
```

---

# ⚠️ Apache Port Conflicts

Sometimes Apache cannot start because another application is already using port `80`.

Possible causes include:

- IIS
- Another Apache installation
- Another web server
- Development software
- Some network applications

A typical error may indicate that the port is already in use.

One solution is to configure Apache to use another port, such as:

```text
8080
```

Then the application would be accessed using:

```text
http://localhost:8080/
```

instead of:

```text
http://localhost/
```

---

# 🛑 Apache vs MySQL

It is important to understand that Apache and MySQL are different services.

### Apache

Responsible for:

```text
HTTP
HTML
PHP
Web applications
```

### MySQL / MariaDB

Responsible for:

```text
Databases
Tables
Records
SQL
Persistent information
```

For a simple PHP page:

```text
Apache ✅
MySQL ❌ Not required
```

For a PHP application using a database:

```text
Apache ✅
MySQL ✅
```

---

# 🔒 Local Development and Security

XAMPP is designed primarily as a **development environment**.

It is convenient for:

- Learning PHP
- Building university projects
- Testing websites
- Practicing databases
- Developing locally

A standard XAMPP installation should not automatically be treated as a production-ready Internet server.

Production environments require additional security configuration.

---

# 🧑‍💻 XAMPP and Visual Studio Code

XAMPP and Visual Studio Code serve different purposes.

### Visual Studio Code

Used to:

```text
Write code
Edit files
Manage project folders
Use Git
Use the terminal
```

### XAMPP

Used to:

```text
Run Apache
Execute PHP
Run MariaDB
Provide localhost
Provide phpMyAdmin
```

They work together:

```text
Visual Studio Code
        ↓
Write PHP
        ↓
C:\xampp\htdocs
        ↓
Apache / XAMPP
        ↓
PHP
        ↓
Browser
```

---

# 🔄 Development Workflow

A common workflow is:

```text
1. Open project in VS Code
        ↓
2. Write PHP / HTML / CSS
        ↓
3. Save the files
        ↓
4. Start Apache in XAMPP
        ↓
5. Open localhost
        ↓
6. Test application
        ↓
7. Fix errors
        ↓
8. Test again
        ↓
9. Commit changes with Git
        ↓
10. Push project to GitHub
```

---

# 🧪 XAMPP in Sesión 04

For this session, the project is:

```text
Tarjeta de Presentación Dinámica
```

The executable files are:

```text
Sesion-04/
├── tarjeta.php
└── estilos.css
```

To execute the application locally, the working copy can be placed at:

```text
C:\xampp\htdocs\Sesion-04
```

Then Apache is started using XAMPP.

The application is opened at:

```text
http://localhost/Sesion-04/tarjeta.php
```

---

# 🔄 GitHub vs XAMPP

The GitHub repository and XAMPP serve different purposes.

### GitHub

Stores and versions the project's source code:

```text
UPBC-Homework/
└── Aplicaciones-Web/
    └── Sesion-04/
```

### XAMPP

Executes the PHP project locally:

```text
C:\xampp\htdocs\Sesion-04\
```

GitHub does not execute PHP directly.

XAMPP provides the local server required to process it.

---

# 🧠 Important Concepts

```text
XAMPP
│
├── Apache
│   └── Web Server
│
├── PHP
│   └── Server-Side Language
│
├── MariaDB
│   └── Database Server
│
├── phpMyAdmin
│   └── Database Management Interface
│
└── htdocs
    └── Local Web Projects
```

---

# 📌 Useful Local Addresses

| Purpose | Address |
|---|---|
| Local server | `http://localhost/` |
| phpMyAdmin | `http://localhost/phpmyadmin/` |
| Sesión 04 | `http://localhost/Sesion-04/` |
| Presentation Card | `http://localhost/Sesion-04/tarjeta.php` |

---

# 🛠️ Common Commands and Paths

### XAMPP installation

```text
C:\xampp
```

### Web projects

```text
C:\xampp\htdocs
```

### PHP installation

```text
C:\xampp\php
```

### Apache installation

```text
C:\xampp\apache
```

### MariaDB installation

```text
C:\xampp\mysql
```

### XAMPP Control Panel

```text
C:\xampp\xampp-control.exe
```

---

# 🧯 Basic Troubleshooting

If a PHP project does not open correctly, verify:

```text
✓ XAMPP is installed
✓ Apache is running
✓ Project is inside htdocs
✓ File extension is .php
✓ URL begins with http://localhost
✓ File name is correct
✓ PHP syntax contains no errors
```

If PHP code appears as plain text in the browser, the file is probably not being processed by Apache.

Do not open the PHP file using:

```text
file:///C:/xampp/htdocs/...
```

Instead use:

```text
http://localhost/...
```

---

# 🎯 Why XAMPP is Important

XAMPP provides a simple environment where students can experience the same fundamental architecture used by real web applications:

```text
Client
↓
Web Server
↓
Server-Side Application
↓
Database
```

Understanding this environment prepares developers for technologies such as:

- PHP
- MySQL / MariaDB
- MVC
- Laravel
- REST APIs
- Authentication systems
- CRUD applications
- Backend development

---

# 📚 Key Takeaways

After configuring XAMPP, a developer should understand:

- Why PHP requires a server.
- What Apache does.
- What `localhost` means.
- What `htdocs` is.
- How PHP files are executed.
- The difference between Apache and MariaDB.
- What phpMyAdmin is used for.
- How Visual Studio Code and XAMPP work together.
- How local development differs from GitHub hosting.
- How to test PHP applications safely before deployment.

---

## 👨‍💻 Author

**Peyman Miyandashti**  
Information Technology and Digital Innovation Engineering  
Universidad Politécnica de Baja California — UPBC

---

> 🟧 **XAMPP Local Development Environment**  
> Apache · PHP · MariaDB · phpMyAdmin · localhost · Backend Development
