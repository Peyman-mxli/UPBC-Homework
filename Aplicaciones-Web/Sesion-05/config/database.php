<?php

// Configuración de la base de datos
define('DB_HOST', 'localhost');
define('DB_NAME', 'mi_proyecto');
define('DB_USER', 'root');
define('DB_PASS', '');

function obtenerConexion()
{
    $dsn = 'mysql:host=' . DB_HOST .
           ';dbname=' . DB_NAME .
           ';charset=utf8mb4';

    $opciones = [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
    ];

    try {

        $pdo = new PDO(
            $dsn,
            DB_USER,
            DB_PASS,
            $opciones
        );

        return $pdo;

    } catch (PDOException $e) {

        die(
            'Error de conexión a la base de datos: ' .
            $e->getMessage()
        );
    }
}
