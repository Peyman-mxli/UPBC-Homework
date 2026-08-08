<section class="seccion-contactos">

    <div class="cabecera-seccion">

        <div>
            <h2>📋 Lista de Contactos</h2>
            <p>Administra los contactos registrados en el sistema.</p>
        </div>

        <a href="index.php?accion=formulario" class="boton">
            + Nuevo contacto
        </a>

    </div>

    <?php if (empty($contactos)): ?>

        <div class="mensaje-vacio">

            <h3>📭 No hay contactos registrados</h3>

            <p>
                Todavía no existen contactos en la base de datos.
            </p>

            <a href="index.php?accion=formulario" class="boton">
                Crear primer contacto
            </a>

        </div>

    <?php else: ?>

        <div class="tabla-contenedor">

            <table>

                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Correo</th>
                        <th>Teléfono</th>
                        <th>Fecha de registro</th>
                        <th>Acciones</th>
                    </tr>
                </thead>

                <tbody>

                    <?php foreach ($contactos as $contacto): ?>

                        <tr>

                            <td>
                                <?php echo htmlspecialchars($contacto['id']); ?>
                            </td>

                            <td>
                                <?php echo htmlspecialchars($contacto['nombre']); ?>
                            </td>

                            <td>
                                <?php echo htmlspecialchars($contacto['correo']); ?>
                            </td>

                            <td>
                                <?php
                                echo htmlspecialchars(
                                    $contacto['telefono'] ?: 'Sin teléfono'
                                );
                                ?>
                            </td>

                            <td>
                                <?php echo htmlspecialchars($contacto['creado_en']); ?>
                            </td>

                            <td class="acciones">

                                <a
                                    href="index.php?accion=editar&id=<?php echo (int) $contacto['id']; ?>"
                                    class="boton-editar"
                                >
                                    Editar
                                </a>

                                <a
                                    href="index.php?accion=eliminar&id=<?php echo (int) $contacto['id']; ?>"
                                    class="boton-eliminar"
                                    onclick="return confirm('¿Estás seguro de eliminar este contacto?');"
                                >
                                    Eliminar
                                </a>

                            </td>

                        </tr>

                    <?php endforeach; ?>

                </tbody>

            </table>

        </div>

    <?php endif; ?>

</section>
