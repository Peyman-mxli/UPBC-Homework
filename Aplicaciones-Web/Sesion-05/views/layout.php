<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>
        <?php echo htmlspecialchars($titulo ?? 'Contactos'); ?>
    </title>

    <link rel="stylesheet" href="public/estilos.css">
</head>

<body>

    <header class="encabezado">
        <div class="contenedor">

            <h1>📇 Gestor de Contactos</h1>

            <nav>
                <a href="index.php?accion=lista">
                    Contactos
                </a>

                <a href="index.php?accion=formulario">
                    Nuevo contacto
                </a>
            </nav>

        </div>
    </header>

    <main class="contenedor">

        <?php
        if (isset($vista) && file_exists($vista)) {
            require $vista;
        }
        ?>

    </main>

    <footer>
        <p>
            Aplicaciones Web — Sesión 05 |
            Universidad Politécnica de Baja California
        </p>
    </footer>

</body>

</html>
