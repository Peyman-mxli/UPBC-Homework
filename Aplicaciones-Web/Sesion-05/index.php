<?php

require_once __DIR__ . '/controllers/ContactoController.php';

$controller = new ContactoController();

$accion = $_GET['accion'] ?? 'lista';

switch ($accion) {

    case 'lista':
        $controller->lista();
        break;

    case 'formulario':
        $controller->formulario();
        break;

    case 'guardar':
        $controller->guardar();
        break;

    case 'editar':
        $controller->editar();
        break;

    case 'actualizar':
        $controller->actualizar();
        break;

    case 'eliminar':
        $controller->eliminar();
        break;

    default:
        $controller->lista();
        break;
}
