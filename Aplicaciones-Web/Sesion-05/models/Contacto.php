<?php

require_once __DIR__ . '/../config/database.php';

class Contacto
{
    private $pdo;

    public function __construct()
    {
        $this->pdo = obtenerConexion();
    }

    /**
     * Obtener todos los contactos
     */
    public function obtenerTodos()
    {
        $sql = "SELECT * FROM contactos ORDER BY id DESC";

        $stmt = $this->pdo->prepare($sql);
        $stmt->execute();

        return $stmt->fetchAll();
    }

    /**
     * Obtener un contacto por ID
     */
    public function obtenerPorId($id)
    {
        $sql = "SELECT * FROM contactos WHERE id = :id";

        $stmt = $this->pdo->prepare($sql);

        $stmt->execute([
            ':id' => $id
        ]);

        return $stmt->fetch();
    }

    /**
     * Crear un nuevo contacto
     */
    public function crear($nombre, $correo, $telefono)
    {
        $sql = "INSERT INTO contactos
                (nombre, correo, telefono)
                VALUES
                (:nombre, :correo, :telefono)";

        $stmt = $this->pdo->prepare($sql);

        return $stmt->execute([
            ':nombre' => $nombre,
            ':correo' => $correo,
            ':telefono' => $telefono
        ]);
    }

    /**
     * Actualizar un contacto
     */
    public function actualizar($id, $nombre, $correo, $telefono)
    {
        $sql = "UPDATE contactos
                SET nombre = :nombre,
                    correo = :correo,
                    telefono = :telefono
                WHERE id = :id";

        $stmt = $this->pdo->prepare($sql);

        return $stmt->execute([
            ':id' => $id,
            ':nombre' => $nombre,
            ':correo' => $correo,
            ':telefono' => $telefono
        ]);
    }

    /**
     * Eliminar un contacto
     */
    public function eliminar($id)
    {
        $sql = "DELETE FROM contactos WHERE id = :id";

        $stmt = $this->pdo->prepare($sql);

        return $stmt->execute([
            ':id' => $id
        ]);
    }
}
