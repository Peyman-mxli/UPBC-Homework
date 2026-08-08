<?php

$esEdicion = !empty($contacto) && !empty($contacto['id']);

$accionFormulario = $esEdicion
    ? 'index.php?accion=actualizar'
    : 'index.php?accion=guardar';

?>

<section class="formulario-contacto">

    <div class="cabecera-seccion">

        <div>
            <h2>
                <?php echo $esEdicion
                    ? '✏️ Editar Contacto'
                    : '➕ Nuevo Contacto';
                ?>
            </h2>

            <p>
                <?php echo $esEdicion
                    ? 'Modifica la información del contacto.'
                    : 'Completa los datos para registrar un nuevo contacto.';
                ?>
            </p>
        </div>

    </div>

    <?php if (!empty($error)): ?>

        <div class="mensaje-error">
            <?php echo htmlspecialchars($error); ?>
        </div>

    <?php endif; ?>

    <form
        action="<?php echo $accionFormulario; ?>"
        method="POST"
        class="formulario"
    >

        <?php if ($esEdicion): ?>

            <input
                type="hidden"
                name="id"
                value="<?php echo (int) $contacto['id']; ?>"
            >

        <?php endif; ?>


        <div class="campo">

            <label for="nombre">
                Nombre completo
            </label>

            <input
                type="text"
                id="nombre"
                name="nombre"
                placeholder="Ejemplo: Peyman Miyandashti"
                value="<?php echo htmlspecialchars($contacto['nombre'] ?? ''); ?>"
                required
            >

        </div>


        <div class="campo">

            <label for="correo">
                Correo electrónico
            </label>

            <input
                type="email"
                id="correo"
                name="correo"
                placeholder="ejemplo@correo.com"
                value="<?php echo htmlspecialchars($contacto['correo'] ?? ''); ?>"
                required
            >

        </div>


        <div class="campo">

            <label for="telefono">
                Teléfono
            </label>

            <input
                type="text"
                id="telefono"
                name="telefono"
                placeholder="Ejemplo: 686 123 4567"
                value="<?php echo htmlspecialchars($contacto['telefono'] ?? ''); ?>"
            >

        </div>


        <div class="acciones-formulario">

            <button type="submit" class="boton">

                <?php echo $esEdicion
                    ? 'Guardar cambios'
                    : 'Guardar contacto';
                ?>

            </button>

            <a
                href="index.php?accion=lista"
                class="boton-secundario"
            >
                Cancelar
            </a>

        </div>

    </form>

</section>
