<?php

$mostrar_tarjeta = false;
$errores = [];

$nombre = '';
$carrera = '';
$semestre = '';
$frase = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $nombre = trim($_POST['nombre'] ?? '');
    $carrera = trim($_POST['carrera'] ?? '');
    $semestre = trim($_POST['semestre'] ?? '');
    $frase = trim($_POST['frase'] ?? '');

    if (empty($nombre)) {
        $errores['nombre'] = 'El nombre es obligatorio.';
    }

    if (empty($carrera)) {
        $errores['carrera'] = 'La carrera es obligatoria.';
    }

    if (empty($semestre)) {
        $errores['semestre'] = 'El semestre es obligatorio.';
    }

    if (empty($frase)) {
        $errores['frase'] = 'La frase personal es obligatoria.';
    }

    if (empty($errores)) {
        $mostrar_tarjeta = true;
    }
}

?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Tarjeta de presentación</title>

    <link rel="stylesheet" href="estilos.css">
</head>

<body>

    <main class="contenedor">

        <h1>Generador de Tarjeta de Presentación</h1>

        <p class="descripcion">
            Completa el formulario para generar tu tarjeta personal.
        </p>

        <?php if ($mostrar_tarjeta): ?>

            <section class="tarjeta">

                <div class="avatar">
                    <?php
                    echo htmlspecialchars(
                        strtoupper(substr($nombre, 0, 1))
                    );
                    ?>
                </div>

                <h2>
                    <?php echo htmlspecialchars($nombre); ?>
                </h2>

                <p class="carrera">
                    <?php echo htmlspecialchars($carrera); ?>
                </p>

                <p>
                    <strong>Semestre:</strong>
                    <?php echo htmlspecialchars($semestre); ?>
                </p>

                <blockquote>
                    “<?php echo htmlspecialchars($frase); ?>”
                </blockquote>

            </section>

            <a class="boton-secundario" href="tarjeta.php">
                Generar otra tarjeta
            </a>

        <?php else: ?>

            <?php if (!empty($errores)): ?>

                <div class="errores">

                    <h3>Por favor corrige los siguientes campos:</h3>

                    <?php foreach ($errores as $mensaje): ?>

                        <p>
                            <?php echo htmlspecialchars($mensaje); ?>
                        </p>

                    <?php endforeach; ?>

                </div>

            <?php endif; ?>

            <form action="tarjeta.php" method="POST">

                <div class="campo">

                    <label for="nombre">
                        Nombre completo
                    </label>

                    <input
                        type="text"
                        id="nombre"
                        name="nombre"
                        placeholder="Ejemplo: Peyman Miyandashti"
                        value="<?php echo htmlspecialchars($nombre); ?>"
                    >

                </div>

                <div class="campo">

                    <label for="carrera">
                        Carrera
                    </label>

                    <input
                        type="text"
                        id="carrera"
                        name="carrera"
                        placeholder="Ejemplo: Ingeniería en Tecnologías de la Información"
                        value="<?php echo htmlspecialchars($carrera); ?>"
                    >

                </div>

                <div class="campo">

                    <label for="semestre">
                        Semestre / Cuatrimestre
                    </label>

                    <input
                        type="number"
                        id="semestre"
                        name="semestre"
                        min="1"
                        max="15"
                        placeholder="Ejemplo: 4"
                        value="<?php echo htmlspecialchars($semestre); ?>"
                    >

                </div>

                <div class="campo">

                    <label for="frase">
                        Frase personal
                    </label>

                    <textarea
                        id="frase"
                        name="frase"
                        rows="4"
                        placeholder="Escribe una frase que te represente..."
                    ><?php echo htmlspecialchars($frase); ?></textarea>

                </div>

                <button type="submit">
                    Generar tarjeta
                </button>

            </form>

        <?php endif; ?>

    </main>

</body>

</html>
