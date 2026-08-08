<?php

require_once __DIR__ . '/../models/Contacto.php';

class ContactoController
{
    private $modelo;

    public function __construct()
    {
        $this->modelo = new Contacto();
    }

    /**
     * Mostrar la lista de contactos
     */
    public function lista()
    {
        $contactos = $this->modelo->obtenerTodos();

        $titulo = 'Lista de Contactos';
        $vista = __DIR__ . '/../views/contactos/lista.php';

        require __DIR__ . '/../views/layout.php';
    }

    /**
     * Mostrar el formulario para crear un contacto
     */
    public function formulario()
    {
        $titulo = 'Nuevo Contacto';
        $contacto = null;

        $vista = __DIR__ . '/../views/contactos/formulario.php';

        require __DIR__ . '/../views/layout.php';
    }

    /**
     * Guardar un nuevo contacto
     */
    public function guardar()
    {
        if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
            header('Location: index.php?accion=lista');
            exit;
        }

        $nombre = trim($_POST['nombre'] ?? '');
        $correo = trim($_POST['correo'] ?? '');
        $telefono = trim($_POST['telefono'] ?? '');

        if ($nombre === '' || $correo === '') {
            $error = 'El nombre y el correo son obligatorios.';

            $titulo = 'Nuevo Contacto';
            $contacto = [
                'nombre' => $nombre,
                'correo' => $correo,
                'telefono' => $telefono
            ];

            $vista = __DIR__ . '/../views/contactos/formulario.php';

            require __DIR__ . '/../views/layout.php';
            return;
        }

        if (!filter_var($correo, FILTER_VALIDATE_EMAIL)) {
            $error = 'Ingresa un correo electrónico válido.';

            $titulo = 'Nuevo Contacto';
            $contacto = [
                'nombre' => $nombre,
                'correo' => $correo,
                'telefono' => $telefono
            ];

            $vista = __DIR__ . '/../views/contactos/formulario.php';

            require __DIR__ . '/../views/layout.php';
            return;
        }

        $this->modelo->crear(
            $nombre,
            $correo,
            $telefono
        );

        header('Location: index.php?accion=lista');
        exit;
    }

    /**
     * Mostrar formulario para editar un contacto
     */
    public function editar()
    {
        $id = (int) ($_GET['id'] ?? 0);

        $contacto = $this->modelo->obtenerPorId($id);

        if (!$contacto) {
            header('Location: index.php?accion=lista');
            exit;
        }

        $titulo = 'Editar Contacto';
        $vista = __DIR__ . '/../views/contactos/formulario.php';

        require __DIR__ . '/../views/layout.php';
    }

    /**
     * Actualizar un contacto existente
     */
    public function actualizar()
    {
        if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
            header('Location: index.php?accion=lista');
            exit;
        }

        $id = (int) ($_POST['id'] ?? 0);
        $nombre = trim($_POST['nombre'] ?? '');
        $correo = trim($_POST['correo'] ?? '');
        $telefono = trim($_POST['telefono'] ?? '');

        if ($id <= 0 || $nombre === '' || $correo === '') {
            header('Location: index.php?accion=lista');
            exit;
        }

        if (!filter_var($correo, FILTER_VALIDATE_EMAIL)) {
            $error = 'Ingresa un correo electrónico válido.';

            $contacto = [
                'id' => $id,
                'nombre' => $nombre,
                'correo' => $correo,
                'telefono' => $telefono
            ];

            $titulo = 'Editar Contacto';
            $vista = __DIR__ . '/../views/contactos/formulario.php';

            require __DIR__ . '/../views/layout.php';
            return;
        }

        $this->modelo->actualizar(
            $id,
            $nombre,
            $correo,
            $telefono
        );

        header('Location: index.php?accion=lista');
        exit;
    }

    /**
     * Eliminar un contacto
     */
    public function eliminar()
    {
        $id = (int) ($_GET['id'] ?? 0);

        if ($id > 0) {
            $this->modelo->eliminar($id);
        }

        header('Location: index.php?accion=lista');
        exit;
    }
}
