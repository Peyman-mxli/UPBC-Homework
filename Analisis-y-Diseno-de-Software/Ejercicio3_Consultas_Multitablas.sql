IF OBJECT_ID('estudiantes') IS NOT NULL
    DROP TABLE estudiantes;

IF OBJECT_ID('cursos') IS NOT NULL
    DROP TABLE cursos;

CREATE TABLE cursos (
    codigo INT PRIMARY KEY,
    nombre VARCHAR(50)
);

CREATE TABLE estudiantes (
    codigo INT PRIMARY KEY,
    nombre VARCHAR(50),
    edad INT,
    codigocurso INT,
    FOREIGN KEY (codigocurso) REFERENCES cursos(codigo)
);

INSERT INTO cursos VALUES (1, 'Matematicas');
INSERT INTO cursos VALUES (2, 'Programacion');
INSERT INTO cursos VALUES (3, 'Base de Datos');
INSERT INTO cursos VALUES (4, 'Ingles');

INSERT INTO estudiantes VALUES (1, 'Juan Perez', 20, 1);
INSERT INTO estudiantes VALUES (2, 'Maria Lopez', 22, 2);
INSERT INTO estudiantes VALUES (3, 'Carlos Garcia', 21, 3);
INSERT INTO estudiantes VALUES (4, 'Ana Torres', 19, 2);
INSERT INTO estudiantes VALUES (5, 'Pedro Ramirez', 23, 1);

SELECT
    e.nombre AS Estudiante,
    e.edad AS Edad,
    c.nombre AS Curso
FROM estudiantes AS e
INNER JOIN cursos AS c
    ON e.codigocurso = c.codigo;

SELECT
    e.nombre AS Estudiante,
    c.nombre AS Curso
FROM estudiantes AS e
INNER JOIN cursos AS c
    ON e.codigocurso = c.codigo
WHERE c.nombre = 'Programacion';

SELECT
    c.nombre AS Curso,
    e.nombre AS Estudiante
FROM cursos AS c
LEFT JOIN estudiantes AS e
    ON c.codigo = e.codigocurso
ORDER BY c.nombre;
